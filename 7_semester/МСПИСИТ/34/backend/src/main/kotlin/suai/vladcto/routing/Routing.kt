package suai.vladcto.routing

import io.ktor.http.ContentType
import io.ktor.http.HttpStatusCode
import io.ktor.server.application.Application
import io.ktor.server.request.receive
import io.ktor.server.request.receiveParameters
import io.ktor.server.response.respond
import io.ktor.server.response.respondText
import io.ktor.server.routing.get
import io.ktor.server.routing.post
import io.ktor.server.routing.routing
import suai.vladcto.services.auth.AuthService
import suai.vladcto.services.city.CityService
import suai.vladcto.services.conference.ConferenceRequest
import suai.vladcto.services.conference.ConferenceService
import suai.vladcto.services.topic.TopicService

fun Application.configureRouting() {
    val authService = AuthService()
    val topicService = TopicService()
    val cityService = CityService()
    val conferenceService = ConferenceService(
        topicService,
        cityService,
    )

    routing {

        get("/") {
            call.respondText("Hello, world!", ContentType.Text.Plain)
        }

        post("/authorize") {
            val params = call.request.queryParameters
            val username = params["name"]
            val password = params["password"]
            if (username.isNullOrBlank() || password.isNullOrBlank()) {
                call.respond(HttpStatusCode.BadRequest, "Invalid user data")
                return@post
            }

            val result = authService.registerUser(username, password)

            result
                .onSuccess { token ->
                    call.respond(HttpStatusCode.Created, mapOf("token" to token))
                }
                .onFailure { error ->
                    call.respond(HttpStatusCode.Conflict, error.message ?: "Registration failed")
                }
        }

        get("/conferences") {
            val name = call.request.queryParameters["name"]
            val cityId = call.request.queryParameters["cityId"]?.toIntOrNull()
            val topicId = call.request.queryParameters["topicId"]?.toIntOrNull()
            val startDate = call.request.queryParameters["startDate"]
            val endDate = call.request.queryParameters["endDate"]
            val description = call.request.queryParameters["description"]
            val contacts = call.request.queryParameters["contacts"]
            val imageUrl = call.request.queryParameters["imageUrl"]

            val filterRequest = ConferenceRequest(
                name = name ?: "",
                cityId = cityId ?: 0,
                topicId = topicId ?: 0,
                startDate = startDate ?: "",
                endDate = endDate ?: "",
                description = description ?: "",
                contacts = contacts ?: "",
                imageUrl = imageUrl ?: ""
            )

            val conferences = conferenceService.getConferences(filterRequest)

            call.respond(HttpStatusCode.OK, conferences)
        }

        authorized(authService) { username ->
            post("/conference") {
                val conferenceRequest = call.receive<ConferenceRequest>()

                if (conferenceRequest.name.isBlank() || conferenceRequest.cityId <= 0 || conferenceRequest.topicId <= 0 ||
                    conferenceRequest.startDate.isBlank() || conferenceRequest.endDate.isBlank()
                ) {
                    call.respond(HttpStatusCode.BadRequest, "Missing or invalid conference data")
                    return@post
                }

                val result = conferenceService.createConference(
                    name = conferenceRequest.name,
                    cityId = conferenceRequest.cityId,
                    topicId = conferenceRequest.topicId,
                    authorUsername = username,
                    startDate = conferenceRequest.startDate,
                    endDate = conferenceRequest.endDate,
                    description = conferenceRequest.description,
                    contacts = conferenceRequest.contacts,
                    imageUrl = conferenceRequest.imageUrl,
                )

                result.onSuccess {
                    call.respond(
                        HttpStatusCode.Created,
                        "Conference created successfully with ID: $it"
                    )
                }.onFailure { error ->
                    call.respond(
                        HttpStatusCode.Conflict,
                        error.message ?: "Error creating conference"
                    )
                }
            }
        }
    }
}
