// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'conference_search_options.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ConferenceSearchOptions _$ConferenceSearchOptionsFromJson(
    Map<String, dynamic> json) {
  return _ConferenceSearchOptions.fromJson(json);
}

/// @nodoc
mixin _$ConferenceSearchOptions {
  List<City> get cities => throw _privateConstructorUsedError;
  List<Topic> get topics => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ConferenceSearchOptionsCopyWith<ConferenceSearchOptions> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConferenceSearchOptionsCopyWith<$Res> {
  factory $ConferenceSearchOptionsCopyWith(ConferenceSearchOptions value,
          $Res Function(ConferenceSearchOptions) then) =
      _$ConferenceSearchOptionsCopyWithImpl<$Res, ConferenceSearchOptions>;
  @useResult
  $Res call({List<City> cities, List<Topic> topics});
}

/// @nodoc
class _$ConferenceSearchOptionsCopyWithImpl<$Res,
        $Val extends ConferenceSearchOptions>
    implements $ConferenceSearchOptionsCopyWith<$Res> {
  _$ConferenceSearchOptionsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cities = null,
    Object? topics = null,
  }) {
    return _then(_value.copyWith(
      cities: null == cities
          ? _value.cities
          : cities // ignore: cast_nullable_to_non_nullable
              as List<City>,
      topics: null == topics
          ? _value.topics
          : topics // ignore: cast_nullable_to_non_nullable
              as List<Topic>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ConferenceSearchOptionsImplCopyWith<$Res>
    implements $ConferenceSearchOptionsCopyWith<$Res> {
  factory _$$ConferenceSearchOptionsImplCopyWith(
          _$ConferenceSearchOptionsImpl value,
          $Res Function(_$ConferenceSearchOptionsImpl) then) =
      __$$ConferenceSearchOptionsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<City> cities, List<Topic> topics});
}

/// @nodoc
class __$$ConferenceSearchOptionsImplCopyWithImpl<$Res>
    extends _$ConferenceSearchOptionsCopyWithImpl<$Res,
        _$ConferenceSearchOptionsImpl>
    implements _$$ConferenceSearchOptionsImplCopyWith<$Res> {
  __$$ConferenceSearchOptionsImplCopyWithImpl(
      _$ConferenceSearchOptionsImpl _value,
      $Res Function(_$ConferenceSearchOptionsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cities = null,
    Object? topics = null,
  }) {
    return _then(_$ConferenceSearchOptionsImpl(
      cities: null == cities
          ? _value._cities
          : cities // ignore: cast_nullable_to_non_nullable
              as List<City>,
      topics: null == topics
          ? _value._topics
          : topics // ignore: cast_nullable_to_non_nullable
              as List<Topic>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ConferenceSearchOptionsImpl implements _ConferenceSearchOptions {
  const _$ConferenceSearchOptionsImpl(
      {required final List<City> cities, required final List<Topic> topics})
      : _cities = cities,
        _topics = topics;

  factory _$ConferenceSearchOptionsImpl.fromJson(Map<String, dynamic> json) =>
      _$$ConferenceSearchOptionsImplFromJson(json);

  final List<City> _cities;
  @override
  List<City> get cities {
    if (_cities is EqualUnmodifiableListView) return _cities;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_cities);
  }

  final List<Topic> _topics;
  @override
  List<Topic> get topics {
    if (_topics is EqualUnmodifiableListView) return _topics;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_topics);
  }

  @override
  String toString() {
    return 'ConferenceSearchOptions(cities: $cities, topics: $topics)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConferenceSearchOptionsImpl &&
            const DeepCollectionEquality().equals(other._cities, _cities) &&
            const DeepCollectionEquality().equals(other._topics, _topics));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_cities),
      const DeepCollectionEquality().hash(_topics));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ConferenceSearchOptionsImplCopyWith<_$ConferenceSearchOptionsImpl>
      get copyWith => __$$ConferenceSearchOptionsImplCopyWithImpl<
          _$ConferenceSearchOptionsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ConferenceSearchOptionsImplToJson(
      this,
    );
  }
}

abstract class _ConferenceSearchOptions implements ConferenceSearchOptions {
  const factory _ConferenceSearchOptions(
      {required final List<City> cities,
      required final List<Topic> topics}) = _$ConferenceSearchOptionsImpl;

  factory _ConferenceSearchOptions.fromJson(Map<String, dynamic> json) =
      _$ConferenceSearchOptionsImpl.fromJson;

  @override
  List<City> get cities;
  @override
  List<Topic> get topics;
  @override
  @JsonKey(ignore: true)
  _$$ConferenceSearchOptionsImplCopyWith<_$ConferenceSearchOptionsImpl>
      get copyWith => throw _privateConstructorUsedError;
}
