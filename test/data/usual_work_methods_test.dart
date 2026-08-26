import 'package:flutter_secure_storage_platform_interface/flutter_secure_storage_platform_interface.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:metacards/data/constants.dart';
import 'package:metacards/data/models/app_user.dart';
import 'package:metacards/data/models/emotion.dart';
import 'package:metacards/data/models/emotion_in_progress.dart';
import 'package:metacards/data/models/meta_card_item.dart';
import 'package:metacards/data/models/meta_cards.dart';
import 'package:metacards/data/models/verb.dart';
import 'package:metacards/data/models/work_in_progress.dart';
import 'package:metacards/data/work_functions_usual.dart';

import '../support/fake_secure_storage.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    FlutterSecureStoragePlatform.instance = FakeSecureStorage();
    AppInitializer.appData = AppData()
      ..metacards = MetaCards(
        emotions: [
          Emotion(id: 1, lines: [MetaCardItem(title: 'FEAR')]),
          Emotion(id: 2, lines: [MetaCardItem(title: 'JOY')]),
        ],
        verbs: [
          Verb(id: 10, lines: [MetaCardItem(title: 'BREATHE')]),
          Verb(id: 20, lines: [MetaCardItem(title: 'ACCEPT')]),
        ],
      );
  });

  UsualWorkMethods methods() => AppInitializer.appData.usualWorkMethods;

  group('canNextEmotionTap', () {
    test('is intensionAbsent when there is no work yet', () {
      AppInitializer.appData.appUser = AppUser();
      expect(methods().canNextEmotionTap(), EmotionState.intensionAbsent);
    });

    test('is generateList once an intention is set with no emotions', () {
      AppInitializer.appData.appUser = AppUser(
        works: [WorkInProgress(intention: 'be calm')],
      );
      expect(methods().canNextEmotionTap(), EmotionState.generateList);
    });

    test('is verbsNotEnd while verbs remain unfinished for the emotion', () {
      AppInitializer.appData.appUser = AppUser(
        works: [
          WorkInProgress(
            intention: 'be calm',
            emotions: [EmotionInProgress(emotionId: 1, verbIds: const [10, 20])],
          ),
        ],
      );
      expect(methods().canNextEmotionTap(), EmotionState.verbsNotEnd);
    });

    test('is next when the current emotion is done but more remain', () {
      AppInitializer.appData.appUser = AppUser(
        works: [
          WorkInProgress(
            intention: 'be calm',
            emotions: [
              EmotionInProgress(
                emotionId: 1,
                verbIds: const [10, 20],
                currentVerbIndex: 1,
              ),
              EmotionInProgress(emotionId: 2, verbIds: const [10]),
            ],
            currentEmotionIndex: 0,
          ),
        ],
      );
      expect(methods().canNextEmotionTap(), EmotionState.next);
    });

    test('is end on the last emotion once its verbs are done', () {
      AppInitializer.appData.appUser = AppUser(
        works: [
          WorkInProgress(
            intention: 'be calm',
            emotions: [
              EmotionInProgress(
                emotionId: 1,
                verbIds: const [10, 20],
                currentVerbIndex: 1,
              ),
            ],
            currentEmotionIndex: 0,
          ),
        ],
      );
      expect(methods().canNextEmotionTap(), EmotionState.end);
    });
  });

  group('canNextVerbTap', () {
    WorkInProgress workWithEmotion(EmotionInProgress emotion) => WorkInProgress(
          intention: 'be calm',
          emotions: [emotion],
        );

    test('is generateList when the current emotion has no verbs yet', () {
      AppInitializer.appData.appUser = AppUser(
        works: [workWithEmotion(EmotionInProgress(emotionId: 1))],
      );
      expect(methods().canNextVerbTap(), VerbState.generateList);
    });

    test('is next while more verbs remain', () {
      AppInitializer.appData.appUser = AppUser(
        works: [
          workWithEmotion(
            EmotionInProgress(emotionId: 1, verbIds: const [10, 20]),
          ),
        ],
      );
      expect(methods().canNextVerbTap(), VerbState.next);
    });

    test('is end on the last verb', () {
      AppInitializer.appData.appUser = AppUser(
        works: [
          workWithEmotion(
            EmotionInProgress(
              emotionId: 1,
              verbIds: const [10, 20],
              currentVerbIndex: 1,
            ),
          ),
        ],
      );
      expect(methods().canNextVerbTap(), VerbState.end);
    });
  });

  group('rest counts', () {
    test('getRestEmotionsCount counts remaining emotions', () {
      AppInitializer.appData.appUser = AppUser(
        works: [
          WorkInProgress(
            intention: 'be calm',
            emotions: [
              EmotionInProgress(emotionId: 1),
              EmotionInProgress(emotionId: 2),
            ],
            currentEmotionIndex: 0,
          ),
        ],
      );
      expect(methods().getRestEmotionsCount(), '2');
    });

    test('getRestEmotionsCount is "?" without a current work', () {
      AppInitializer.appData.appUser = AppUser();
      expect(methods().getRestEmotionsCount(), '?');
    });

    test('getRestVerbCount counts remaining verbs for current emotion', () {
      AppInitializer.appData.appUser = AppUser(
        works: [
          WorkInProgress(
            intention: 'be calm',
            emotions: [
              EmotionInProgress(emotionId: 1, verbIds: const [10, 20]),
            ],
          ),
        ],
      );
      expect(methods().getRestVerbCount(), '2');
    });

    test('getRestVerbCount is "?" when there are no verbs', () {
      AppInitializer.appData.appUser = AppUser(
        works: [
          WorkInProgress(
            intention: 'be calm',
            emotions: [EmotionInProgress(emotionId: 1)],
          ),
        ],
      );
      expect(methods().getRestVerbCount(), '?');
    });
  });

  group('canDeleteWork / canAddWork / willDeleteOldestWork', () {
    test('are false with no saved work', () {
      AppInitializer.appData.appUser = AppUser();
      expect(methods().canDeleteWork(), isFalse);
      expect(methods().canAddWork(), isFalse);
      expect(methods().willDeleteOldestWork(), isFalse);
    });

    test('canDeleteWork and canAddWork are true once a work exists', () {
      AppInitializer.appData.appUser = AppUser(
        works: [WorkInProgress(intention: 'be calm')],
      );
      expect(methods().canDeleteWork(), isTrue);
      expect(methods().canAddWork(), isTrue);
    });

    test('willDeleteOldestWork is true once three works are saved', () {
      AppInitializer.appData.appUser = AppUser(
        works: List.generate(3, (i) => WorkInProgress(intention: 'work $i')),
      );
      expect(methods().willDeleteOldestWork(), isTrue);
    });
  });

  group('addWork', () {
    test('appends a new work and selects it', () {
      AppInitializer.appData.appUser = AppUser(
        works: [WorkInProgress(intention: 'first')],
      );
      methods().addWork(WorkInProgress(intention: 'second'));
      final appUser = AppInitializer.appData.appUser!;
      expect(appUser.works.map((w) => w.intention), ['first', 'second']);
      expect(appUser.currentWorkIndex, 1);
    });

    test('caps saved works at three, dropping the oldest', () {
      AppInitializer.appData.appUser = AppUser(
        works: List.generate(3, (i) => WorkInProgress(intention: 'work $i')),
      );
      methods().addWork(WorkInProgress(intention: 'newest'));
      final appUser = AppInitializer.appData.appUser!;
      expect(
        appUser.works.map((w) => w.intention),
        ['work 1', 'work 2', 'newest'],
      );
      expect(appUser.currentWorkIndex, 2);
    });
  });

  group('deleteWork', () {
    test('removes the work at the given index and re-selects the last one', () {
      AppInitializer.appData.appUser = AppUser(
        works: [
          WorkInProgress(intention: 'first'),
          WorkInProgress(intention: 'second'),
        ],
      );
      methods().deleteWork(0);
      final appUser = AppInitializer.appData.appUser!;
      expect(appUser.works.map((w) => w.intention), ['second']);
      expect(appUser.currentWorkIndex, 0);
    });
  });

  group('lookups', () {
    test('getEmotionById finds an existing emotion and misses unknown ids', () {
      expect(methods().getEmotionById(1)?.id, 1);
      expect(methods().getEmotionById(999), isNull);
    });

    test('getVerbById finds an existing verb and misses unknown ids', () {
      expect(methods().getVerbById(10)?.id, 10);
      expect(methods().getVerbById(999), isNull);
    });
  });

  test('getCurrentEmotionText concatenates uppercased line titles', () {
    AppInitializer.appData.appUser = AppUser(
      works: [
        WorkInProgress(
          intention: 'be calm',
          emotions: [EmotionInProgress(emotionId: 1)],
        ),
      ],
    );
    expect(methods().getCurrentEmotionText(), 'FEAR ');
  });
}
