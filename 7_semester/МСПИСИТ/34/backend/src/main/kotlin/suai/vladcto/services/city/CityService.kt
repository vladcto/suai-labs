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
                    null
                }
            }
        } catch (e: SQLException) {
            null
        }
    }

    fun getAllCities(): List<City> {
        try {
            val query = "SELECT id, name FROM Cities"
            val cities = mutableListOf<City>()
            val connection = DatabaseFactory.getConnection()

            connection.createStatement().use { statement ->
                val resultSet = statement.executeQuery(query)

                while (resultSet.next()) {
                    val id = resultSet.getInt("id")
                    val name = resultSet.getString("name")
                    cities.add(City(id, name))
                }
            }
            return cities
        } catch (e: SQLException) {
            return listOf()
        }
    }
}
