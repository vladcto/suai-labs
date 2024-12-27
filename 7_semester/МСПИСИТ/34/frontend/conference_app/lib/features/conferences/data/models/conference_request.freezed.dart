// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'conference_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ConferenceRequest _$ConferenceRequestFromJson(Map<String, dynamic> json) {
  return _ConferenceRequest.fromJson(json);
}

/// @nodoc
mixin _$ConferenceRequest {
  String get name => throw _privateConstructorUsedError;
  int get cityId => throw _privateConstructorUsedError;
  int get topicId => throw _privateConstructorUsedError;
  String get startDate => throw _privateConstructorUsedError;
  String get endDate => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get contacts => throw _privateConstructorUsedError;
  String get imageUrl => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ConferenceRequestCopyWith<ConferenceRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConferenceRequestCopyWith<$Res> {
  factory $ConferenceRequestCopyWith(
          ConferenceRequest value, $Res Function(ConferenceRequest) then) =
      _$ConferenceRequestCopyWithImpl<$Res, ConferenceRequest>;
  @useResult
  $Res call(
      {String name,
      int cityId,
      int topicId,
      String startDate,
      String endDate,
      String description,
      String contacts,
      String imageUrl});
}

/// @nodoc
class _$ConferenceRequestCopyWithImpl<$Res, $Val extends ConferenceRequest>
    implements $ConferenceRequestCopyWith<$Res> {
  _$ConferenceRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? cityId = null,
    Object? topicId = null,
    Object? startDate = null,
    Object? endDate = null,
    Object? description = null,
    Object? contacts = null,
    Object? imageUrl = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      cityId: null == cityId
          ? _value.cityId
          : cityId // ignore: cast_nullable_to_non_nullable
              as int,
      topicId: null == topicId
          ? _value.topicId
          : topicId // ignore: cast_nullable_to_non_nullable
              as int,
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as String,
      endDate: null == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      contacts: null == contacts
          ? _value.contacts
          : contacts // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ConferenceRequestImplCopyWith<$Res>
    implements $ConferenceRequestCopyWith<$Res> {
  factory _$$ConferenceRequestImplCopyWith(_$ConferenceRequestImpl value,
          $Res Function(_$ConferenceRequestImpl) then) =
      __$$ConferenceRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      int cityId,
      int topicId,
      String startDate,
      String endDate,
      String description,
      String contacts,
      String imageUrl});
}

/// @nodoc
class __$$ConferenceRequestImplCopyWithImpl<$Res>
    extends _$ConferenceRequestCopyWithImpl<$Res, _$ConferenceRequestImpl>
    implements _$$ConferenceRequestImplCopyWith<$Res> {
  __$$ConferenceRequestImplCopyWithImpl(_$ConferenceRequestImpl _value,
      $Res Function(_$ConferenceRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? cityId = null,
    Object? topicId = null,
    Object? startDate = null,
    Object? endDate = null,
    Object? description = null,
    Object? contacts = null,
    Object? imageUrl = null,
  }) {
    return _then(_$ConferenceRequestImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      cityId: null == cityId
          ? _value.cityId
          : cityId // ignore: cast_nullable_to_non_nullable
              as int,
      topicId: null == topicId
          ? _value.topicId
          : topicId // ignore: cast_nullable_to_non_nullable
              as int,
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as String,
      endDate: null == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      contacts: null == contacts
          ? _value.contacts
          : contacts // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ConferenceRequestImpl implements _ConferenceRequest {
  const _$ConferenceRequestImpl(
      {required this.name,
      required this.cityId,
      required this.topicId,
      required this.startDate,
      required this.endDate,
      required this.description,
      required this.contacts,
      required this.imageUrl});

  factory _$ConferenceRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$ConferenceRequestImplFromJson(json);

  @override
  final String name;
  @override
  final int cityId;
  @override
  final int topicId;
  @override
  final String startDate;
  @override
  final String endDate;
  @override
  final String description;
  @override
  final String contacts;
  @override
  final String imageUrl;

  @override
  String toString() {
    return 'ConferenceRequest(name: $name, cityId: $cityId, topicId: $topicId, startDate: $startDate, endDate: $endDate, description: $description, contacts: $contacts, imageUrl: $imageUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConferenceRequestImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.cityId, cityId) || other.cityId == cityId) &&
            (identical(other.topicId, topicId) || other.topicId == topicId) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.contacts, contacts) ||
                other.contacts == contacts) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, cityId, topicId, startDate,
      endDate, description, contacts, imageUrl);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ConferenceRequestImplCopyWith<_$ConferenceRequestImpl> get copyWith =>
      __$$ConferenceRequestImplCopyWithImpl<_$ConferenceRequestImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ConferenceRequestImplToJson(
      this,
    );
  }
}

abstract class _ConferenceRequest implements ConferenceRequest {
  const factory _ConferenceRequest(
      {required final String name,
      required final int cityId,
      required final int topicId,
      required final String startDate,
      required final String endDate,
      required final String description,
      required final String contacts,
      required final String imageUrl}) = _$ConferenceRequestImpl;

  factory _ConferenceRequest.fromJson(Map<String, dynamic> json) =
      _$ConferenceRequestImpl.fromJson;

  @override
  String get name;
  @override
  int get cityId;
  @override
  int get topicId;
  @override
  String get startDate;
  @override
  String get endDate;
  @override
  String get description;
  @override
  String get contacts;
  @override
  String get imageUrl;
  @override
  @JsonKey(ignore: true)
  _$$ConferenceRequestImplCopyWith<_$ConferenceRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
