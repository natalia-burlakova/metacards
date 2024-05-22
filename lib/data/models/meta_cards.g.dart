// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meta_cards.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MetaCards _$$_MetaCardsFromJson(Map<String, dynamic> json) => _$_MetaCards(
      emotions: (json['emotions'] as List<dynamic>?)
              ?.map((e) => Emotion.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      verbs: (json['verbs'] as List<dynamic>?)
              ?.map((e) => Verb.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$_MetaCardsToJson(_$_MetaCards instance) =>
    <String, dynamic>{
      'emotions': instance.emotions,
      'verbs': instance.verbs,
    };
