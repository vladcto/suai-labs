package suai.vladcto.services.conference

import kotlinx.serialization.Serializable
import suai.vladcto.services.city.City
import suai.vladcto.services.topic.Topic

@Serializable
data class ConferenceSearchOptions(
    val cities: List<City>,
    val topics: List<Topic>
)