// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'conference_short_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ConferenceShortResponse _$ConferenceShortResponseFromJson(
    Map<String, dynamic> json) {
  return _ConferenceShortResponse.fromJson(json);
}

/// @nodoc
mixin _$ConferenceShortResponse {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get city => throw _privateConstructorUsedError;
  String get topic => throw _privateConstructorUsedError;
  String get startDate => throw _privateConstructorUsedError;
  String get endDate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ConferenceShortResponseCopyWith<ConferenceShortResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConferenceShortResponseCopyWith<$Res> {
  factory $ConferenceShortResponseCopyWith(ConferenceShortResponse value,
          $Res Function(ConferenceShortResponse) then) =
      _$ConferenceShortResponseCopyWithImpl<$Res, ConferenceShortResponse>;
  @useResult
  $Res call(
      {int id,
      String name,
      String city,
      String topic,
      String startDate,
      String endDate});
}

/// @nodoc
class _$ConferenceShortResponseCopyWithImpl<$Res,
        $Val extends ConferenceShortResponse>
    implements $ConferenceShortResponseCopyWith<$Res> {
  _$ConferenceShortResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? city = null,
    Object? topic = null,
    Object? startDate = null,
    Object? endDate = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      city: null == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
      topic: null == topic
          ? _value.topic
          : topic // ignore: cast_nullable_to_non_nullable
              as String,
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as String,
      endDate: null == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ConferenceShortResponseImplCopyWith<$Res>
    implements $ConferenceShortResponseCopyWith<$Res> {
  factory _$$ConferenceShortResponseImplCopyWith(
          _$ConferenceShortResponseImpl value,
          $Res Function(_$ConferenceShortResponseImpl) then) =
      __$$ConferenceShortResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String name,
      String city,
      String topic,
      String startDate,
      String endDate});
}

/// @nodoc
class __$$ConferenceShortResponseImplCopyWithImpl<$Res>
    extends _$ConferenceShortResponseCopyWithImpl<$Res,
        _$ConferenceShortResponseImpl>
    implements _$$ConferenceShortResponseImplCopyWith<$Res> {
  __$$ConferenceShortResponseImplCopyWithImpl(
      _$ConferenceShortResponseImpl _value,
      $Res Function(_$ConferenceShortResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? city = null,
    Object? topic = null,
    Object? startDate = null,
    Object? endDate = null,
  }) {
    return _then(_$ConferenceShortResponseImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      city: null == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
      topic: null == topic
          ? _value.topic
          : topic // ignore: cast_nullable_to_non_nullable
              as String,
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as String,
      endDate: null == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ConferenceShortResponseImpl implements _ConferenceShortResponse {
  const _$ConferenceShortResponseImpl(
      {required this.id,
      required this.name,
      required this.city,
      required this.topic,
      required this.startDate,
      required this.endDate});

  factory _$ConferenceShortResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$ConferenceShortResponseImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final String city;
  @override
  final String topic;
  @override
  final String startDate;
  @override
  final String endDate;

  @override
  String toString() {
    return 'ConferenceShortResponse(id: $id, name: $name, city: $city, topic: $topic, startDate: $startDate, endDate: $endDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConferenceShortResponseImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.topic, topic) || other.topic == topic) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, city, topic, startDate, endDate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ConferenceShortResponseImplCopyWith<_$ConferenceShortResponseImpl>
      get copyWith => __$$ConferenceShortResponseImplCopyWithImpl<
          _$ConferenceShortResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ConferenceShortResponseImplToJson(
      this,
    );
  }
}

abstract class _ConferenceShortResponse implements ConferenceShortResponse {
  const factory _ConferenceShortResponse(
      {required final int id,
      required final String name,
      required final String city,
      required final String topic,
      required final String startDate,
      required final String endDate}) = _$ConferenceShortResponseImpl;

  factory _ConferenceShortResponse.fromJson(Map<String, dynamic> json) =
      _$ConferenceShortResponseImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  String get city;
  @override
  String get topic;
  @override
  String get startDate;
  @override
  String get endDate;
  @override
  @JsonKey(ignore: true)
  _$$ConferenceShortResponseImplCopyWith<_$ConferenceShortResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}
