package suai.vladcto.services.conference

import suai.vladcto.db.DatabaseFactory
import suai.vladcto.services.city.CityService
import suai.vladcto.services.topic.TopicService
import java.sql.ResultSet
import java.sql.SQLException

class ConferenceService(
    private val topicService: TopicService,
    private val cityService: CityService,
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

    fun getSearchOptions(): ConferenceSearchOptions {
        val cities = cityService.getAllCities()
        val topics = topicService.getAllTopics()

        return ConferenceSearchOptions(
            cities = cities,
            topics = topics,
        )
    }

    fun updateConference(
        conferenceId: Int,
        username: String,
        name: String? = null,
        cityId: Int? = null,
        topicId: Int? = null,
        startDate: String? = null,
        endDate: String? = null,
        description: String? = null,
        contacts: String? = null,
        imageUrl: String? = null
    ): Result<Boolean> {
        return try {
            if (!isUserAuthorOfConference(conferenceId, username)) {
                return Result.failure(SecurityException("User $username is not the author of the conference."))
            }

            val connection = DatabaseFactory.getConnection()
            val updateQuery = StringBuilder("UPDATE Conferences SET ")

            val updates = mutableListOf<String>()
            name?.let { updates.add("name = '$it'") }
            cityId?.let { updates.add("city_id = $it") }
            topicId?.let { updates.add("topic_id = $it") }
            startDate?.let { updates.add("start_date = '$it'") }
            endDate?.let { updates.add("end_date = '$it'") }
            description?.let { updates.add("description = '$it'") }
            contacts?.let { updates.add("contacts = '$it'") }
            imageUrl?.let { updates.add("image_url = '$it'") }

            if (updates.isEmpty()) {
                return Result.failure(IllegalArgumentException("No fields to update"))
            }

            updateQuery.append(updates.joinToString(", "))
            updateQuery.append(" WHERE id = $conferenceId")

            // Debug: print the SQL query
            println("Executing SQL: $updateQuery")

            connection.createStatement().use { statement ->
                val rowsAffected = statement.executeUpdate(updateQuery.toString())
                if (rowsAffected > 0) {
                    Result.success(true)
                } else {
                    Result.failure(SQLException("No conference found with id: $conferenceId"))
                }
            }
        } catch (e: SQLException) {
            Result.failure(e)
        }
    }

    fun deleteConference(conferenceId: Int, username: String): Result<Boolean> {
        return try {
            if (!isUserAuthorOfConference(conferenceId, username)) {
                return Result.failure(SQLException("User is not the author of the conference"))
            }

            val connection = DatabaseFactory.getConnection()
            val sql = "DELETE FROM Conferences WHERE id = ?"

            connection.prepareStatement(sql).use { preparedStatement ->
                preparedStatement.setInt(1, conferenceId)
                val rowsAffected = preparedStatement.executeUpdate()

                if (rowsAffected > 0) {
                    Result.success(true)
                } else {
                    Result.failure(SQLException("Could not delete conference with id: $conferenceId"))
                }
            }
        } catch (e: SQLException) {
            Result.failure(e)
        }
    }


    fun getConferenceDetails(
        conferenceId: Int, username: String
    ): Result<ConferenceDetailResponse> {
        return try {
            val connection = DatabaseFactory.getConnection()

            val sql = "SELECT * FROM Conferences WHERE id = ?"

            connection.prepareStatement(sql).use { preparedStatement ->
                preparedStatement.setInt(1, conferenceId)

                val resultSet = preparedStatement.executeQuery()
                if (resultSet.next()) {
                    val conferenceDetail = ConferenceDetailResponse(
                        id = resultSet.getInt("id"),
                        name = resultSet.getString("name"),
                        city = cityService.getCityNameById(resultSet.getInt("city_id")) ?: "",
                        topic = topicService.getTopicNameById(resultSet.getInt("topic_id")) ?: "",
                        startDate = resultSet.getString("start_date"),
                        endDate = resultSet.getString("end_date"),
                        description = resultSet.getString("description"),
                        contacts = resultSet.getString("contacts"),
                        canRedact = isUserAuthorOfConference(conferenceId, username)
                    )
                    Result.success(conferenceDetail)
                } else {
                    Result.failure(SQLException("No conference found with id: $conferenceId"))
                }
            }
        } catch (e: SQLException) {
            Result.failure(e)
        }
    }

    private fun isUserAuthorOfConference(conferenceId: Int, username: String): Boolean {
        return try {
            val connection = DatabaseFactory.getConnection()
            val sql = "SELECT author_username FROM Conferences WHERE id = ?"

            connection.prepareStatement(sql).use { preparedStatement ->
                preparedStatement.setInt(1, conferenceId)

                val resultSet = preparedStatement.executeQuery()
                if (resultSet.next()) {
                    val authorUsername = resultSet.getString("author_username")
                    authorUsername == username
                } else {
                    false
                }
            }
        } catch (e: SQLException) {
            false
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
