package suai.vladcto.routing

import io.ktor.http.HttpStatusCode
import io.ktor.server.application.Application
import io.ktor.server.request.receive
import io.ktor.server.response.respond
import io.ktor.server.routing.get
import io.ktor.server.routing.post
import io.ktor.server.routing.routing
import suai.vladcto.services.auth.AuthService
import suai.vladcto.services.city.CityService
import suai.vladcto.services.conference.ConferenceRequest
import suai.vladcto.services.conference.ConferenceService
import suai.vladcto.services.conference.ConferenceUpdateRequest
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

        get("/conferences_search_options") {
            val searchOptions = conferenceService.getSearchOptions()
            call.respond(HttpStatusCode.OK, searchOptions)
        }

        get("/conferences_list") {
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

        postAuthorized(authService, "/create_conference") { username ->
            val conferenceRequest = call.receive<ConferenceRequest>()

            if (conferenceRequest.name.isBlank() || conferenceRequest.cityId <= 0 || conferenceRequest.topicId <= 0 ||
                conferenceRequest.startDate.isBlank() || conferenceRequest.endDate.isBlank()
            ) {
                call.respond(HttpStatusCode.BadRequest, "Missing or invalid conference data")
                return@postAuthorized
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

        getAuthorized(authService, "/conference/{id}") { username ->
            val conferenceId = call.parameters["id"]?.toIntOrNull()
            if (conferenceId == null) {
                call.respond(HttpStatusCode.BadRequest, "Invalid conference ID")
                return@getAuthorized
            }

            val result = conferenceService.getConferenceDetails(conferenceId, username)

            result.onSuccess { conferenceDetails ->
                call.respond(HttpStatusCode.OK, conferenceDetails)
            }.onFailure { error ->
                call.respond(
                    HttpStatusCode.NotFound,
                    error.message ?: "Conference not found"
                )
            }
        }

        putAuthorized(authService, "/conference/{id}") { username ->
            val conferenceId = call.parameters["id"]?.toIntOrNull()
            if (conferenceId == null) {
                call.respond(HttpStatusCode.BadRequest, "Invalid conference ID")
                return@putAuthorized
            }

            val updateRequest = call.receive<ConferenceUpdateRequest>()

            val result = conferenceService.updateConference(
                conferenceId = conferenceId,
                username = username,
                name = updateRequest.name,
                cityId = updateRequest.cityId,
                topicId = updateRequest.topicId,
                startDate = updateRequest.startDate,
                endDate = updateRequest.endDate,
                description = updateRequest.description,
                contacts = updateRequest.contacts,
                imageUrl = updateRequest.imageUrl,
            )

            result.onSuccess {
                call.respond(HttpStatusCode.OK, "Conference updated successfully")
            }.onFailure { error ->
                call.respond(
                    HttpStatusCode.Conflict,
                    error.message ?: "Error updating conference"
                )
            }
        }

        postAuthorized(authService, "/delete_conference/{id}") { username ->
            val conferenceId = call.parameters["id"]?.toIntOrNull()
            if (conferenceId == null) {
                call.respond(HttpStatusCode.BadRequest, "Invalid conference ID")
                return@postAuthorized
            }

            val result = conferenceService.deleteConference(conferenceId, username)

            result.onSuccess {
                call.respond(HttpStatusCode.OK, "Conference deleted successfully")
            }.onFailure { error ->
                call.respond(
                    HttpStatusCode.Conflict,
                    error.message ?: "Error deleting conference"
                )
            }
        }
    }
}
