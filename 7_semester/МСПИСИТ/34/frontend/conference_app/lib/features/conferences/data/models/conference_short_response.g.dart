// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'conference_short_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ConferenceShortResponseImpl _$$ConferenceShortResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$ConferenceShortResponseImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      city: json['city'] as String,
      topic: json['topic'] as String,
      startDate: json['startDate'] as String,
      endDate: json['endDate'] as String,
    );

Map<String, dynamic> _$$ConferenceShortResponseImplToJson(
        _$ConferenceShortResponseImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'city': instance.city,
      'topic': instance.topic,
      'startDate': instance.startDate,
      'endDate': instance.endDate,
    };
