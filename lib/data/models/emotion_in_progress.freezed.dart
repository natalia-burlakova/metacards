// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'emotion_in_progress.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

EmotionInProgress _$EmotionInProgressFromJson(Map<String, dynamic> json) {
  return _EmotionInProgress.fromJson(json);
}

/// @nodoc
mixin _$EmotionInProgress {
  int get emotionId => throw _privateConstructorUsedError;
  List<int> get verbIds => throw _privateConstructorUsedError;
  int get currentVerbIndex => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EmotionInProgressCopyWith<EmotionInProgress> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EmotionInProgressCopyWith<$Res> {
  factory $EmotionInProgressCopyWith(
          EmotionInProgress value, $Res Function(EmotionInProgress) then) =
      _$EmotionInProgressCopyWithImpl<$Res, EmotionInProgress>;
  @useResult
  $Res call({int emotionId, List<int> verbIds, int currentVerbIndex});
}

/// @nodoc
class _$EmotionInProgressCopyWithImpl<$Res, $Val extends EmotionInProgress>
    implements $EmotionInProgressCopyWith<$Res> {
  _$EmotionInProgressCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? emotionId = null,
    Object? verbIds = null,
    Object? currentVerbIndex = null,
  }) {
    return _then(_value.copyWith(
      emotionId: null == emotionId
          ? _value.emotionId
          : emotionId // ignore: cast_nullable_to_non_nullable
              as int,
      verbIds: null == verbIds
          ? _value.verbIds
          : verbIds // ignore: cast_nullable_to_non_nullable
              as List<int>,
      currentVerbIndex: null == currentVerbIndex
          ? _value.currentVerbIndex
          : currentVerbIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_EmotionInProgressCopyWith<$Res>
    implements $EmotionInProgressCopyWith<$Res> {
  factory _$$_EmotionInProgressCopyWith(_$_EmotionInProgress value,
          $Res Function(_$_EmotionInProgress) then) =
      __$$_EmotionInProgressCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int emotionId, List<int> verbIds, int currentVerbIndex});
}

/// @nodoc
class __$$_EmotionInProgressCopyWithImpl<$Res>
    extends _$EmotionInProgressCopyWithImpl<$Res, _$_EmotionInProgress>
    implements _$$_EmotionInProgressCopyWith<$Res> {
  __$$_EmotionInProgressCopyWithImpl(
      _$_EmotionInProgress _value, $Res Function(_$_EmotionInProgress) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? emotionId = null,
    Object? verbIds = null,
    Object? currentVerbIndex = null,
  }) {
    return _then(_$_EmotionInProgress(
      emotionId: null == emotionId
          ? _value.emotionId
          : emotionId // ignore: cast_nullable_to_non_nullable
              as int,
      verbIds: null == verbIds
          ? _value._verbIds
          : verbIds // ignore: cast_nullable_to_non_nullable
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
class _$_EmotionInProgress implements _EmotionInProgress {
  _$_EmotionInProgress(
      {this.emotionId = 0,
      final List<int> verbIds = const [],
      this.currentVerbIndex = 0})
      : _verbIds = verbIds;

  factory _$_EmotionInProgress.fromJson(Map<String, dynamic> json) =>
      _$$_EmotionInProgressFromJson(json);

  @override
  @JsonKey()
  final int emotionId;
  final List<int> _verbIds;
  @override
  @JsonKey()
  List<int> get verbIds {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_verbIds);
  }

  @override
  @JsonKey()
  final int currentVerbIndex;

  @override
  String toString() {
    return 'EmotionInProgress(emotionId: $emotionId, verbIds: $verbIds, currentVerbIndex: $currentVerbIndex)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_EmotionInProgress &&
            (identical(other.emotionId, emotionId) ||
                other.emotionId == emotionId) &&
            const DeepCollectionEquality().equals(other._verbIds, _verbIds) &&
            (identical(other.currentVerbIndex, currentVerbIndex) ||
                other.currentVerbIndex == currentVerbIndex));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, emotionId,
      const DeepCollectionEquality().hash(_verbIds), currentVerbIndex);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_EmotionInProgressCopyWith<_$_EmotionInProgress> get copyWith =>
      __$$_EmotionInProgressCopyWithImpl<_$_EmotionInProgress>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_EmotionInProgressToJson(
      this,
    );
  }
}

abstract class _EmotionInProgress implements EmotionInProgress {
  factory _EmotionInProgress(
      {final int emotionId,
      final List<int> verbIds,
      final int currentVerbIndex}) = _$_EmotionInProgress;

  factory _EmotionInProgress.fromJson(Map<String, dynamic> json) =
      _$_EmotionInProgress.fromJson;

  @override
  int get emotionId;
  @override
  List<int> get verbIds;
  @override
  int get currentVerbIndex;
  @override
  @JsonKey(ignore: true)
  _$$_EmotionInProgressCopyWith<_$_EmotionInProgress> get copyWith =>
      throw _privateConstructorUsedError;
}
