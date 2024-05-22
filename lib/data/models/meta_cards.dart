import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:metacards/data/models/emotion.dart';
import 'package:metacards/data/models/verb.dart';

part 'meta_cards.freezed.dart';
part 'meta_cards.g.dart';

@freezed
class MetaCards with _$MetaCards {
  factory MetaCards({
    @Default([]) List<Emotion> emotions,
    @Default([]) List<Verb> verbs,
  }) = _MetaCards;

  factory MetaCards.fromJson(Map<String, dynamic> json) =>
      _$MetaCardsFromJson(json);
}
