package suai.vladcto.services.conference

import kotlinx.serialization.Serializable


@Serializable
data class ConferenceShortResponse(
    val id: Int,
    val name: String,
    val city: String,
    val topic: String,
    val startDate: String,
    val endDate: String,
    val participantCount: Int,
    val isUserAttending: Boolean
)

@Serializable
data class ConferenceDetailResponse(
    val id: Int,
    val name: String,
    val city: String,
    val topic: String,
    val startDate: String,
    val endDate: String,
    val description: String,
    val contacts: String,
    val canRedact: Boolean,
    val participantCount: Int,
    val isUserAttending: Boolean
)
