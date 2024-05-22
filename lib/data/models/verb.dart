import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:metacards/data/models/meta_card_item.dart';

part 'verb.freezed.dart';
part 'verb.g.dart';

@freezed
class Verb with _$Verb {
  factory Verb({
    @Default(0) int id,
    @Default([]) List<MetaCardItem> lines,
    @Default([]) List<String> sublines,
  }) = _Verb;

  factory Verb.fromJson(Map<String, dynamic> json) => _$VerbFromJson(json);
}
