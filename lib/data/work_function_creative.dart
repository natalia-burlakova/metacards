import 'dart:convert';
import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:metacards/l10n/app_localizations.dart';
import 'package:metacards/data/constants.dart';
import 'package:metacards/data/models/emotion.dart';
import 'package:metacards/data/models/emotion_in_progress.dart';
import 'package:metacards/data/models/verb.dart';
import 'package:metacards/data/models/work_in_progress.dart';
import 'package:metacards/data/work_function_interface.dart';
import 'package:metacards/general/const/app_text_styles.dart';
import 'package:metacards/general/ui/yesno_dialog.dart';
import 'package:metacards/general/utils/screen_adapt.dart';
import 'package:metacards/data/constants.dart' as cnst;

class CreativeWorkMethods extends IWorkMethods {
  @override
  void addWork(WorkInProgress work) {}

  @override
  void deleteWork(int workIndex) {}

  @override
  void generateEmotionsList() {}

  @override
  void generateVerbsList() {}

  @override
  String getCurrentEmotionText() {
    String title = '';
    final emotion = getEmotionById(
      cnst.AppInitializer.appData.appUser!.creativeModeWork!.emotions[cnst
          .AppInitializer
          .appData
          .appUser!
          .creativeModeWork!
          .currentEmotionIndex],
    );
    if (emotion != null) {
      for (int i = 0; i < emotion.lines.length; i++) {
        title += '${emotion.lines[i].title.toUpperCase()} ';
      }
    }

    return title;
  }

  @override
  WorkInProgress? getCurrentWork() {
    return WorkInProgress(emotions: [EmotionInProgress(emotionId: 0)]);
  }

  @override
  void nextEmotionSet() {
    List<int> emotions = [];
    emotions.addAll(
      cnst.AppInitializer.appData.appUser!.creativeModeWork!.emotions,
    );
    emotions.add(
      cnst
          .AppInitializer
          .appData
          .metacards!
          .emotions[Random().nextInt(
            cnst.AppInitializer.appData.metacards!.emotions.length,
          )]
          .id,
    );
    var user = cnst.AppInitializer.appData.appUser!.copyWith(
      creativeModeWork: cnst.AppInitializer.appData.appUser!.creativeModeWork!
          .copyWith(
            emotions: emotions,
            currentEmotionIndex: emotions.length - 1,
          ),
    );
    final appData = json.encode(user.toJson());
    if (kDebugMode) print(appData);
    storage.write(key: 'app_data', value: appData);
    cnst.AppInitializer.appData.appUser = user;
    cnst.AppInitializer.appData.updateController.add(true);
  }

  @override
  void nextVerbSet() {
    if (cnst
            .AppInitializer
            .appData
            .appUser!
            .creativeModeWork!
            .currentVerbIndex ==
        cnst.AppInitializer.appData.appUser!.creativeModeWork!.verbs.length -
            1) {
      List<int> verbs = [];
      verbs.addAll(
        cnst.AppInitializer.appData.appUser!.creativeModeWork!.verbs,
      );
      verbs.add(
        cnst
            .AppInitializer
            .appData
            .metacards!
            .verbs[Random().nextInt(
              cnst.AppInitializer.appData.metacards!.verbs.length,
            )]
            .id,
      );
      var user = cnst.AppInitializer.appData.appUser!.copyWith(
        creativeModeWork: cnst.AppInitializer.appData.appUser!.creativeModeWork!
            .copyWith(verbs: verbs, currentVerbIndex: verbs.length - 1),
      );
      cnst.AppInitializer.appData.appUser = user;
    } else {
      var user = cnst.AppInitializer.appData.appUser!.copyWith(
        creativeModeWork: cnst.AppInitializer.appData.appUser!.creativeModeWork!
            .copyWith(
              currentVerbIndex:
                  cnst
                      .AppInitializer
                      .appData
                      .appUser!
                      .creativeModeWork!
                      .currentVerbIndex +
                  1,
            ),
      );
      cnst.AppInitializer.appData.appUser = user;
    }
    final appData = json.encode(cnst.AppInitializer.appData.appUser!.toJson());
    if (kDebugMode) print(appData);
    storage.write(key: 'app_data', value: appData);
  }

  @override
  void prevVerbSet() {
    if (cnst
            .AppInitializer
            .appData
            .appUser!
            .creativeModeWork!
            .currentVerbIndex >
        0) {
      var user = cnst.AppInitializer.appData.appUser!.copyWith(
        creativeModeWork: cnst.AppInitializer.appData.appUser!.creativeModeWork!
            .copyWith(
              currentVerbIndex:
                  cnst
                      .AppInitializer
                      .appData
                      .appUser!
                      .creativeModeWork!
                      .currentVerbIndex -
                  1,
            ),
      );
      cnst.AppInitializer.appData.appUser = user;
      final appData = json.encode(
        cnst.AppInitializer.appData.appUser!.toJson(),
      );
      if (kDebugMode) print(appData);
      storage.write(key: 'app_data', value: appData);
    }
  }

  @override
  void startWorkAgain(int index) {}

