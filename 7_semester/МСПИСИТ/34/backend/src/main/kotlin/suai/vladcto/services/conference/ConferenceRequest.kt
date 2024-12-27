package suai.vladcto.services.conference

import kotlinx.serialization.Serializable

@Serializable
data class ConferenceRequest(
    val name: String,
    val cityId: Int,
    val topicId: Int,
    val startDate: String,
    val endDate: String,
    val description: String,
    val contacts: String,
    val imageUrl: String,
)
