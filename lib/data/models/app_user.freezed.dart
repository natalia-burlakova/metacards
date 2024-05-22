// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'app_user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AppUser _$AppUserFromJson(Map<String, dynamic> json) {
  return _AppUser.fromJson(json);
}

/// @nodoc
mixin _$AppUser {
  List<WorkInProgress> get works => throw _privateConstructorUsedError;
  WorkInProgress? get creativeModeWork => throw _privateConstructorUsedError;
  int get currentWorkIndex => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AppUserCopyWith<AppUser> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppUserCopyWith<$Res> {
  factory $AppUserCopyWith(AppUser value, $Res Function(AppUser) then) =
      _$AppUserCopyWithImpl<$Res, AppUser>;
  @useResult
  $Res call(
      {List<WorkInProgress> works,
      WorkInProgress? creativeModeWork,
      int currentWorkIndex});

  $WorkInProgressCopyWith<$Res>? get creativeModeWork;
}

/// @nodoc
class _$AppUserCopyWithImpl<$Res, $Val extends AppUser>
    implements $AppUserCopyWith<$Res> {
  _$AppUserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? works = null,
    Object? creativeModeWork = freezed,
    Object? currentWorkIndex = null,
  }) {
    return _then(_value.copyWith(
      works: null == works
          ? _value.works
          : works // ignore: cast_nullable_to_non_nullable
              as List<WorkInProgress>,
      creativeModeWork: freezed == creativeModeWork
          ? _value.creativeModeWork
          : creativeModeWork // ignore: cast_nullable_to_non_nullable
              as WorkInProgress?,
      currentWorkIndex: null == currentWorkIndex
          ? _value.currentWorkIndex
          : currentWorkIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $WorkInProgressCopyWith<$Res>? get creativeModeWork {
    if (_value.creativeModeWork == null) {
      return null;
    }

    return $WorkInProgressCopyWith<$Res>(_value.creativeModeWork!, (value) {
      return _then(_value.copyWith(creativeModeWork: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_AppUserCopyWith<$Res> implements $AppUserCopyWith<$Res> {
  factory _$$_AppUserCopyWith(
          _$_AppUser value, $Res Function(_$_AppUser) then) =
      __$$_AppUserCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<WorkInProgress> works,
      WorkInProgress? creativeModeWork,
      int currentWorkIndex});

  @override
  $WorkInProgressCopyWith<$Res>? get creativeModeWork;
}

/// @nodoc
class __$$_AppUserCopyWithImpl<$Res>
    extends _$AppUserCopyWithImpl<$Res, _$_AppUser>
    implements _$$_AppUserCopyWith<$Res> {
  __$$_AppUserCopyWithImpl(_$_AppUser _value, $Res Function(_$_AppUser) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? works = null,
    Object? creativeModeWork = freezed,
    Object? currentWorkIndex = null,
  }) {
    return _then(_$_AppUser(
      works: null == works
          ? _value._works
          : works // ignore: cast_nullable_to_non_nullable
              as List<WorkInProgress>,
      creativeModeWork: freezed == creativeModeWork
          ? _value.creativeModeWork
          : creativeModeWork // ignore: cast_nullable_to_non_nullable
              as WorkInProgress?,
      currentWorkIndex: null == currentWorkIndex
          ? _value.currentWorkIndex
          : currentWorkIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AppUser implements _AppUser {
  _$_AppUser(
      {final List<WorkInProgress> works = const [],
      this.creativeModeWork,
      this.currentWorkIndex = 0})
      : _works = works;

  factory _$_AppUser.fromJson(Map<String, dynamic> json) =>
      _$$_AppUserFromJson(json);

  final List<WorkInProgress> _works;
  @override
  @JsonKey()
  List<WorkInProgress> get works {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_works);
  }

  @override
  final WorkInProgress? creativeModeWork;
  @override
  @JsonKey()
  final int currentWorkIndex;

  @override
  String toString() {
    return 'AppUser(works: $works, creativeModeWork: $creativeModeWork, currentWorkIndex: $currentWorkIndex)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AppUser &&
            const DeepCollectionEquality().equals(other._works, _works) &&
            (identical(other.creativeModeWork, creativeModeWork) ||
                other.creativeModeWork == creativeModeWork) &&
            (identical(other.currentWorkIndex, currentWorkIndex) ||
                other.currentWorkIndex == currentWorkIndex));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_works),
      creativeModeWork,
      currentWorkIndex);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AppUserCopyWith<_$_AppUser> get copyWith =>
      __$$_AppUserCopyWithImpl<_$_AppUser>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AppUserToJson(
      this,
    );
  }
}

abstract class _AppUser implements AppUser {
  factory _AppUser(
      {final List<WorkInProgress> works,
      final WorkInProgress? creativeModeWork,
      final int currentWorkIndex}) = _$_AppUser;

  factory _AppUser.fromJson(Map<String, dynamic> json) = _$_AppUser.fromJson;

  @override
  List<WorkInProgress> get works;
  @override
  WorkInProgress? get creativeModeWork;
  @override
  int get currentWorkIndex;
  @override
  @JsonKey(ignore: true)
  _$$_AppUserCopyWith<_$_AppUser> get copyWith =>
      throw _privateConstructorUsedError;
}
