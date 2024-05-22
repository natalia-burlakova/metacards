import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'emotion_in_progress.freezed.dart';
part 'emotion_in_progress.g.dart';

@freezed
@CopyWith()
class EmotionInProgress with _$EmotionInProgress {
  factory EmotionInProgress({
    @Default(0) int emotionId,
    @Default([]) List<int> verbIds,
    @Default(0) int currentVerbIndex,
  }) = _EmotionInProgress;

  factory EmotionInProgress.fromJson(Map<String, dynamic> json) =>
      _$EmotionInProgressFromJson(json);
}
