import 'dart:async';
import 'dart:convert';
import 'dart:math';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:go_router/go_router.dart';
import 'package:metacards/dashboard/dashboard.dart';
import 'package:metacards/data/models/creative_work.dart';
import 'package:metacards/data/models/meta_cards.dart';
import 'package:metacards/data/work_function_creative.dart';
import 'package:metacards/data/work_function_interface.dart';
import 'package:metacards/data/work_functions_usual.dart';
import 'package:metacards/general/ui/screen_adapt_widget.dart';
import 'package:metacards/menu/pages/about_emotions.dart';
import 'package:metacards/menu/pages/about_school.dart';
import 'package:metacards/menu/pages/contacts.dart';
import 'package:metacards/menu/pages/donate.dart';
import 'package:metacards/menu/pages/settings.dart';
import 'package:metacards/menu/pages/work_list.dart';
import 'package:metacards/work/intention_add.dart';
import 'package:metacards/work/work_template.dart';
import 'models/app_user.dart';

class AppInitializer {
  AppInitializer._();
  static AppData appData = AppData();
  static final ValueNotifier<Locale> localeNotifier = ValueNotifier(
    const Locale(AppData.defaultLocale),
  );
}

class AppData extends ChangeNotifier {
  static const supportedDataLocales = {'ru', 'en', 'sr'};
  static const defaultLocale = 'ru';

  AppUser? appUser;
  MetaCards? metacards;

  final UsualWorkMethods usualWorkMethods = UsualWorkMethods();
  final CreativeWorkMethods creativeWorkMethods = CreativeWorkMethods();

  // Stream for real-time transcripts
  final StreamController<bool> _updateController =
      StreamController<bool>.broadcast();
  Stream<bool> get updateStream => _updateController.stream;
  StreamController<bool> get updateController => _updateController;

  IWorkMethods? get workMethods => appUser?.creativeModeWork == null
      ? usualWorkMethods
      : creativeWorkMethods;

  Future<bool> initialize(context) async {
    await loadMetacardsForLocale(
      context,
      AppInitializer.localeNotifier.value.languageCode,
    );

    final appDataRaw = await storage.read(key: 'app_data');
    if (appDataRaw != null) {
      isFirstStart = false;
      appUser = AppUser.fromJson(json.decode(appDataRaw));
    } else {
      //create user for next time
      appUser = AppUser();
      await storage.write(
        key: 'app_data',
        value: json.encode(appUser!.toJson()),
      );
    }
    return true;
  }

  Future<void> loadMetacardsForLocale(context, String languageCode) async {
    final dataLocale = supportedDataLocales.contains(languageCode)
        ? languageCode
        : 'ru';
    final cardsRaw = await DefaultAssetBundle.of(
      context,
    ).loadString("assets/data_$dataLocale.json");
    metacards = MetaCards.fromJson(jsonDecode(cardsRaw));
  }

  Future<void> setLocale(context, String languageCode) async {
    await storage.write(key: 'locale_code', value: languageCode);
    AppInitializer.localeNotifier.value = Locale(languageCode);
    await loadMetacardsForLocale(context, languageCode);
    _updateController.add(true);
  }

  void creativeModeTurnOn() {
    final work = CreativeWork(
      emotions: [
        metacards!.emotions[Random().nextInt(metacards!.emotions.length)].id,
      ],
      currentEmotionIndex: 0,
      verbs: [metacards!.verbs[Random().nextInt(metacards!.verbs.length)].id],
      currentVerbIndex: 0,
    );
    AppUser user = appUser!.copyWith(creativeModeWork: work);
    final appData = json.encode(user.toJson());
    if (kDebugMode) print(appData);
    storage.write(key: 'app_data', value: appData);
    appUser = user;
    _updateController.add(true);
  }

  void creativeModeTurnOff() {
    AppUser user = appUser!.copyWith(creativeModeWork: null);
    final appData = json.encode(user.toJson());
    if (kDebugMode) print(appData);
    storage.write(key: 'app_data', value: appData);
    appUser = user;
    _updateController.add(true);
  }
}

const storage = FlutterSecureStorage();
bool isFirstStart = true;

class AssetPaths {
  AssetPaths._();

  static String emotionsFront = 'assets/emotions_front.png';
  static String emotionsBack = 'assets/emotions_back.png';
  static String verbsFront = 'assets/verbs_front.png';
  static String verbsBack = 'assets/verbs_back.png';
  static String generatorArrow = 'assets/generator_arrow.png';
  static String backArrow = 'assets/back_arrow.png';
  static String separatorUp = 'assets/separator_up.png';
  static String separatorDown = 'assets/separator_down.png';
  static String celebrationGif = 'assets/celebration.gif';
  static String logoTransparent = 'assets/logo_transp.png';
  static String whatsappLogo = 'assets/whatsapp.png';
}

final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) =>
          const ScreenAdaptation(
            designSize: Size(375, 812),
            child: Dashboard(),
          ),
      routes: [
        GoRoute(
          path: 'intention_add',
          builder: (BuildContext context, GoRouterState state) =>
              const IntentionAdd(),
        ),
        GoRoute(
          path: 'work_template',
          builder: (BuildContext context, GoRouterState state) =>
              const WorkTemplate(),
        ),
        GoRoute(
          path: 'work_list',
          builder: (BuildContext context, GoRouterState state) =>
              const WorkList(),
        ),
        GoRoute(
          path: 'about_school',
          builder: (BuildContext context, GoRouterState state) =>
              const AboutSchool(),
        ),
        GoRoute(
          path: 'donate',
          builder: (BuildContext context, GoRouterState state) =>
              const Donate(),
        ),
        GoRoute(
          path: 'about_emotions',
          builder: (BuildContext context, GoRouterState state) =>
              const AboutEmotions(),
        ),
        GoRoute(
          path: 'contacts',
          builder: (BuildContext context, GoRouterState state) =>
              const Contacts(),
        ),
        GoRoute(
          path: 'settings',
          builder: (BuildContext context, GoRouterState state) =>
              const Settings(),
        ),
      ],
    ),
  ],
);

const double appBarHeight = 55.0;
final BorderRadius borderRadius15 = BorderRadius.circular(15.0);
final RoundedRectangleBorder borderTranspRadius15 = RoundedRectangleBorder(
  side: const BorderSide(color: Colors.transparent),
  borderRadius: borderRadius15,
);

final GlobalKey<ScaffoldState> globalKey = GlobalKey();

enum EmotionState { intensionAbsent, generateList, next, verbsNotEnd, end }

enum VerbState { generateList, next, end }
