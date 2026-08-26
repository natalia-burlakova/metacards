import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:metacards/data/models/app_user.dart';
import 'package:metacards/data/models/creative_work.dart';
import 'package:metacards/data/models/emotion.dart';
import 'package:metacards/data/models/emotion_in_progress.dart';
import 'package:metacards/data/models/meta_card_item.dart';
import 'package:metacards/data/models/meta_cards.dart';
import 'package:metacards/data/models/verb.dart';
import 'package:metacards/data/models/work_in_progress.dart';

/// The app never calls `fromJson(instance.toJson())` directly - it always
/// goes through `jsonEncode`/`jsonDecode` (see AppData.initialize and every
/// storage.write call site). Nested freezed objects only flatten into plain
/// Maps once the JSON codec runs its `toEncodable` fallback, so tests must
/// mirror that exact path.
Map<String, dynamic> _viaJsonCodec(Map<String, dynamic> json) =>
    jsonDecode(jsonEncode(json)) as Map<String, dynamic>;

void main() {
  group('MetaCardItem', () {
    test('round-trips through JSON', () {
      final item = MetaCardItem(title: 'FEAR', desc: 'of the dark');
      final decoded = MetaCardItem.fromJson(item.toJson());
      expect(decoded, item);
    });

    test('applies defaults for missing fields', () {
      final decoded = MetaCardItem.fromJson(const {});
      expect(decoded.title, '');
      expect(decoded.desc, '');
    });
  });

  group('Emotion', () {
    test('round-trips nested lines and sublines', () {
      final emotion = Emotion(
        id: 4,
        lines: [
          MetaCardItem(title: 'FEAR'),
          MetaCardItem(title: 'OF CHANGE', desc: 'uncertainty'),
        ],
        sublines: const ['anxiety', 'worry'],
      );
      final decoded = Emotion.fromJson(_viaJsonCodec(emotion.toJson()));
      expect(decoded, emotion);
    });

    test('defaults lines and sublines to empty lists', () {
      final decoded = Emotion.fromJson(const {'id': 1});
      expect(decoded.lines, isEmpty);
      expect(decoded.sublines, isEmpty);
    });
  });

  group('Verb', () {
    test('round-trips through JSON', () {
      final verb = Verb(id: 10, lines: [MetaCardItem(title: 'BREATHE')]);
      final decoded = Verb.fromJson(_viaJsonCodec(verb.toJson()));
      expect(decoded, verb);
    });
  });

  group('MetaCards', () {
    test('round-trips a full emotions/verbs payload', () {
      final cards = MetaCards(
        emotions: [
          Emotion(id: 1, lines: [MetaCardItem(title: 'FEAR')]),
        ],
        verbs: [
          Verb(id: 10, lines: [MetaCardItem(title: 'BREATHE')]),
        ],
      );
      final decoded = MetaCards.fromJson(_viaJsonCodec(cards.toJson()));
      expect(decoded, cards);
    });

    test('defaults to empty lists when keys are absent', () {
      final decoded = MetaCards.fromJson(const {});
      expect(decoded.emotions, isEmpty);
      expect(decoded.verbs, isEmpty);
    });
  });

  group('EmotionInProgress', () {
    test('round-trips through JSON', () {
      final emotion = EmotionInProgress(
        emotionId: 3,
        verbIds: const [10, 20],
        currentVerbIndex: 1,
      );
      final decoded = EmotionInProgress.fromJson(emotion.toJson());
      expect(decoded, emotion);
    });

    test('copyWith overrides only the given fields', () {
      final emotion = EmotionInProgress(emotionId: 3, verbIds: const [10, 20]);
      final updated = emotion.copyWith(currentVerbIndex: 1);
      expect(updated.emotionId, 3);
      expect(updated.verbIds, [10, 20]);
      expect(updated.currentVerbIndex, 1);
    });
  });

  group('WorkInProgress', () {
    test('round-trips intention and nested emotions', () {
      final work = WorkInProgress(
        intention: 'be calm',
        emotions: [EmotionInProgress(emotionId: 3, verbIds: const [10])],
        currentEmotionIndex: 0,
      );
      final decoded = WorkInProgress.fromJson(_viaJsonCodec(work.toJson()));
      expect(decoded, work);
    });

    test('defaults intention to empty string and index to zero', () {
      final decoded = WorkInProgress.fromJson(const {});
      expect(decoded.intention, '');
      expect(decoded.emotions, isEmpty);
      expect(decoded.currentEmotionIndex, 0);
    });
  });

  group('CreativeWork', () {
    test('round-trips through JSON', () {
      final work = CreativeWork(
        emotions: const [1, 2],
        currentEmotionIndex: 1,
        verbs: const [10],
        currentVerbIndex: 0,
      );
      final decoded = CreativeWork.fromJson(work.toJson());
      expect(decoded, work);
    });
  });

  group('AppUser', () {
    test('round-trips with a null creativeModeWork', () {
      final user = AppUser(
        works: [WorkInProgress(intention: 'be calm')],
        currentWorkIndex: 0,
      );
      final decoded = AppUser.fromJson(_viaJsonCodec(user.toJson()));
      expect(decoded, user);
      expect(decoded.creativeModeWork, isNull);
    });

    test('round-trips with a populated creativeModeWork', () {
      final user = AppUser(
        creativeModeWork: CreativeWork(
          emotions: const [1],
          verbs: const [10],
        ),
      );
      final decoded = AppUser.fromJson(_viaJsonCodec(user.toJson()));
      expect(decoded, user);
      expect(decoded.creativeModeWork, isNotNull);
    });

    test('defaults to no works and index zero', () {
      final decoded = AppUser.fromJson(const {});
      expect(decoded.works, isEmpty);
      expect(decoded.currentWorkIndex, 0);
      expect(decoded.creativeModeWork, isNull);
    });
  });
}
