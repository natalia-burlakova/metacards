import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:metacards/l10n/app_localizations.dart';

import 'data/constants.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  final storedLocaleCode = await storage.read(key: 'locale_code');
  if (storedLocaleCode != null) {
    AppInitializer.localeNotifier.value = Locale(storedLocaleCode);
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<Locale>(
      valueListenable: AppInitializer.localeNotifier,
      builder: (context, locale, _) => MaterialApp.router(
        debugShowCheckedModeBanner: false,
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: const [Locale('ru'), Locale('en'), Locale('sr')],
        locale: locale,
        title: 'MetaCards',
        theme: ThemeData(fontFamily: 'Evolventa'),
        routerConfig: router,
      ),
    );
  }
}
