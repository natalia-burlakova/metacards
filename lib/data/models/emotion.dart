import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:metacards/data/models/meta_card_item.dart';

part 'emotion.freezed.dart';
part 'emotion.g.dart';

@freezed
class Emotion with _$Emotion {
  factory Emotion({
    @Default(0) int id,
    @Default([]) List<MetaCardItem> lines,
    @Default([]) List<String> sublines,
  }) = _Emotion;

  factory Emotion.fromJson(Map<String, dynamic> json) =>
      _$EmotionFromJson(json);
}
