import 'package:dio/dio.dart';

import 'models/conference_detail_response.dart';
import 'models/conference_request.dart';
import 'models/conference_search_options.dart';
import 'models/conference_short_response.dart';
import 'models/conference_updating_request.dart';

class ConferenceApi {
  final Dio _dio;

  ConferenceApi(this._dio);

  Future<ConferenceSearchOptions> getSearchOptions() async {
    final response = await _dio.get('/conferences_search_options');
    return ConferenceSearchOptions.fromJson(response.data);
  }

  Future<List<ConferenceShortResponse>> getConferencesList({
    String? name,
    int? cityId,
    int? topicId,
    String? startDate,
    String? endDate,
    String? description,
    String? contacts,
    String? imageUrl,
  }) async {
    final response = await _dio.get('/conferences_list', queryParameters: {
      'name': name,
      'cityId': cityId,
      'topicId': topicId,
      'startDate': startDate,
      'endDate': endDate,
      'description': description,
      'contacts': contacts,
      'imageUrl': imageUrl,
    });

    return (response.data as List<dynamic>)
        .map((item) => ConferenceShortResponse.fromJson(item))
        .toList();
  }

  Future<void> createConference(ConferenceRequest request) => _dio.post(
        '/create_conference',
        data: request.toJson(),
      );

  Future<ConferenceDetailResponse> getConferenceDetails(
      int conferenceId) async {
    final response = await _dio.get(
      '/conference/$conferenceId',
    );
    return ConferenceDetailResponse.fromJson(response.data);
  }

  Future<void> updateConference(int conferenceId, ConferenceUpdatingRequest request) =>
      _dio.put(
        '/conference/$conferenceId',
        data: request.toJson(),
      );

  Future<void> deleteConference(int conferenceId) => _dio.post(
        '/delete_conference/$conferenceId',
      );
}
