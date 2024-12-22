package suai.vladcto.services.auth

import suai.vladcto.db.DatabaseFactory
import java.security.MessageDigest
import java.sql.Connection
import java.util.UUID

class AuthService {

    fun registerUser(username: String, password: String): Result<String> {
        val connection = DatabaseFactory.getConnection()

        val existingToken = getTokenIfUserExist(connection, username)
        if (existingToken != null) {
            return Result.success(existingToken)
        }

        val passwordHash = hashPassword(password)
        val token = generateToken()
        insertUser(connection, username, passwordHash, token)

        return Result.success(token)
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

    private fun getTokenIfUserExist(connection: Connection, username: String): String? {
        val query = "SELECT token FROM Users WHERE username = ?"
        connection.prepareStatement(query).use { preparedStatement ->
            preparedStatement.setString(1, username)
            val resultSet = preparedStatement.executeQuery()
            return if (resultSet.next()) {
                resultSet.getString("token")
            } else {
                null
            }
        }
    }

    private fun insertUser(
        connection: Connection, username: String, passwordHash: String, token: String
    ) {
        val query = "INSERT INTO Users (username, password_hash, token) VALUES (?, ?, ?)"
        connection.prepareStatement(query).use { preparedStatement ->
            preparedStatement.setString(1, username)
            preparedStatement.setString(2, passwordHash)
            preparedStatement.setString(3, token)
            preparedStatement.executeUpdate()
        }
    }

    private fun generateToken(): String {
        return UUID.randomUUID().toString()
    }

    private fun hashPassword(password: String): String {
        return MessageDigest.getInstance("SHA-256").digest(password.toByteArray())
            .joinToString("") { "%02x".format(it) }
    }
}
