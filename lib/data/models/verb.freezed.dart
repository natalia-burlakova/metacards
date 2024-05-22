// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'verb.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Verb _$VerbFromJson(Map<String, dynamic> json) {
  return _Verb.fromJson(json);
}

/// @nodoc
mixin _$Verb {
  int get id => throw _privateConstructorUsedError;
  List<MetaCardItem> get lines => throw _privateConstructorUsedError;
  List<String> get sublines => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $VerbCopyWith<Verb> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VerbCopyWith<$Res> {
  factory $VerbCopyWith(Verb value, $Res Function(Verb) then) =
      _$VerbCopyWithImpl<$Res, Verb>;
  @useResult
  $Res call({int id, List<MetaCardItem> lines, List<String> sublines});
}

/// @nodoc
class _$VerbCopyWithImpl<$Res, $Val extends Verb>
    implements $VerbCopyWith<$Res> {
  _$VerbCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? lines = null,
    Object? sublines = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      lines: null == lines
          ? _value.lines
          : lines // ignore: cast_nullable_to_non_nullable
              as List<MetaCardItem>,
      sublines: null == sublines
          ? _value.sublines
          : sublines // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_VerbCopyWith<$Res> implements $VerbCopyWith<$Res> {
  factory _$$_VerbCopyWith(_$_Verb value, $Res Function(_$_Verb) then) =
      __$$_VerbCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, List<MetaCardItem> lines, List<String> sublines});
}

/// @nodoc
class __$$_VerbCopyWithImpl<$Res> extends _$VerbCopyWithImpl<$Res, _$_Verb>
    implements _$$_VerbCopyWith<$Res> {
  __$$_VerbCopyWithImpl(_$_Verb _value, $Res Function(_$_Verb) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? lines = null,
    Object? sublines = null,
  }) {
    return _then(_$_Verb(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      lines: null == lines
          ? _value._lines
          : lines // ignore: cast_nullable_to_non_nullable
              as List<MetaCardItem>,
      sublines: null == sublines
          ? _value._sublines
          : sublines // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Verb implements _Verb {
  _$_Verb(
      {this.id = 0,
      final List<MetaCardItem> lines = const [],
      final List<String> sublines = const []})
      : _lines = lines,
        _sublines = sublines;

  factory _$_Verb.fromJson(Map<String, dynamic> json) => _$$_VerbFromJson(json);

  @override
  @JsonKey()
  final int id;
  final List<MetaCardItem> _lines;
  @override
  @JsonKey()
  List<MetaCardItem> get lines {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_lines);
  }

  final List<String> _sublines;
  @override
  @JsonKey()
  List<String> get sublines {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_sublines);
  }

  @override
  String toString() {
    return 'Verb(id: $id, lines: $lines, sublines: $sublines)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Verb &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality().equals(other._lines, _lines) &&
            const DeepCollectionEquality().equals(other._sublines, _sublines));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      const DeepCollectionEquality().hash(_lines),
      const DeepCollectionEquality().hash(_sublines));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_VerbCopyWith<_$_Verb> get copyWith =>
      __$$_VerbCopyWithImpl<_$_Verb>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_VerbToJson(
      this,
    );
  }
}

abstract class _Verb implements Verb {
  factory _Verb(
      {final int id,
      final List<MetaCardItem> lines,
      final List<String> sublines}) = _$_Verb;

  factory _Verb.fromJson(Map<String, dynamic> json) = _$_Verb.fromJson;

  @override
  int get id;
  @override
  List<MetaCardItem> get lines;
  @override
  List<String> get sublines;
  @override
  @JsonKey(ignore: true)
  _$$_VerbCopyWith<_$_Verb> get copyWith => throw _privateConstructorUsedError;
}
