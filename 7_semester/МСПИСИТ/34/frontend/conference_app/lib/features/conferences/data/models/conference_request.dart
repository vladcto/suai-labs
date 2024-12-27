
import 'package:freezed_annotation/freezed_annotation.dart';

part 'conference_request.freezed.dart';
part 'conference_request.g.dart';

@freezed
class ConferenceRequest with _$ConferenceRequest {
  const factory ConferenceRequest({
    required String name,
    required int cityId,
    required int topicId,
    required String startDate,
    required String endDate,
    required String description,
    required String contacts,
    required String imageUrl,
  }) = _ConferenceRequest;

  factory ConferenceRequest.fromJson(Map<String, dynamic> json) => _$ConferenceRequestFromJson(json);
}
