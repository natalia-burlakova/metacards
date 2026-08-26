import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_secure_storage_platform_interface/flutter_secure_storage_platform_interface.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:metacards/data/constants.dart' as cnst;
import 'package:metacards/data/models/app_user.dart';
import 'package:metacards/data/models/emotion.dart';
import 'package:metacards/data/models/meta_card_item.dart';
import 'package:metacards/data/models/meta_cards.dart';
import 'package:metacards/data/models/verb.dart';
import 'package:metacards/general/ui/screen_adapt_widget.dart';
import 'package:metacards/l10n/app_localizations.dart';
import 'package:metacards/menu/pages/settings.dart';

import '../support/fake_secure_storage.dart';

void main() {
  setUp(() {
    FlutterSecureStoragePlatform.instance = FakeSecureStorage();
    cnst.AppInitializer.localeNotifier.value = const Locale('ru');
    cnst.AppInitializer.appData = cnst.AppData()
      ..appUser = AppUser()
      ..metacards = MetaCards(
        emotions: [
          Emotion(id: 1, lines: [MetaCardItem(title: 'FEAR')]),
        ],
        verbs: [
          Verb(id: 10, lines: [MetaCardItem(title: 'BREATHE')]),
        ],
      );
  });

  Widget buildApp() => ValueListenableBuilder<Locale>(
        valueListenable: cnst.AppInitializer.localeNotifier,
        builder: (context, locale, _) => MaterialApp(
          locale: locale,
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
          supportedLocales: const [Locale('ru'), Locale('en'), Locale('sr')],
          home: const ScreenAdaptation(
            designSize: Size(375, 812),
            child: Settings(),
          ),
        ),
      );

  testWidgets('defaults to Russian selected', (tester) async {
    await tester.pumpWidget(buildApp());
    await tester.pumpAndSettle();

    expect(find.text('Русский'), findsOneWidget);
    final dropdown =
        tester.widget<DropdownButton<String>>(find.byType(DropdownButton<String>));
    expect(dropdown.value, 'ru');
  });

  testWidgets('picking English switches locale, reloads data and persists it',
      (tester) async {
    await tester.pumpWidget(buildApp());
    await tester.pumpAndSettle();

    await tester.tap(find.byType(DropdownButton<String>));
    await tester.pumpAndSettle();
    // Options are labelled in the currently active locale (Russian), so the
    // English option reads "Английский" until after it is selected.
    await tester.tap(find.text('Английский').last);
    await tester.pumpAndSettle();

    expect(cnst.AppInitializer.localeNotifier.value.languageCode, 'en');
    expect(find.text('Language'), findsOneWidget);
    expect(find.text('English'), findsOneWidget);

    final saved = await FlutterSecureStoragePlatform.instance.read(
      key: 'locale_code',
      options: const {},
    );
    expect(saved, 'en');
  });
}
