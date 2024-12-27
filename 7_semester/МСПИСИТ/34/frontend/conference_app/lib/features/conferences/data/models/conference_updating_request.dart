import 'package:freezed_annotation/freezed_annotation.dart';

part 'conference_updating_request.freezed.dart';
part 'conference_updating_request.g.dart';

@freezed
class ConferenceUpdatingRequest with _$ConferenceUpdatingRequest {
  const factory ConferenceUpdatingRequest({
    String? name,
    int? cityId,
    int? topicId,
    String? startDate,
    String? endDate,
    String? description,
    String? contacts,
    String? imageUrl,
  }) = _ConferenceUpdatingRequest;

  factory ConferenceUpdatingRequest.fromJson(Map<String, Object?> json) =>
      _$ConferenceUpdatingRequestFromJson(json);
}
