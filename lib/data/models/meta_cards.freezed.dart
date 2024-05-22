// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'meta_cards.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MetaCards _$MetaCardsFromJson(Map<String, dynamic> json) {
  return _MetaCards.fromJson(json);
}

/// @nodoc
mixin _$MetaCards {
  List<Emotion> get emotions => throw _privateConstructorUsedError;
  List<Verb> get verbs => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MetaCardsCopyWith<MetaCards> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MetaCardsCopyWith<$Res> {
  factory $MetaCardsCopyWith(MetaCards value, $Res Function(MetaCards) then) =
      _$MetaCardsCopyWithImpl<$Res, MetaCards>;
  @useResult
  $Res call({List<Emotion> emotions, List<Verb> verbs});
}

/// @nodoc
class _$MetaCardsCopyWithImpl<$Res, $Val extends MetaCards>
    implements $MetaCardsCopyWith<$Res> {
  _$MetaCardsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? emotions = null,
    Object? verbs = null,
  }) {
    return _then(_value.copyWith(
      emotions: null == emotions
          ? _value.emotions
          : emotions // ignore: cast_nullable_to_non_nullable
              as List<Emotion>,
      verbs: null == verbs
          ? _value.verbs
          : verbs // ignore: cast_nullable_to_non_nullable
              as List<Verb>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MetaCardsCopyWith<$Res> implements $MetaCardsCopyWith<$Res> {
  factory _$$_MetaCardsCopyWith(
          _$_MetaCards value, $Res Function(_$_MetaCards) then) =
      __$$_MetaCardsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Emotion> emotions, List<Verb> verbs});
}

/// @nodoc
class __$$_MetaCardsCopyWithImpl<$Res>
    extends _$MetaCardsCopyWithImpl<$Res, _$_MetaCards>
    implements _$$_MetaCardsCopyWith<$Res> {
  __$$_MetaCardsCopyWithImpl(
      _$_MetaCards _value, $Res Function(_$_MetaCards) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? emotions = null,
    Object? verbs = null,
  }) {
    return _then(_$_MetaCards(
      emotions: null == emotions
          ? _value._emotions
          : emotions // ignore: cast_nullable_to_non_nullable
              as List<Emotion>,
      verbs: null == verbs
          ? _value._verbs
          : verbs // ignore: cast_nullable_to_non_nullable
              as List<Verb>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MetaCards implements _MetaCards {
  _$_MetaCards(
      {final List<Emotion> emotions = const [],
      final List<Verb> verbs = const []})
      : _emotions = emotions,
        _verbs = verbs;

  factory _$_MetaCards.fromJson(Map<String, dynamic> json) =>
      _$$_MetaCardsFromJson(json);

  final List<Emotion> _emotions;
  @override
  @JsonKey()
  List<Emotion> get emotions {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_emotions);
  }

  final List<Verb> _verbs;
  @override
  @JsonKey()
  List<Verb> get verbs {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_verbs);
  }

  @override
  String toString() {
    return 'MetaCards(emotions: $emotions, verbs: $verbs)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MetaCards &&
            const DeepCollectionEquality().equals(other._emotions, _emotions) &&
            const DeepCollectionEquality().equals(other._verbs, _verbs));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_emotions),
      const DeepCollectionEquality().hash(_verbs));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MetaCardsCopyWith<_$_MetaCards> get copyWith =>
      __$$_MetaCardsCopyWithImpl<_$_MetaCards>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MetaCardsToJson(
      this,
    );
  }
}

abstract class _MetaCards implements MetaCards {
  factory _MetaCards({final List<Emotion> emotions, final List<Verb> verbs}) =
      _$_MetaCards;

  factory _MetaCards.fromJson(Map<String, dynamic> json) =
      _$_MetaCards.fromJson;

  @override
  List<Emotion> get emotions;
  @override
  List<Verb> get verbs;
  @override
  @JsonKey(ignore: true)
  _$$_MetaCardsCopyWith<_$_MetaCards> get copyWith =>
      throw _privateConstructorUsedError;
}
