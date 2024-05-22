import 'package:freezed_annotation/freezed_annotation.dart';

part 'meta_card_item.freezed.dart';
part 'meta_card_item.g.dart';

@freezed
class MetaCardItem with _$MetaCardItem {
  factory MetaCardItem({
    @Default('') String title,
    @Default('') String desc,
  }) = _MetaCardItem;

  factory MetaCardItem.fromJson(Map<String, dynamic> json) =>
      _$MetaCardItemFromJson(json);
}
