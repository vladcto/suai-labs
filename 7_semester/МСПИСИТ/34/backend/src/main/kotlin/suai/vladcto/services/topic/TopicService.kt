package suai.vladcto.services.topic

import suai.vladcto.db.DatabaseFactory
import java.sql.SQLException

class TopicService {

    fun getTopicNameById(topicId: Int): String? {
        val query = "SELECT name FROM Topics WHERE id = ?"

        return try {
            val connection = DatabaseFactory.getConnection()

            connection.prepareStatement(query).use { preparedStatement ->
                preparedStatement.setInt(1, topicId)
                val resultSet = preparedStatement.executeQuery()

                if (resultSet.next()) {
                    resultSet.getString("name")
                } else {
                    null // Если топик с таким ID не найден
                }
            }
        } catch (e: SQLException) {
            null
        }
    }
}