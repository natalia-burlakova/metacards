import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_secure_storage_platform_interface/flutter_secure_storage_platform_interface.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:metacards/data/constants.dart' as cnst;
import 'package:metacards/data/models/app_user.dart';
import 'package:metacards/data/models/emotion.dart';
import 'package:metacards/data/models/meta_card_item.dart';
import 'package:metacards/data/models/meta_cards.dart';
import 'package:metacards/data/models/verb.dart';
import 'package:metacards/general/ui/screen_adapt_widget.dart';
import 'package:metacards/l10n/app_localizations.dart';
import 'package:metacards/onboarding/welcome_page.dart';

import '../support/fake_secure_storage.dart';

void main() {
  setUp(() {
    // rootBundle caches loaded asset strings on the bundle instance itself;
    // across tests in this file that cache can outlive the test's own
    // message-channel plumbing and leave later `loadString` calls hanging.
    rootBundle.clear();
    FlutterSecureStoragePlatform.instance = FakeSecureStorage();
    cnst.hasUserProfile = false;
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

  Widget buildApp() {
    final router = GoRouter(
      initialLocation: '/welcome',
      routes: [
        GoRoute(
          path: '/welcome',
          builder: (context, state) => const ScreenAdaptation(
            designSize: Size(375, 812),
            child: WelcomePage(),
          ),
        ),
        GoRoute(path: '/', builder: (context, state) => const Placeholder()),
      ],
    );
    return MaterialApp.router(
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: const [Locale('ru'), Locale('en'), Locale('sr')],
      locale: const Locale('ru'),
      routerConfig: router,
    );
  }

  testWidgets('defaults language selection to a supported device locale',
      (tester) async {
    tester.platformDispatcher.localeTestValue = const Locale('en');
    addTearDown(tester.platformDispatcher.clearLocaleTestValue);

    await tester.pumpWidget(buildApp());
    await tester.pumpAndSettle();

    await tester.enterText(find.byType(TextField), 'Alex');
    await tester.tap(find.text('Продолжить'));
    await tester.pumpAndSettle();

    expect(cnst.AppInitializer.localeNotifier.value.languageCode, 'en');
  });

  testWidgets('falls back to Russian when the device locale is unsupported',
      (tester) async {
    tester.platformDispatcher.localeTestValue = const Locale('fr');
    addTearDown(tester.platformDispatcher.clearLocaleTestValue);

    await tester.pumpWidget(buildApp());
    await tester.pumpAndSettle();

    await tester.enterText(find.byType(TextField), 'Alex');
    await tester.tap(find.text('Продолжить'));
    await tester.pumpAndSettle();

    expect(cnst.AppInitializer.localeNotifier.value.languageCode, 'ru');
  });

  testWidgets('tapping a flag overrides the default language selection',
      (tester) async {
    tester.platformDispatcher.localeTestValue = const Locale('ru');
    addTearDown(tester.platformDispatcher.clearLocaleTestValue);

    await tester.pumpWidget(buildApp());
    await tester.pumpAndSettle();

    await tester.tap(find.byTooltip('Английский'));
    await tester.pumpAndSettle();
    await tester.enterText(find.byType(TextField), 'Alex');
    await tester.tap(find.text('Продолжить'));
    await tester.pumpAndSettle();

    expect(cnst.AppInitializer.localeNotifier.value.languageCode, 'en');
  });

  testWidgets('requires a name before continuing', (tester) async {
    await tester.pumpWidget(buildApp());
    await tester.pumpAndSettle();

    await tester.tap(find.text('Продолжить'));
    await tester.pumpAndSettle();

    expect(find.text('Пожалуйста, введите ваше имя'), findsOneWidget);
    expect(find.byType(WelcomePage), findsOneWidget);
    expect(cnst.hasUserProfile, isFalse);
  });

  testWidgets(
      'saves name and locale, marks the profile complete, and navigates on',
      (tester) async {
    await tester.pumpWidget(buildApp());
    await tester.pumpAndSettle();

    await tester.enterText(find.byType(TextField), 'Alex');
    await tester.tap(find.text('Продолжить'));
    await tester.pumpAndSettle();

    expect(cnst.hasUserProfile, isTrue);
    expect(cnst.AppInitializer.appData.userName, 'Alex');
    expect(find.byType(WelcomePage), findsNothing);

    final savedName = await FlutterSecureStoragePlatform.instance
        .read(key: 'user_name', options: const {});
    expect(savedName, 'Alex');
  });
}
