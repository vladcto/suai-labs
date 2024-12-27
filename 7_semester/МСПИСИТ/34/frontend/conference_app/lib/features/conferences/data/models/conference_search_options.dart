import 'package:freezed_annotation/freezed_annotation.dart';

import 'city.dart';
import 'topic.dart';

part 'conference_search_options.freezed.dart';
part 'conference_search_options.g.dart';

@freezed
class ConferenceSearchOptions with _$ConferenceSearchOptions {
  const factory ConferenceSearchOptions({
    required List<City> cities,
    required List<Topic> topics,
  }) = _ConferenceSearchOptions;

  factory ConferenceSearchOptions.fromJson(Map<String, dynamic> json) =>
      _$ConferenceSearchOptionsFromJson(json);
}
