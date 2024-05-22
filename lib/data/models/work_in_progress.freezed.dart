// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'work_in_progress.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

WorkInProgress _$WorkInProgressFromJson(Map<String, dynamic> json) {
  return _WorkInProgress.fromJson(json);
}

/// @nodoc
mixin _$WorkInProgress {
  String get intention => throw _privateConstructorUsedError;
  List<EmotionInProgress> get emotions => throw _privateConstructorUsedError;
  int get currentEmotionIndex => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WorkInProgressCopyWith<WorkInProgress> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WorkInProgressCopyWith<$Res> {
  factory $WorkInProgressCopyWith(
          WorkInProgress value, $Res Function(WorkInProgress) then) =
      _$WorkInProgressCopyWithImpl<$Res, WorkInProgress>;
  @useResult
  $Res call(
      {String intention,
      List<EmotionInProgress> emotions,
      int currentEmotionIndex});
}

/// @nodoc
class _$WorkInProgressCopyWithImpl<$Res, $Val extends WorkInProgress>
    implements $WorkInProgressCopyWith<$Res> {
  _$WorkInProgressCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? intention = null,
    Object? emotions = null,
    Object? currentEmotionIndex = null,
  }) {
    return _then(_value.copyWith(
      intention: null == intention
          ? _value.intention
          : intention // ignore: cast_nullable_to_non_nullable
              as String,
      emotions: null == emotions
          ? _value.emotions
          : emotions // ignore: cast_nullable_to_non_nullable
              as List<EmotionInProgress>,
      currentEmotionIndex: null == currentEmotionIndex
          ? _value.currentEmotionIndex
          : currentEmotionIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_WorkInProgressCopyWith<$Res>
    implements $WorkInProgressCopyWith<$Res> {
  factory _$$_WorkInProgressCopyWith(
          _$_WorkInProgress value, $Res Function(_$_WorkInProgress) then) =
      __$$_WorkInProgressCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String intention,
      List<EmotionInProgress> emotions,
      int currentEmotionIndex});
}

/// @nodoc
class __$$_WorkInProgressCopyWithImpl<$Res>
    extends _$WorkInProgressCopyWithImpl<$Res, _$_WorkInProgress>
    implements _$$_WorkInProgressCopyWith<$Res> {
  __$$_WorkInProgressCopyWithImpl(
      _$_WorkInProgress _value, $Res Function(_$_WorkInProgress) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? intention = null,
    Object? emotions = null,
    Object? currentEmotionIndex = null,
  }) {
    return _then(_$_WorkInProgress(
      intention: null == intention
          ? _value.intention
          : intention // ignore: cast_nullable_to_non_nullable
              as String,
      emotions: null == emotions
          ? _value._emotions
          : emotions // ignore: cast_nullable_to_non_nullable
              as List<EmotionInProgress>,
      currentEmotionIndex: null == currentEmotionIndex
          ? _value.currentEmotionIndex
          : currentEmotionIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_WorkInProgress implements _WorkInProgress {
  _$_WorkInProgress(
      {this.intention = '',
      final List<EmotionInProgress> emotions = const [],
      this.currentEmotionIndex = 0})
      : _emotions = emotions;

  factory _$_WorkInProgress.fromJson(Map<String, dynamic> json) =>
      _$$_WorkInProgressFromJson(json);

  @override
  @JsonKey()
  final String intention;
  final List<EmotionInProgress> _emotions;
  @override
  @JsonKey()
  List<EmotionInProgress> get emotions {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_emotions);
  }

  @override
  @JsonKey()
  final int currentEmotionIndex;

  @override
  String toString() {
    return 'WorkInProgress(intention: $intention, emotions: $emotions, currentEmotionIndex: $currentEmotionIndex)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_WorkInProgress &&
            (identical(other.intention, intention) ||
                other.intention == intention) &&
            const DeepCollectionEquality().equals(other._emotions, _emotions) &&
            (identical(other.currentEmotionIndex, currentEmotionIndex) ||
                other.currentEmotionIndex == currentEmotionIndex));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, intention,
      const DeepCollectionEquality().hash(_emotions), currentEmotionIndex);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_WorkInProgressCopyWith<_$_WorkInProgress> get copyWith =>
      __$$_WorkInProgressCopyWithImpl<_$_WorkInProgress>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_WorkInProgressToJson(
      this,
    );
  }
}

abstract class _WorkInProgress implements WorkInProgress {
  factory _WorkInProgress(
      {final String intention,
      final List<EmotionInProgress> emotions,
      final int currentEmotionIndex}) = _$_WorkInProgress;

  factory _WorkInProgress.fromJson(Map<String, dynamic> json) =
      _$_WorkInProgress.fromJson;

  @override
  String get intention;
  @override
  List<EmotionInProgress> get emotions;
  @override
  int get currentEmotionIndex;
  @override
  @JsonKey(ignore: true)
  _$$_WorkInProgressCopyWith<_$_WorkInProgress> get copyWith =>
      throw _privateConstructorUsedError;
}
