// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'conference_detail_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ConferenceDetailResponseImpl _$$ConferenceDetailResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$ConferenceDetailResponseImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      city: json['city'] as String,
      topic: json['topic'] as String,
      startDate: json['startDate'] as String,
      endDate: json['endDate'] as String,
      description: json['description'] as String,
      contacts: json['contacts'] as String,
      canRedact: json['canRedact'] as bool,
      participantCount: (json['participantCount'] as num).toInt(),
      isUserAttending: json['isUserAttending'] as bool,
    );

Map<String, dynamic> _$$ConferenceDetailResponseImplToJson(
        _$ConferenceDetailResponseImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'city': instance.city,
      'topic': instance.topic,
      'startDate': instance.startDate,
      'endDate': instance.endDate,
      'description': instance.description,
      'contacts': instance.contacts,
      'canRedact': instance.canRedact,
      'participantCount': instance.participantCount,
      'isUserAttending': instance.isUserAttending,
    };
