// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'work_in_progress.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_WorkInProgress _$$_WorkInProgressFromJson(Map<String, dynamic> json) =>
    _$_WorkInProgress(
      intention: json['intention'] as String? ?? '',
      emotions: (json['emotions'] as List<dynamic>?)
              ?.map(
                  (e) => EmotionInProgress.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      currentEmotionIndex: json['currentEmotionIndex'] as int? ?? 0,
    );

Map<String, dynamic> _$$_WorkInProgressToJson(_$_WorkInProgress instance) =>
    <String, dynamic>{
      'intention': instance.intention,
      'emotions': instance.emotions,
      'currentEmotionIndex': instance.currentEmotionIndex,
    };
