// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verb.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Verb _$$_VerbFromJson(Map<String, dynamic> json) => _$_Verb(
      id: json['id'] as int? ?? 0,
      lines: (json['lines'] as List<dynamic>?)
              ?.map((e) => MetaCardItem.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      sublines: (json['sublines'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$_VerbToJson(_$_Verb instance) => <String, dynamic>{
      'id': instance.id,
      'lines': instance.lines,
      'sublines': instance.sublines,
    };
