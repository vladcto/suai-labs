package suai.vladcto.routing

import io.ktor.http.HttpStatusCode
import io.ktor.server.application.ApplicationCall
import io.ktor.server.response.respond
import io.ktor.server.routing.Route
import io.ktor.server.routing.RoutingContext
import io.ktor.server.routing.get
import io.ktor.server.routing.post
import io.ktor.server.routing.put
import suai.vladcto.services.auth.AuthService

private suspend fun authorizeAndHandle(
    call: ApplicationCall, authService: AuthService, handler: suspend (String) -> Unit
) {
    val username = authService.verifyToken(call.request.headers["Authorization"])
    if (username == null) {
        call.respond(HttpStatusCode.Unauthorized, "Invalid token")
    } else {
        handler(username)
    }
}


fun Route.getAuthorized(
    authService: AuthService,
    path: String,
    handler: suspend RoutingContext.(String) -> Unit
) {
    get(path) {
        authorizeAndHandle(call, authService) { username ->
            handler(username)
        }
    }
}

fun Route.postAuthorized(
    authService: AuthService,
    path: String,
    handler: suspend RoutingContext.(String) -> Unit
) {
    post(path) {
        authorizeAndHandle(call, authService) { username ->
            handler(username)
        }
    }
}

fun Route.putAuthorized(
    authService: AuthService,
    path: String,
    handler: suspend RoutingContext.(String) -> Unit
) {
    put(path) {
        authorizeAndHandle(call, authService) { username ->
            handler(username)
        }
    }
}
