import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:metacards/data/constants.dart';
import 'package:metacards/data/models/app_user.dart';
import 'package:metacards/data/models/emotion_in_progress.dart';
import 'package:metacards/data/models/verb.dart';
import 'package:metacards/data/models/work_in_progress.dart';
import 'package:metacards/data/constants.dart' as cnst;
import 'package:metacards/general/const/app_text_styles.dart';
import 'package:metacards/general/utils/screen_adapt.dart';

import 'models/emotion.dart';

class WorkMethods {
  static void addWork(WorkInProgress work) {
    final works = <WorkInProgress>[];
    if (cnst.AppData.appUser?.works.isNotEmpty ?? false) {
      works.addAll(cnst.AppData.appUser!.works);
    }
    works.add(work);
    AppUser appUser = AppUser(works: cnst.AppData.appUser?.works ?? []);
    appUser = AppUser(currentWorkIndex: works.length - 1, works: works);
    cnst.AppData.appUser = appUser;
    final appData = json.encode(cnst.AppData.appUser!.toJson());
    print(appData);
    storage.write(key: 'app_data', value: appData);
  }

  static void startWorkAgain(int index) {
    final works = <WorkInProgress>[];
    if (cnst.AppData.appUser?.works.isNotEmpty ?? false) {
      works.addAll(cnst.AppData.appUser!.works);
    }
    works[index] = WorkInProgress(intention: works[index].intention);
    AppUser appUser = AppUser(works: cnst.AppData.appUser?.works ?? []);
    appUser = AppUser(currentWorkIndex: index, works: works);
    cnst.AppData.appUser = appUser;
    final appData = json.encode(cnst.AppData.appUser!.toJson());
    print(appData);
    storage.write(key: 'app_data', value: appData);
  }

  static void deleteWork(int workIndex) {
    final works = <WorkInProgress>[];
    works.addAll(AppData.appUser!.works);
    works.removeAt(workIndex);
    final user = AppUser(works: works);
    cnst.AppData.appUser = user;
    final appData = json.encode(cnst.AppData.appUser!.toJson());
    print(appData);
    storage.write(key: 'app_data', value: appData);
  }

  static void generateEmotionsList() {
    var rnd = Random();
    final emotionsCount = rnd.nextInt(20);
    final emotions = <EmotionInProgress>[];
    final emotionIds = <int>[];
    for (var i = 0; i < emotionsCount; i++) {
      var id = -1;
      id = cnst
          .AppData
          .metacards!
          .emotions[Random().nextInt(cnst.AppData.metacards!.emotions.length)]
          .id;
      // while (id >= 0 && emotionIds.contains(id)) {
      //   id = cnst
      //       .AppData
      //       .metacards!
      //       .emotions[Random().nextInt(cnst.AppData.metacards!.emotions.length)]
      //       .id;
      // }
      emotionIds.add(id);
      emotions.add(EmotionInProgress(emotionId: id));
    }
    final works = <WorkInProgress>[];
    works.addAll(AppData.appUser!.works);
    works[cnst.AppData.appUser!.currentWorkIndex] = WorkInProgress(
      intention: cnst.AppData.appUser!
          .works[cnst.AppData.appUser!.currentWorkIndex].intention,
      emotions: emotions,
    );
    cnst.AppData.appUser = AppUser(works: works);
    final appData = json.encode(cnst.AppData.appUser!.toJson());
    print(appData);
    storage.write(key: 'app_data', value: appData);
  }

  static Emotion? getEmotionById(int emotionId) {
    if (cnst.AppData.metacards?.emotions.isNotEmpty ?? false) {
      for (int i = 0; i < cnst.AppData.metacards!.emotions.length; i++) {
        if (cnst.AppData.metacards!.emotions[i].id == emotionId) {
          return cnst.AppData.metacards!.emotions[i];
        }
      }
    }
    return null;
  }

  static String getCurrentEmotionText() {
    String title = '';
    final work = (cnst.AppData.appUser?.works.isEmpty ?? true)
        ? null
        : cnst.AppData.appUser
            ?.works[cnst.AppData.appUser?.currentWorkIndex ?? 0];
    if (work != null && work.emotions.isNotEmpty) {
      final emotion = WorkMethods.getEmotionById(
          work.emotions[work.currentEmotionIndex].emotionId); 
      if (emotion != null) {
        for (int i = 0; i < emotion.lines.length; i++) {
          title += '${emotion.lines[i].title.toUpperCase()} ';
        }
      }
    }
    return title;
  }

  static Widget getCurrentVerbTitleWidget() {
    List<Widget> titleList = [];
    final work = (cnst.AppData.appUser?.works.isEmpty ?? true)
        ? null
        : cnst.AppData.appUser
            ?.works[cnst.AppData.appUser?.currentWorkIndex ?? 0];
    if (work != null && work.emotions.isNotEmpty) {
      final emotion = work.emotions[work.currentEmotionIndex];
      if (emotion.verbIds.isNotEmpty) {
        final verb =
            WorkMethods.getVerbById(emotion.verbIds[emotion.currentVerbIndex]);
        if (verb != null) {
          for (int i = 0; i < verb.lines.length; i++) {
            titleList.add(Text(
              verb.lines[i].title.toUpperCase(),
              style: AppTextStyles.bold18,
            ));
          }
        }
      }
    }
    if (titleList.isEmpty) {
      titleList.add(Text(
        '???',
        style: AppTextStyles.bold18,
      ));
    }
    return Column(
      children: titleList,
    );
  }

