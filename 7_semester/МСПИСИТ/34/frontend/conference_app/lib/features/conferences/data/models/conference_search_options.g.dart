// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'conference_search_options.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ConferenceSearchOptionsImpl _$$ConferenceSearchOptionsImplFromJson(
        Map<String, dynamic> json) =>
    _$ConferenceSearchOptionsImpl(
      cities: (json['cities'] as List<dynamic>)
          .map((e) => City.fromJson(e as Map<String, dynamic>))
          .toList(),
      topics: (json['topics'] as List<dynamic>)
          .map((e) => Topic.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ConferenceSearchOptionsImplToJson(
        _$ConferenceSearchOptionsImpl instance) =>
    <String, dynamic>{
      'cities': instance.cities,
      'topics': instance.topics,
    };