  @override
  Widget getWorkDeleteDialog(
    BuildContext dialogContext,
    int index,
    Function() endFunc,
  ) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: YesNoDialog(
            height: 210.0.a,
            title: AppLocalizations.of(
              dialogContext,
            )!.creativeModeDisableConfirm,
            yesFunction: () {
              cnst.AppInitializer.appData.creativeModeTurnOff();
              endFunc();
            },
          ),
        ),
      ],
    );
  }

  @override
  Emotion? getCurrentEmotion() {
    return (cnst.AppInitializer.appData.appUser!.creativeModeWork != null &&
            cnst
                .AppInitializer
                .appData
                .appUser!
                .creativeModeWork!
                .emotions
                .isNotEmpty)
        ? cnst.AppInitializer.appData.workMethods!.getEmotionById(
            cnst.AppInitializer.appData.appUser!.creativeModeWork!.emotions[cnst
                .AppInitializer
                .appData
                .appUser!
                .creativeModeWork!
                .currentEmotionIndex],
          )
        : null;
  }

  @override
  String getRestEmotionsCount() {
    return '...';
  }

  @override
  bool canDeleteWork() {
    return false;
  }

  @override
  EmotionState canNextEmotionTap() {
    return EmotionState.next;
  }

  @override
  VerbState canNextVerbTap() {
    return VerbState.next;
  }

  @override
  String getRestVerbCount() {
    return '...';
  }

  @override
  bool canPrevVerbTap() {
    return cnst
            .AppInitializer
            .appData
            .appUser!
            .creativeModeWork!
            .currentVerbIndex >
        0;
  }

  @override
  List<Widget> getVerbTitle(BuildContext context) {
    double ratio = MediaQuery.of(context).size.height / 700.0.a;
    ratio = ratio < 0 ? 1 : ratio;
    final separatorWidth = MediaQuery.of(context).size.width * 0.6 * ratio;
    final separatorHeight = (20.0 * ratio).a;
    final children = <Widget>[];
    Verb? verb = getVerbById(
      cnst.AppInitializer.appData.appUser!.creativeModeWork!.verbs[cnst
          .AppInitializer
          .appData
          .appUser!
          .creativeModeWork!
          .currentVerbIndex],
    );
    if (verb != null) {
      for (int i = 0; i < verb.lines.length; i++) {
        children.add(
          Text(
            verb.lines[i].title.toUpperCase(),
            textAlign: TextAlign.center,
            style: AppTextStyles.bold21.copyWith(
              fontSize: AppTextStyles.bold21.fontSize! * ratio,
            ),
          ),
        );
        if (verb.lines.length == 1) {
          children.add(
            Padding(
              padding: EdgeInsets.only(bottom: 10.0.a),
              child: Image.asset(
                cnst.AssetPaths.separatorUp,
                height: separatorHeight,
                width: separatorWidth,
              ),
            ),
          );
        }
        if (verb.lines[i].desc.isNotEmpty) {
          children.add(
            Text(
              verb.lines[i].desc.toUpperCase(),
              textAlign: TextAlign.center,
              style: AppTextStyles.medium18.copyWith(
                fontSize: AppTextStyles.medium18.fontSize! * ratio,
              ),
            ),
          );
        }
        if (verb.lines.length > 1 && i != verb.lines.length - 1) {
          children.add(
            Padding(
              padding: EdgeInsets.only(bottom: 10.0.a),
              child: Image.asset(
                cnst.AssetPaths.separatorUp,
                height: separatorHeight,
                width: separatorWidth,
              ),
            ),
          );
        }
      }
    }
    return children;
  }

  @override
  String getVerbBackground() {
    return cnst.AssetPaths.verbsBack;
  }

  @override
  Widget getCurrentVerbTitleWidget() {
    List<Widget> titleList = [];
    Verb? verb = getVerbById(
      cnst.AppInitializer.appData.appUser!.creativeModeWork!.verbs[cnst
          .AppInitializer
          .appData
          .appUser!
          .creativeModeWork!
          .currentVerbIndex],
    );
    if (verb != null) {
      for (int i = 0; i < verb.lines.length; i++) {
        titleList.add(
          Text(verb.lines[i].title.toUpperCase(), style: AppTextStyles.bold18),
        );
      }
    }
    if (titleList.isEmpty) {
      titleList.add(Text('???', style: AppTextStyles.bold18));
    }
    return Column(children: titleList);
  }

  @override
  bool canAddWork() {
    return false;
  }

  @override
  bool willDeleteOldestWork() {
    return false;
  }

  @override
  Widget getWorkSelectDialog(
    BuildContext dialogContext,
    int index,
    Function() endFunc,
  ) {
    return Container();
  }

  @override
  void returnToWork(int index) {}

  @override
  Emotion? getEmotionById(int emotionId) {
    if (cnst.AppInitializer.appData.metacards?.emotions.isNotEmpty ?? false) {
      for (
        int i = 0;
        i < cnst.AppInitializer.appData.metacards!.emotions.length;
        i++
      ) {
        if (cnst.AppInitializer.appData.metacards!.emotions[i].id ==
            emotionId) {
          return cnst.AppInitializer.appData.metacards!.emotions[i];
        }
      }
    }
    return null;
  }
}
