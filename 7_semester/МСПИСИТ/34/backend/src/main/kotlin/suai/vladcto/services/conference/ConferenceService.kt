package suai.vladcto.services.conference

import suai.vladcto.db.DatabaseFactory
import suai.vladcto.services.city.CityService
import suai.vladcto.services.topic.TopicService
import java.sql.ResultSet
import java.sql.SQLException

class ConferenceService(
    val topicService: TopicService,
    val cityService: CityService,
) {
    fun createConference(
        name: String,
        cityId: Int,
        topicId: Int,
        authorUsername: String,
        startDate: String,
        endDate: String,
        description: String = "",
        contacts: String = "",
        imageUrl: String = ""
    ): Result<Int> {
        return try {
            val connection = DatabaseFactory.getConnection()
            val sql = """
                INSERT INTO Conferences (
                    name, city_id, topic_id, author_username, start_date, end_date, description, contacts, image_url
                ) VALUES (
                    '$name', $cityId, $topicId, '$authorUsername', '$startDate', '$endDate', '$description', '$contacts', '$imageUrl'
                )
            """

            connection.createStatement().use { statement ->
                statement.executeUpdate(sql, java.sql.Statement.RETURN_GENERATED_KEYS)

                val generatedKeys = statement.generatedKeys
                if (generatedKeys.next()) {
                    Result.success(generatedKeys.getInt(1))
                } else {
                    Result.failure(SQLException("Failed to retrieve conference ID"))
                }
            }
        } catch (e: SQLException) {
            Result.failure(e)
        }
    }


    fun getConferences(filter: ConferenceRequest): List<ConferenceShortResponse> {
        val queryBuilder = StringBuilder("SELECT * FROM Conferences WHERE 1=1")

        if (filter.name.isNotEmpty()) {
            queryBuilder.append(" AND name ILIKE '%${filter.name}%'")
        }
        if (filter.cityId != 0) {
            queryBuilder.append(" AND city_id = ${filter.cityId}")
        }
        if (filter.topicId != 0) {
            queryBuilder.append(" AND topic_id = ${filter.topicId}")
        }
        if (filter.startDate.isNotEmpty()) {
            queryBuilder.append(" AND start_date >= '${filter.startDate}'")
        }
        if (filter.endDate.isNotEmpty()) {
            queryBuilder.append(" AND end_date <= '${filter.endDate}'")
        }

        return try {
            val connection = DatabaseFactory.getConnection()

            connection.createStatement().use { statement ->
                val resultSet = statement.executeQuery(queryBuilder.toString())
                val conferences = mutableListOf<ConferenceShortResponse>()

                while (resultSet.next()) {
                    conferences.add(mapRowToConference(resultSet))
                }

                conferences
            }
        } catch (e: SQLException) {
            emptyList()
        }
    }

    private fun mapRowToConference(rs: ResultSet): ConferenceShortResponse {
        return ConferenceShortResponse(
            id = rs.getInt("id"),
            name = rs.getString("name"),
            city = cityService.getCityNameById(rs.getInt("city_id")) ?: "",
            topic = topicService.getTopicNameById(rs.getInt("topic_id")) ?: "",
            startDate = rs.getString("start_date"),
            endDate = rs.getString("end_date"),
        )
    }

}
