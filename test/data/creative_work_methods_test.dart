import 'package:flutter_secure_storage_platform_interface/flutter_secure_storage_platform_interface.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:metacards/data/constants.dart';
import 'package:metacards/data/models/app_user.dart';
import 'package:metacards/data/models/creative_work.dart';
import 'package:metacards/data/models/emotion.dart';
import 'package:metacards/data/models/meta_card_item.dart';
import 'package:metacards/data/models/meta_cards.dart';
import 'package:metacards/data/models/verb.dart';
import 'package:metacards/data/work_function_creative.dart';

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

  CreativeWorkMethods methods() => AppInitializer.appData.creativeWorkMethods;

  test('fixed answers do not depend on state', () {
    expect(methods().canDeleteWork(), isFalse);
    expect(methods().canAddWork(), isFalse);
    expect(methods().willDeleteOldestWork(), isFalse);
    expect(methods().getRestEmotionsCount(), '...');
    expect(methods().getRestVerbCount(), '...');
    expect(methods().canNextEmotionTap(), EmotionState.next);
    expect(methods().canNextVerbTap(), VerbState.next);
    expect(methods().getVerbBackground(), AssetPaths.verbsBack);
  });

  test('getCurrentWork always returns the placeholder work', () {
    final work = methods().getCurrentWork();
    expect(work!.emotions.single.emotionId, 0);
  });

  group('with an active creative session', () {
    setUp(() {
      AppInitializer.appData.appUser = AppUser(
        creativeModeWork: CreativeWork(
          emotions: const [1],
          currentEmotionIndex: 0,
          verbs: const [10],
          currentVerbIndex: 0,
        ),
      );
    });

    test('getCurrentEmotion resolves the emotion at the current index', () {
      expect(methods().getCurrentEmotion()?.id, 1);
    });

    test('getCurrentEmotionText uppercases the emotion title', () {
      expect(methods().getCurrentEmotionText(), 'FEAR ');
    });

    test('canPrevVerbTap is false at the first verb', () {
      expect(methods().canPrevVerbTap(), isFalse);
    });

    test('nextEmotionSet appends a new random emotion and selects it', () {
      methods().nextEmotionSet();
      final work = AppInitializer.appData.appUser!.creativeModeWork!;
      expect(work.emotions.length, 2);
      expect(work.currentEmotionIndex, 1);
      expect(AppInitializer.appData.metacards!.emotions.map((e) => e.id),
          contains(work.emotions.last));
    });

    test('nextVerbSet grows the verb list once at the boundary', () {
      methods().nextVerbSet();
      final work = AppInitializer.appData.appUser!.creativeModeWork!;
      expect(work.verbs.length, 2);
      expect(work.currentVerbIndex, 1);
    });

    test('nextVerbSet reuses an existing verb when not at the boundary', () {
      AppInitializer.appData.appUser = AppUser(
        creativeModeWork: CreativeWork(
          emotions: const [1],
          verbs: const [10, 20],
          currentVerbIndex: 0,
        ),
      );
      methods().nextVerbSet();
      final work = AppInitializer.appData.appUser!.creativeModeWork!;
      expect(work.verbs, const [10, 20]);
      expect(work.currentVerbIndex, 1);
    });

    test('prevVerbSet steps back and is a no-op at the first verb', () {
      AppInitializer.appData.appUser = AppUser(
        creativeModeWork: CreativeWork(
          emotions: const [1],
          verbs: const [10, 20],
          currentVerbIndex: 1,
        ),
      );
      methods().prevVerbSet();
      expect(
        AppInitializer.appData.appUser!.creativeModeWork!.currentVerbIndex,
        0,
      );

      methods().prevVerbSet();
      expect(
        AppInitializer.appData.appUser!.creativeModeWork!.currentVerbIndex,
        0,
      );
    });
  });
}
