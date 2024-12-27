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
                    null
                }
            }
        } catch (e: SQLException) {
            null
        }
    }

    fun getAllTopics(): List<Topic> {
        try {
            val query = "SELECT id, name FROM Topics"
            val topics = mutableListOf<Topic>()
            val connection = DatabaseFactory.getConnection()
            connection.createStatement().use { statement ->
                val resultSet = statement.executeQuery(query)
                while (resultSet.next()) {
                    val id = resultSet.getInt("id")
                    val name = resultSet.getString("name")
                    topics.add(Topic(id, name))
                }
            }
            return topics
        } catch (e: SQLException) {
            return listOf()
        }
    }
}