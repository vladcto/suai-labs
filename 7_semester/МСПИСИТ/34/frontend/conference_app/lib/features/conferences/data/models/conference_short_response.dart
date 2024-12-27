import 'package:freezed_annotation/freezed_annotation.dart';

part 'conference_short_response.freezed.dart';
part 'conference_short_response.g.dart';

@freezed
class ConferenceShortResponse with _$ConferenceShortResponse {
  const factory ConferenceShortResponse({
    required int id,
    required String name,
    required String city,
    required String topic,
    required String startDate,
    required String endDate,
  }) = _ConferenceShortResponse;

  factory ConferenceShortResponse.fromJson(Map<String, dynamic> json) =>
      _$ConferenceShortResponseFromJson(json);
}
