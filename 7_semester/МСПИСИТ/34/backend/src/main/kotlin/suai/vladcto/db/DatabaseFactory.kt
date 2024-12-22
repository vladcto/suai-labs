package suai.vladcto.db

import java.sql.Connection
import java.sql.DriverManager

object DatabaseFactory {
    private var connection: Connection? = null

    private fun connect() {
        connection = DriverManager.getConnection(
            "jdbc:mysql://localhost:3306/conference",
            "root",
            ""
        )
    }

    fun getConnection(): Connection {
        val connection = this.connection
        if (connection == null || connection.isClosed) {
            connect()
        }
        return this.connection!!
    }
}