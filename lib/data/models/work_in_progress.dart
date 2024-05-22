import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:metacards/data/models/emotion_in_progress.dart';

part 'work_in_progress.freezed.dart';
part 'work_in_progress.g.dart';

@freezed
class WorkInProgress with _$WorkInProgress {
  factory WorkInProgress({
    @Default('') String intention,
    @Default([]) List<EmotionInProgress> emotions,
    @Default(0) int currentEmotionIndex,
  }) = _WorkInProgress;

  factory WorkInProgress.fromJson(Map<String, dynamic> json) => _$WorkInProgressFromJson(json);
}
