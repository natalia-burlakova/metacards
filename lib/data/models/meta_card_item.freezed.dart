// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'meta_card_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MetaCardItem _$MetaCardItemFromJson(Map<String, dynamic> json) {
  return _MetaCardItem.fromJson(json);
}

/// @nodoc
mixin _$MetaCardItem {
  String get title => throw _privateConstructorUsedError;
  String get desc => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MetaCardItemCopyWith<MetaCardItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MetaCardItemCopyWith<$Res> {
  factory $MetaCardItemCopyWith(
          MetaCardItem value, $Res Function(MetaCardItem) then) =
      _$MetaCardItemCopyWithImpl<$Res, MetaCardItem>;
  @useResult
  $Res call({String title, String desc});
}

/// @nodoc
class _$MetaCardItemCopyWithImpl<$Res, $Val extends MetaCardItem>
    implements $MetaCardItemCopyWith<$Res> {
  _$MetaCardItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? desc = null,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      desc: null == desc
          ? _value.desc
          : desc // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MetaCardItemCopyWith<$Res>
    implements $MetaCardItemCopyWith<$Res> {
  factory _$$_MetaCardItemCopyWith(
          _$_MetaCardItem value, $Res Function(_$_MetaCardItem) then) =
      __$$_MetaCardItemCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String title, String desc});
}

/// @nodoc
class __$$_MetaCardItemCopyWithImpl<$Res>
    extends _$MetaCardItemCopyWithImpl<$Res, _$_MetaCardItem>
    implements _$$_MetaCardItemCopyWith<$Res> {
  __$$_MetaCardItemCopyWithImpl(
      _$_MetaCardItem _value, $Res Function(_$_MetaCardItem) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? desc = null,
  }) {
    return _then(_$_MetaCardItem(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      desc: null == desc
          ? _value.desc
          : desc // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MetaCardItem implements _MetaCardItem {
  _$_MetaCardItem({this.title = '', this.desc = ''});

  factory _$_MetaCardItem.fromJson(Map<String, dynamic> json) =>
      _$$_MetaCardItemFromJson(json);

  @override
  @JsonKey()
  final String title;
  @override
  @JsonKey()
  final String desc;

  @override
  String toString() {
    return 'MetaCardItem(title: $title, desc: $desc)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MetaCardItem &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.desc, desc) || other.desc == desc));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, title, desc);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MetaCardItemCopyWith<_$_MetaCardItem> get copyWith =>
      __$$_MetaCardItemCopyWithImpl<_$_MetaCardItem>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MetaCardItemToJson(
      this,
    );
  }
}

abstract class _MetaCardItem implements MetaCardItem {
  factory _MetaCardItem({final String title, final String desc}) =
      _$_MetaCardItem;

  factory _MetaCardItem.fromJson(Map<String, dynamic> json) =
      _$_MetaCardItem.fromJson;

  @override
  String get title;
  @override
  String get desc;
  @override
  @JsonKey(ignore: true)
  _$$_MetaCardItemCopyWith<_$_MetaCardItem> get copyWith =>
      throw _privateConstructorUsedError;
}
