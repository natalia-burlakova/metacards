// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'creative_work.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CreativeWork _$CreativeWorkFromJson(Map<String, dynamic> json) {
  return _CreativeWork.fromJson(json);
}

/// @nodoc
mixin _$CreativeWork {
  List<int> get emotions => throw _privateConstructorUsedError;
  int get currentEmotionIndex => throw _privateConstructorUsedError;
  List<int> get verbs => throw _privateConstructorUsedError;
  int get currentVerbIndex => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CreativeWorkCopyWith<CreativeWork> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreativeWorkCopyWith<$Res> {
  factory $CreativeWorkCopyWith(
          CreativeWork value, $Res Function(CreativeWork) then) =
      _$CreativeWorkCopyWithImpl<$Res, CreativeWork>;
  @useResult
  $Res call(
      {List<int> emotions,
      int currentEmotionIndex,
      List<int> verbs,
      int currentVerbIndex});
}

/// @nodoc
class _$CreativeWorkCopyWithImpl<$Res, $Val extends CreativeWork>
    implements $CreativeWorkCopyWith<$Res> {
  _$CreativeWorkCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? emotions = null,
    Object? currentEmotionIndex = null,
    Object? verbs = null,
    Object? currentVerbIndex = null,
  }) {
    return _then(_value.copyWith(
      emotions: null == emotions
          ? _value.emotions
          : emotions // ignore: cast_nullable_to_non_nullable
              as List<int>,
      currentEmotionIndex: null == currentEmotionIndex
          ? _value.currentEmotionIndex
          : currentEmotionIndex // ignore: cast_nullable_to_non_nullable
              as int,
      verbs: null == verbs
          ? _value.verbs
          : verbs // ignore: cast_nullable_to_non_nullable
              as List<int>,
      currentVerbIndex: null == currentVerbIndex
          ? _value.currentVerbIndex
          : currentVerbIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CreativeWorkCopyWith<$Res>
    implements $CreativeWorkCopyWith<$Res> {
  factory _$$_CreativeWorkCopyWith(
          _$_CreativeWork value, $Res Function(_$_CreativeWork) then) =
      __$$_CreativeWorkCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<int> emotions,
      int currentEmotionIndex,
      List<int> verbs,
      int currentVerbIndex});
}

/// @nodoc
class __$$_CreativeWorkCopyWithImpl<$Res>
    extends _$CreativeWorkCopyWithImpl<$Res, _$_CreativeWork>
    implements _$$_CreativeWorkCopyWith<$Res> {
  __$$_CreativeWorkCopyWithImpl(
      _$_CreativeWork _value, $Res Function(_$_CreativeWork) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? emotions = null,
    Object? currentEmotionIndex = null,
    Object? verbs = null,
    Object? currentVerbIndex = null,
  }) {
    return _then(_$_CreativeWork(
      emotions: null == emotions
          ? _value._emotions
          : emotions // ignore: cast_nullable_to_non_nullable
              as List<int>,
      currentEmotionIndex: null == currentEmotionIndex
          ? _value.currentEmotionIndex
          : currentEmotionIndex // ignore: cast_nullable_to_non_nullable
              as int,
      verbs: null == verbs
          ? _value._verbs
          : verbs // ignore: cast_nullable_to_non_nullable
              as List<int>,
      currentVerbIndex: null == currentVerbIndex
          ? _value.currentVerbIndex
          : currentVerbIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CreativeWork implements _CreativeWork {
  _$_CreativeWork(
      {final List<int> emotions = const [],
      this.currentEmotionIndex = 0,
      final List<int> verbs = const [],
      this.currentVerbIndex = 0})
      : _emotions = emotions,
        _verbs = verbs;

  factory _$_CreativeWork.fromJson(Map<String, dynamic> json) =>
      _$$_CreativeWorkFromJson(json);

  final List<int> _emotions;
  @override
  @JsonKey()
  List<int> get emotions {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_emotions);
  }

  @override
  @JsonKey()
  final int currentEmotionIndex;
  final List<int> _verbs;
  @override
  @JsonKey()
  List<int> get verbs {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_verbs);
  }

  @override
  @JsonKey()
  final int currentVerbIndex;

  @override
  String toString() {
    return 'CreativeWork(emotions: $emotions, currentEmotionIndex: $currentEmotionIndex, verbs: $verbs, currentVerbIndex: $currentVerbIndex)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CreativeWork &&
            const DeepCollectionEquality().equals(other._emotions, _emotions) &&
            (identical(other.currentEmotionIndex, currentEmotionIndex) ||
                other.currentEmotionIndex == currentEmotionIndex) &&
            const DeepCollectionEquality().equals(other._verbs, _verbs) &&
            (identical(other.currentVerbIndex, currentVerbIndex) ||
                other.currentVerbIndex == currentVerbIndex));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_emotions),
      currentEmotionIndex,
      const DeepCollectionEquality().hash(_verbs),
      currentVerbIndex);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CreativeWorkCopyWith<_$_CreativeWork> get copyWith =>
      __$$_CreativeWorkCopyWithImpl<_$_CreativeWork>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CreativeWorkToJson(
      this,
    );
  }
}

abstract class _CreativeWork implements CreativeWork {
  factory _CreativeWork(
      {final List<int> emotions,
      final int currentEmotionIndex,
      final List<int> verbs,
      final int currentVerbIndex}) = _$_CreativeWork;

  factory _CreativeWork.fromJson(Map<String, dynamic> json) =
      _$_CreativeWork.fromJson;

  @override
  List<int> get emotions;
  @override
  int get currentEmotionIndex;
  @override
  List<int> get verbs;
  @override
  int get currentVerbIndex;
  @override
  @JsonKey(ignore: true)
  _$$_CreativeWorkCopyWith<_$_CreativeWork> get copyWith =>
      throw _privateConstructorUsedError;
}
