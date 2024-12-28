package suai.vladcto.services.auth

import suai.vladcto.db.DatabaseFactory
import java.security.MessageDigest
import java.sql.Connection
import java.sql.Types
import java.util.UUID

class AuthService {

    fun registerUser(username: String, password: String): Result<String> {
        val connection = DatabaseFactory.getConnection()

        val passwordHash = hashPassword(password)
        val token = generateToken()

        val resultingToken = callRegisterNewUserProcedure(connection, username, passwordHash, token)
        return Result.success(resultingToken)
    }

    fun verifyToken(token: String?): String? {
        if (token == null) return null

        val connection = DatabaseFactory.getConnection()
        val query = "SELECT username FROM Users WHERE token = ?"
        connection.prepareStatement(query).use { preparedStatement ->
            preparedStatement.setString(1, token)
            val resultSet = preparedStatement.executeQuery()
            return if (resultSet.next()) {
                resultSet.getString("username")
            } else {
                null
            }
        }
    }

    private fun callRegisterNewUserProcedure(
        connection: Connection,
        username: String,
        passwordHash: String,
        token: String
    ): String {
        val procedureCall = "{ CALL RegisterNewUser(?, ?, ?, ?) }"
        connection.prepareCall(procedureCall).use { callableStatement ->
            callableStatement.setString(1, username)
            callableStatement.setString(2, passwordHash)
            callableStatement.setString(3, token)
            callableStatement.registerOutParameter(4, Types.VARCHAR)

            callableStatement.execute()

            return callableStatement.getString(4)
        }
    }

    private fun generateToken(): String = UUID.randomUUID().toString()

    private fun hashPassword(password: String): String =
        MessageDigest.getInstance("SHA-256")
            .digest(password.toByteArray())
            .joinToString("") { "%02x".format(it) }
}
