package suai.vladcto.services.conference

data class ConferenceShortResponse (
    val id: Int,
    val name: String,
    val city: String,
    val topic: String,
    val startDate: String,
    val endDate: String,
)

data class ConferenceDetailResponse (
    val id: Int,
    val name: String,
    val cityId: Int,
    val topicId: Int,
    val startDate: String,
    val endDate: String,
    val description: String,
    val contacts: String,
)