// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'creative_work.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CreativeWork _$$_CreativeWorkFromJson(Map<String, dynamic> json) =>
    _$_CreativeWork(
      emotions:
          (json['emotions'] as List<dynamic>?)?.map((e) => e as int).toList() ??
              const [],
      currentEmotionIndex: json['currentEmotionIndex'] as int? ?? 0,
      verbs: (json['verbs'] as List<dynamic>?)?.map((e) => e as int).toList() ??
          const [],
      currentVerbIndex: json['currentVerbIndex'] as int? ?? 0,
    );

Map<String, dynamic> _$$_CreativeWorkToJson(_$_CreativeWork instance) =>
    <String, dynamic>{
      'emotions': instance.emotions,
      'currentEmotionIndex': instance.currentEmotionIndex,
      'verbs': instance.verbs,
      'currentVerbIndex': instance.currentVerbIndex,
    };
