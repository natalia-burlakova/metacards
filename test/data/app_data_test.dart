import 'package:flutter_secure_storage_platform_interface/flutter_secure_storage_platform_interface.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:metacards/data/constants.dart';
import 'package:metacards/data/models/app_user.dart';
import 'package:metacards/data/models/emotion.dart';
import 'package:metacards/data/models/meta_card_item.dart';
import 'package:metacards/data/models/meta_cards.dart';
import 'package:metacards/data/models/verb.dart';

import '../support/fake_secure_storage.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late AppData appData;

  setUp(() {
    FlutterSecureStoragePlatform.instance = FakeSecureStorage();
    appData = AppData()
      ..appUser = AppUser()
      ..metacards = MetaCards(
        emotions: [
          Emotion(id: 1, lines: [MetaCardItem(title: 'FEAR')]),
        ],
        verbs: [
          Verb(id: 10, lines: [MetaCardItem(title: 'BREATHE')]),
        ],
      );
    AppInitializer.appData = appData;
  });

  test('workMethods is the usual implementation with no creative session', () {
    expect(appData.workMethods, same(appData.usualWorkMethods));
  });

  test('workMethods switches to creative once creative mode is on', () {
    appData.creativeModeTurnOn();
    expect(appData.workMethods, same(appData.creativeWorkMethods));
  });

  test('creativeModeTurnOn seeds one random emotion and verb', () {
    appData.creativeModeTurnOn();
    final work = appData.appUser!.creativeModeWork!;
    expect(work.emotions, [1]);
    expect(work.verbs, [10]);
    expect(work.currentEmotionIndex, 0);
    expect(work.currentVerbIndex, 0);
  });

  test('creativeModeTurnOff clears the creative session', () {
    appData.creativeModeTurnOn();
    appData.creativeModeTurnOff();
    expect(appData.appUser!.creativeModeWork, isNull);
    expect(appData.workMethods, same(appData.usualWorkMethods));
  });

  test('creativeModeTurnOn notifies the update stream', () async {
    final future = expectLater(appData.updateStream, emits(true));
    appData.creativeModeTurnOn();
    await future;
  });
}