  static List<Widget> getEmotionTitle(Emotion emotion, BuildContext context) {
    double ratio = MediaQuery.of(context).size.height / 700.0.a;
    ratio = ratio < 0 ? 1 : ratio;
    final separatorWidth = MediaQuery.of(context).size.width * 0.6 * ratio;
    final separatorHeight = (20.0 * ratio).a;
    final children = <Widget>[];
    if (emotion.lines.length == 1 && emotion.lines[0].desc.isEmpty) {
      children.add(
        Image.asset(
          cnst.AssetPaths.separatorUp,
          height: separatorHeight,
          width: separatorWidth,
        ),
      );
    }
    for (int i = 0; i < emotion.lines.length; i++) {
      if (emotion.lines.length > 1 && i == 1) {
        children.add(
          Image.asset(
            cnst.AssetPaths.separatorUp,
            height: separatorHeight,
            width: separatorWidth,
          ),
        );
      }
      children.add(
        Text(
          emotion.lines[i].title.toUpperCase(),
          textAlign: TextAlign.center,
          style: AppTextStyles.bold21
              .copyWith(fontSize: AppTextStyles.bold21.fontSize! * ratio),
        ),
      );
      if (emotion.lines.length > 1 && i == 1) {
        children.add(
          Image.asset(
            cnst.AssetPaths.separatorDown,
            height: separatorHeight,
            width: separatorWidth,
          ),
        );
      }
      if (emotion.lines[i].desc.isNotEmpty) {
        if (emotion.lines.length == 1) {
          children.add(
            Image.asset(
              cnst.AssetPaths.separatorUp,
              height: separatorHeight,
              width: separatorWidth,
            ),
          );
        }
        children.add(
          Text(
            emotion.lines[i].desc.toUpperCase(),
            textAlign: TextAlign.center,
            style: AppTextStyles.medium18
                .copyWith(fontSize: AppTextStyles.medium18.fontSize! * ratio),
          ),
        );
      }
    }
    if (emotion.lines.length == 1) {
      children.add(
        Image.asset(
          cnst.AssetPaths.separatorDown,
          height: separatorHeight,
          width: separatorWidth,
        ),
      );
    }
    return children;
  }

  static bool nextEmotionSet() {
    bool isDone = false;
    if (cnst.AppData.appUser?.works.isNotEmpty ?? false) {
      final work = cnst
          .AppData.appUser?.works[cnst.AppData.appUser?.currentWorkIndex ?? 0];
      if (work != null &&
          work.currentEmotionIndex < work.emotions.length - 1 &&
          work.emotions[work.currentEmotionIndex].currentVerbIndex ==
              work.emotions[work.currentEmotionIndex].verbIds.length - 1 &&
          work.emotions[work.currentEmotionIndex].verbIds.isNotEmpty) {
        final works = <WorkInProgress>[];
        works.addAll(AppData.appUser!.works);
        works[cnst.AppData.appUser!.currentWorkIndex] = WorkInProgress(
            intention: cnst.AppData.appUser!
                .works[cnst.AppData.appUser!.currentWorkIndex].intention,
            emotions: cnst.AppData.appUser!
                .works[cnst.AppData.appUser!.currentWorkIndex].emotions,
            currentEmotionIndex: work.currentEmotionIndex + 1);
        cnst.AppData.appUser = AppUser(works: works);
        final appData = json.encode(cnst.AppData.appUser!.toJson());
        print(appData);
        storage.write(key: 'app_data', value: appData);
      }
    }
    return isDone;
  }

  static void generateVerbsList() {
    final work = cnst
        .AppData.appUser?.works[cnst.AppData.appUser?.currentWorkIndex ?? 0];
    if (work != null && work.emotions.isNotEmpty) {
      final emotion = work.emotions[work.currentEmotionIndex];
      var rnd = Random();
      final verbsCount = rnd.nextInt(20);
      final verbsIds = <int>[];
      for (var i = 0; i < verbsCount; i++) {
        var id = -1;
        id = cnst.AppData.metacards!
            .verbs[Random().nextInt(cnst.AppData.metacards!.verbs.length)].id;
        // while (id >= 0 && verbsIds.contains(id)) {
        //   id = cnst.AppData.metacards!
        //       .verbs[Random().nextInt(cnst.AppData.metacards!.verbs.length)].id;
        // }
        verbsIds.add(id);
      }

      EmotionInProgress emotionWithVerbs = EmotionInProgress(
          emotionId: emotion.emotionId, verbIds: verbsIds, currentVerbIndex: 0);

      List<EmotionInProgress> emotions = [];
      emotions.addAll(work.emotions);
      emotions[cnst
          .AppData
          .appUser!
          .works[cnst.AppData.appUser!.currentWorkIndex]
          .currentEmotionIndex] = emotionWithVerbs;
      final works = <WorkInProgress>[];
      works.addAll(AppData.appUser!.works);
      works[cnst.AppData.appUser!.currentWorkIndex] = WorkInProgress(
          intention: cnst.AppData.appUser!
              .works[cnst.AppData.appUser!.currentWorkIndex].intention,
          emotions: emotions,
          currentEmotionIndex: cnst
              .AppData
              .appUser!
              .works[cnst.AppData.appUser!.currentWorkIndex]
              .currentEmotionIndex);
      cnst.AppData.appUser = AppUser(works: works);
      final appData = json.encode(cnst.AppData.appUser!.toJson());
      print(appData);
      storage.write(key: 'app_data', value: appData);
    }
  }

