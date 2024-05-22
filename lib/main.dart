import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:i18n_extension/i18n_widget.dart';
//import 'package:timeago/timeago.dart' as timeago;

import 'data/constants.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    //timeago.setLocaleMessages('ru', timeago.RuMessages());

    return I18n(
        initialLocale: const Locale('ru'),
        child: WillPopScope(
            onWillPop: () async {
              context.pop();
              return true;
            },
            child: MaterialApp.router(
              debugShowCheckedModeBanner: false,
              localizationsDelegates: const [
                GlobalMaterialLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
              ],
              supportedLocales: const [
                Locale('ru', ''),
              ],
              title: 'MetaCards',
              theme: ThemeData(fontFamily: 'Evolventa'),
              routerConfig: router,
            )));
  }
}
