import 'package:freezed_annotation/freezed_annotation.dart';

part 'creative_work.freezed.dart';
part 'creative_work.g.dart';

@freezed
class CreativeWork with _$CreativeWork {
  factory CreativeWork({
    @Default([]) List<int> emotions,
    @Default(0) int currentEmotionIndex,
    @Default([]) List<int> verbs,
    @Default(0) int currentVerbIndex,
  }) = _CreativeWork;

  factory CreativeWork.fromJson(Map<String, dynamic> json) =>
      _$CreativeWorkFromJson(json);
}
