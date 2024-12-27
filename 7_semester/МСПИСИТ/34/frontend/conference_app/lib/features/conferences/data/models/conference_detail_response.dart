import 'package:freezed_annotation/freezed_annotation.dart';

part 'conference_detail_response.freezed.dart';
part 'conference_detail_response.g.dart';

@freezed
class ConferenceDetailResponse with _$ConferenceDetailResponse {
  const factory ConferenceDetailResponse({
    required int id,
    required String name,
    required String city,
    required String topic,
    required String startDate,
    required String endDate,
    required String description,
    required String contacts,
    required bool canRedact,
  }) = _ConferenceDetailResponse;

  factory ConferenceDetailResponse.fromJson(Map<String, dynamic> json) =>
      _$ConferenceDetailResponseFromJson(json);
}
