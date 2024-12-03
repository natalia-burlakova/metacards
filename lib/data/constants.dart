import 'dart:convert';
import 'dart:math';
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
import 'package:metacards/menu/pages/work_list.dart';
import 'package:metacards/work/intention_add.dart';
import 'package:metacards/work/work_template.dart';
import 'models/app_user.dart';

class AppData {
  const AppData._();

  static AppUser? appUser;
  static MetaCards? metacards;

  static UsualWorkMethods usualWorkMethods = UsualWorkMethods();
  static CreativeWorkMethods creativeWorkMethods = CreativeWorkMethods();

  static IWorkMethods? get workMethods => appUser?.creativeModeWork == null
      ? usualWorkMethods
      : creativeWorkMethods;

  static Future<bool> getStaticData(context) async {
    String cardsRaw =
        await DefaultAssetBundle.of(context).loadString("assets/data.json");
    metacards = MetaCards.fromJson(jsonDecode(cardsRaw));

    final appDataRaw = await storage.read(key: 'app_data');
    if (appDataRaw != null) {
      isFirstStart = false;
      AppData.appUser = AppUser.fromJson(json.decode(appDataRaw));
    } else {
      //create user for next time
      AppData.appUser = AppUser();
      await storage.write(
          key: 'app_data', value: json.encode(AppData.appUser!.toJson()));
    }
    return true;
  }

  static void creativeModeTurnOn() {
    final work = CreativeWork(
        emotions: [
          AppData.metacards!
              .emotions[Random().nextInt(AppData.metacards!.emotions.length)].id
        ],
        currentEmotionIndex: 0,
        verbs: [
          AppData.metacards!
              .verbs[Random().nextInt(AppData.metacards!.verbs.length)].id
        ],
        currentVerbIndex: 0);
    AppUser appUser = AppData.appUser!.copyWith(creativeModeWork: work);
    AppData.appUser = appUser;
    final appData = json.encode(AppData.appUser!.toJson());
    print(appData);
    storage.write(key: 'app_data', value: appData);
  }

  static void creativeModeTurnOff() {
    AppUser appUser = AppData.appUser!.copyWith(creativeModeWork: null);
    AppData.appUser = appUser;
    final appData = json.encode(AppData.appUser!.toJson());
    print(appData);
    storage.write(key: 'app_data', value: appData);
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
              designSize: Size(375, 812), child: Dashboard()),
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
                const WorkList()),
        GoRoute(
            path: 'about_school',
            builder: (BuildContext context, GoRouterState state) =>
                const AboutSchool()),
        GoRoute(
            path: 'donate',
            builder: (BuildContext context, GoRouterState state) =>
                const Donate()),
        GoRoute(
            path: 'about_emotions',
            builder: (BuildContext context, GoRouterState state) =>
                const AboutEmotions()),
        GoRoute(
            path: 'contacts',
            builder: (BuildContext context, GoRouterState state) =>
                const Contacts()),
      ],
    ),
  ],
);

const double appBarHeight = 55.0;
final BorderRadius borderRadius15 = BorderRadius.circular(15.0);
final RoundedRectangleBorder borderTranspRadius15 = RoundedRectangleBorder(
    side: const BorderSide(
      color: Colors.transparent,
    ),
    borderRadius: borderRadius15);

final GlobalKey<ScaffoldState> globalKey = GlobalKey();

enum EmotionState { intensionAbsent, generateList, next, verbsNotEnd, end }

enum VerbState { generateList, next, end }

enum WorkState { notStarted, inProgressFullList, inProgressExistplace }
