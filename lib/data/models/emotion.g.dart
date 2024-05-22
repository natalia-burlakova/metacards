// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'emotion.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Emotion _$$_EmotionFromJson(Map<String, dynamic> json) => _$_Emotion(
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

Map<String, dynamic> _$$_EmotionToJson(_$_Emotion instance) =>
    <String, dynamic>{
      'id': instance.id,
      'lines': instance.lines,
      'sublines': instance.sublines,
    };
