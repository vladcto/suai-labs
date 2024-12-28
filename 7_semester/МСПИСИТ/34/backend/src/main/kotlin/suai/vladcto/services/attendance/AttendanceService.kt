package suai.vladcto.services.attendance

import suai.vladcto.db.DatabaseFactory

class AttendanceService {

    fun getParticipantCount(conferenceId: Int): Int {
        val connection = DatabaseFactory.getConnection()
        val query = "SELECT COUNT(*) as count FROM ConferenceAttendance WHERE conference_id = ?"

        connection.prepareStatement(query).use { preparedStatement ->
            preparedStatement.setInt(1, conferenceId)
            val resultSet = preparedStatement.executeQuery()
            return if (resultSet.next()) {
                resultSet.getInt("count")
            } else {
                0
            }
        }
    }

    fun registerAttendance(username: String, conferenceId: Int): Boolean {
        val connection = DatabaseFactory.getConnection()
        val query =
            "INSERT INTO ConferenceAttendance (user_username, conference_id) VALUES (?, ?)"

        connection.prepareStatement(query).use { preparedStatement ->
            try {
                preparedStatement.setString(1, username)
                preparedStatement.setInt(2, conferenceId)
                preparedStatement.executeUpdate()
                return true
            } catch (e: Exception) {
                e.printStackTrace()
                return false
            }
        }
    }

    fun cancelAttendance(username: String, conferenceId: Int): Boolean {
        val connection = DatabaseFactory.getConnection()
        val query = "DELETE FROM ConferenceAttendance WHERE user_username = ? AND conference_id = ?"

        connection.prepareStatement(query).use { preparedStatement ->
            try {
                preparedStatement.setString(1, username)
                preparedStatement.setInt(2, conferenceId)
                val rowsAffected = preparedStatement.executeUpdate()
                return rowsAffected > 0
            } catch (e: Exception) {
                e.printStackTrace()
                return false
            }
        }
    }
}
