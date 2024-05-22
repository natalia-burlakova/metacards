// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'emotion_in_progress.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_EmotionInProgress _$$_EmotionInProgressFromJson(Map<String, dynamic> json) =>
    _$_EmotionInProgress(
      emotionId: json['emotionId'] as int? ?? 0,
      verbIds:
          (json['verbIds'] as List<dynamic>?)?.map((e) => e as int).toList() ??
              const [],
      currentVerbIndex: json['currentVerbIndex'] as int? ?? 0,
    );

Map<String, dynamic> _$$_EmotionInProgressToJson(
        _$_EmotionInProgress instance) =>
    <String, dynamic>{
      'emotionId': instance.emotionId,
      'verbIds': instance.verbIds,
      'currentVerbIndex': instance.currentVerbIndex,
    };
