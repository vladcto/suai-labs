// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'conference_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ConferenceRequestImpl _$$ConferenceRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$ConferenceRequestImpl(
      name: json['name'] as String,
      cityId: (json['cityId'] as num).toInt(),
      topicId: (json['topicId'] as num).toInt(),
      startDate: json['startDate'] as String,
      endDate: json['endDate'] as String,
      description: json['description'] as String,
      contacts: json['contacts'] as String,
      imageUrl: json['imageUrl'] as String,
    );

Map<String, dynamic> _$$ConferenceRequestImplToJson(
        _$ConferenceRequestImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'cityId': instance.cityId,
      'topicId': instance.topicId,
      'startDate': instance.startDate,
      'endDate': instance.endDate,
      'description': instance.description,
      'contacts': instance.contacts,
      'imageUrl': instance.imageUrl,
    };
