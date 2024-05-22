// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AppUser _$$_AppUserFromJson(Map<String, dynamic> json) => _$_AppUser(
      works: (json['works'] as List<dynamic>?)
              ?.map((e) => WorkInProgress.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      creativeModeWork: json['creativeModeWork'] == null
          ? null
          : WorkInProgress.fromJson(
              json['creativeModeWork'] as Map<String, dynamic>),
      currentWorkIndex: json['currentWorkIndex'] as int? ?? 0,
    );

Map<String, dynamic> _$$_AppUserToJson(_$_AppUser instance) =>
    <String, dynamic>{
      'works': instance.works,
      'creativeModeWork': instance.creativeModeWork,
      'currentWorkIndex': instance.currentWorkIndex,
    };