  static List<Widget> getVerbTitle(
      EmotionInProgress emotion, BuildContext context) {
    double ratio = MediaQuery.of(context).size.height / 700.0.a;
    ratio = ratio < 0 ? 1 : ratio;
    final separatorWidth = MediaQuery.of(context).size.width * 0.6 * ratio;
    final separatorHeight = (20.0 * ratio).a;
    final children = <Widget>[];
    if (emotion.currentVerbIndex < emotion.verbIds.length ||
        (emotion.currentVerbIndex == 0 && emotion.verbIds.isNotEmpty)) {
      Verb? verb = getVerbById(emotion.verbIds[emotion.currentVerbIndex]);
      if (verb != null) {
        for (int i = 0; i < verb.lines.length; i++) {
          children.add(
            Text(
              verb.lines[i].title.toUpperCase(),
              textAlign: TextAlign.center,
              style: AppTextStyles.bold21
                  .copyWith(fontSize: AppTextStyles.bold21.fontSize! * ratio),
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
                    fontSize: AppTextStyles.medium18.fontSize! * ratio),
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
    }
    return children;
  }

  static Verb? getVerbById(int id) {
    if (cnst.AppData.metacards?.verbs.isNotEmpty ?? false) {
      for (int i = 0; i < cnst.AppData.metacards!.verbs.length; i++) {
        if (cnst.AppData.metacards!.verbs[i].id == id) {
          return cnst.AppData.metacards!.verbs[i];
        }
      }
    }
    return null;
  }

  static void nextVerbSet() {
    final work = cnst
        .AppData.appUser?.works[cnst.AppData.appUser?.currentWorkIndex ?? 0];
    if (work != null && work.emotions.isNotEmpty) {
      final emotion = work.emotions[work.currentEmotionIndex];

      EmotionInProgress emotionWithVerbs = EmotionInProgress(
          emotionId: emotion.emotionId,
          verbIds: emotion.verbIds,
          currentVerbIndex: emotion.currentVerbIndex + 1);

      List<EmotionInProgress> emotions = [];
      emotions.addAll(work.emotions);
      emotions[cnst
          .AppData
          .appUser!
          .works[cnst.AppData.appUser!.currentWorkIndex]
          .currentEmotionIndex] = emotionWithVerbs;
      final works = <WorkInProgress>[];
      works.addAll(AppData.appUser!.works);
      works[cnst.AppData.appUser!.currentWorkIndex] = WorkInProgress(
          intention: cnst.AppData.appUser!
              .works[cnst.AppData.appUser!.currentWorkIndex].intention,
          emotions: emotions,
          currentEmotionIndex: cnst
              .AppData
              .appUser!
              .works[cnst.AppData.appUser!.currentWorkIndex]
              .currentEmotionIndex);
      cnst.AppData.appUser = AppUser(works: works);
      final appData = json.encode(cnst.AppData.appUser!.toJson());
      print(appData);
      storage.write(key: 'app_data', value: appData);
    }
  }

  static void prevVerbSet() {
    final work = cnst
        .AppData.appUser?.works[cnst.AppData.appUser?.currentWorkIndex ?? 0];
    if (work != null && work.emotions.isNotEmpty) {
      final emotion = work.emotions[work.currentEmotionIndex];
      if (emotion.currentVerbIndex > 0) {
        EmotionInProgress emotionWithVerbs = EmotionInProgress(
            emotionId: emotion.emotionId,
            verbIds: emotion.verbIds,
            currentVerbIndex: emotion.currentVerbIndex - 1);

        List<EmotionInProgress> emotions = [];
        emotions.addAll(work.emotions);
        emotions[work.currentEmotionIndex] = emotionWithVerbs;
        final works = <WorkInProgress>[];
        works.addAll(AppData.appUser!.works);
        works[cnst.AppData.appUser!.currentWorkIndex] = WorkInProgress(
            intention: cnst.AppData.appUser!
                .works[cnst.AppData.appUser!.currentWorkIndex].intention,
            emotions: emotions,
            currentEmotionIndex: cnst
                .AppData
                .appUser!
                .works[cnst.AppData.appUser!.currentWorkIndex]
                .currentEmotionIndex);
        cnst.AppData.appUser = AppUser(works: works);
        final appData = json.encode(cnst.AppData.appUser!.toJson());
        print(appData);
        storage.write(key: 'app_data', value: appData);
      }
    }
  }
}
