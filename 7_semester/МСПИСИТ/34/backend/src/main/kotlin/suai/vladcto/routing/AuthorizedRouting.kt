package suai.vladcto.routing

import io.ktor.http.HttpStatusCode
import io.ktor.server.application.ApplicationCallPipeline
import io.ktor.server.application.ApplicationCallPipeline.ApplicationPhase.Plugins
import io.ktor.server.application.call
import io.ktor.server.response.respond
import io.ktor.server.routing.Route
import io.ktor.server.routing.intercept
import io.ktor.server.routing.route
import suai.vladcto.services.auth.AuthService

//fun Route.authorized(authService: AuthService, build: Route.(String) -> Unit) {
//    route("/{...}") {
//        handle {
//            val token = call.request.headers["Authorization"]
//            val username = authService.verifyToken(token)
//            if (username == null) {
//                call.respond(HttpStatusCode.Unauthorized, "Invalid token")
//                return@handle
//            } else {
//                build(username)
//            }
//        }
//    }
//}

fun Route.authorized(authService: AuthService, build: Route.(String) -> Unit) {
    intercept(Plugins) {
        val token = call.request.headers["Authorization"]
        val username = authService.verifyToken(token)
        if (username == null) {
            call.respond(HttpStatusCode.Unauthorized, "Invalid token")
            finish()
        } else {
            proceed()
            build(username)
        }
    }
}