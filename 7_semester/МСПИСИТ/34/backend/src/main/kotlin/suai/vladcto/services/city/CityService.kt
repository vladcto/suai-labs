package suai.vladcto.services.city

import suai.vladcto.db.DatabaseFactory
import java.sql.SQLException

class CityService {

    fun getCityNameById(cityId: Int): String? {
        val query = "SELECT name FROM Cities WHERE id = ?"

        return try {
            val connection = DatabaseFactory.getConnection()

            connection.prepareStatement(query).use { preparedStatement ->
                preparedStatement.setInt(1, cityId)
                val resultSet = preparedStatement.executeQuery()

                if (resultSet.next()) {
                    resultSet.getString("name")
                } else {
                    null // Если город с таким ID не найден
                }
            }
        } catch (e: SQLException) {
            null
        }
    }
}
