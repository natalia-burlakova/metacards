import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:metacards/data/constants.dart';
import 'package:metacards/data/models/app_user.dart';
import 'package:metacards/data/models/emotion_in_progress.dart';
import 'package:metacards/data/models/verb.dart';
import 'package:metacards/data/models/work_in_progress.dart';
import 'package:metacards/data/constants.dart' as cnst;
import 'package:metacards/data/work_function_interface.dart';
import 'package:metacards/general/const/app_text_styles.dart';
import 'package:metacards/general/ui/yesno_dialog.dart';
import 'package:metacards/general/utils/screen_adapt.dart';

import 'models/emotion.dart';

class UsualWorkMethods extends IWorkMethods {
  @override
  WorkInProgress? getCurrentWork() {
    return (cnst.AppData.appUser?.works.isEmpty ?? true)
        ? null
        : cnst.AppData.appUser
            ?.works[cnst.AppData.appUser?.currentWorkIndex ?? 0];
  }

  @override
  void addWork(WorkInProgress work) {
    final works = <WorkInProgress>[];
    if (cnst.AppData.appUser?.works.isNotEmpty ?? false) {
      works.addAll(cnst.AppData.appUser!.works);
    }
    if (works.length >= 3) {
      works.removeAt(0);
    }
    works.add(work);
    AppUser appUser = AppUser(works: cnst.AppData.appUser?.works ?? []);
    appUser = AppUser(currentWorkIndex: works.length - 1, works: works);
    cnst.AppData.appUser = appUser;
    final appData = json.encode(cnst.AppData.appUser!.toJson());
    print(appData);
    storage.write(key: 'app_data', value: appData);
  }

  @override
  void startWorkAgain(int index) {
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

  @override
  void deleteWork(int workIndex) {
    final works = <WorkInProgress>[];
    works.addAll(AppData.appUser!.works);
    works.removeAt(workIndex);
    final user = AppUser(currentWorkIndex: works.length - 1, works: works);
    cnst.AppData.appUser = user;
    final appData = json.encode(cnst.AppData.appUser!.toJson());
    print(appData);
    storage.write(key: 'app_data', value: appData);
  }

  @override
  void generateEmotionsList() {
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
    cnst.AppData.appUser = cnst.AppData.appUser!.copyWith(works: works);
    final appData = json.encode(cnst.AppData.appUser!.toJson());
    print(appData);
    storage.write(key: 'app_data', value: appData);
  }

  @override
  String getCurrentEmotionText() {
    String title = '';
    final work = getCurrentWork();
    if (work != null && work.emotions.isNotEmpty) {
      final emotion =
          getEmotionById(work.emotions[work.currentEmotionIndex].emotionId);
      if (emotion != null) {
        for (int i = 0; i < emotion.lines.length; i++) {
          title += '${emotion.lines[i].title.toUpperCase()} ';
        }
      }
    }
    return title;
  }

  @override
  Widget getCurrentVerbTitleWidget() {
    List<Widget> titleList = [];
    final work = getCurrentWork();
    if (work != null && work.emotions.isNotEmpty) {
      final emotion = work.emotions[work.currentEmotionIndex];
      if (emotion.verbIds.isNotEmpty) {
        final verb = cnst.AppData.workMethods!
            .getVerbById(emotion.verbIds[emotion.currentVerbIndex]);
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

  @override
  void nextEmotionSet() {
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
  }

  @override
  void generateVerbsList() {
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

  @override
  void nextVerbSet() {
    if (cnst.AppData.appUser != null &&
        cnst.AppData.appUser!.works.isNotEmpty) {
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
  }

  @override
  void prevVerbSet() {
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

  @override
  Widget getWorkDeleteDialog(
      BuildContext dialogContext, int index, Function() endFunc) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: YesNoDialog(
            height: 210.0.a,
            title:
                'Вы точно хотите полностью удалить работу по данному намерению "${AppData.appUser!.works[index].intention}"?',
            yesFunction: () {
              deleteWork(index);
              endFunc();
            },
          ),
        )
      ],
    );
  }

  @override
  Emotion? getCurrentEmotion() {
    final work = cnst.AppData.workMethods!.getCurrentWork();
    return (work != null && work.emotions.isNotEmpty)
        ? cnst.AppData.workMethods!
            .getEmotionById(work.emotions[work.currentEmotionIndex].emotionId)
        : null;
  }

  @override
  String getRestEmotionsCount() {
    final work = getCurrentWork();
    if (work != null) {
      final cnt = work.emotions.length - work.currentEmotionIndex;
      return cnt > 0 ? cnt.toString() : '?';
    } else {
      return '?';
    }
  }

  @override
  bool canDeleteWork() {
    return (cnst.AppData.appUser?.works.isNotEmpty ?? false);
  }

  @override
  EmotionState canNextEmotionTap() {
    final work = getCurrentWork();
    if ((work?.intention ?? '').isNotEmpty &&
        (work?.emotions.isEmpty ?? true)) {
      return EmotionState.generateList;
    } else {
      final emotion = work?.emotions[work.currentEmotionIndex];
      //если нет намерения - предупреждение что надо заполнить
      if ((work?.intention ?? '').isEmpty) {
        return EmotionState.intensionAbsent;
      } else if (work != null && work.emotions.isNotEmpty) {
        if (emotion != null &&
            emotion.currentVerbIndex == emotion.verbIds.length - 1 &&
            emotion.verbIds.isNotEmpty) {
          if (work.currentEmotionIndex == work.emotions.length - 1) {
            return EmotionState.end;
          } else {
            return EmotionState.next;
          }
        } else {
          return EmotionState.verbsNotEnd;
        }
      }
    }
    return EmotionState.next;
  }

  @override
  VerbState canNextVerbTap() {
    final work = getCurrentWork();
    final emotion = (work != null && work.emotions.isNotEmpty)
        ? work.emotions[work.currentEmotionIndex]
        : null;
    if (emotion != null) {
      if (emotion.verbIds.isEmpty) {
        return VerbState.generateList;
      } else {
        //get next verb
        if (emotion.verbIds.isNotEmpty &&
            emotion.verbIds.length >= emotion.currentVerbIndex) {
          if (emotion.currentVerbIndex == emotion.verbIds.length - 1) {
            return VerbState.end;
          } else {
            return VerbState.next;
          }
        }
      }
    }
    return VerbState.next;
  }

  @override
  String getRestVerbCount() {
    final work = getCurrentWork();
    final emotion = (work != null && work.emotions.isNotEmpty)
        ? work.emotions[work.currentEmotionIndex]
        : null;

    if (emotion != null && emotion.verbIds.isNotEmpty) {
      final cnt = emotion.verbIds.length - emotion.currentVerbIndex;
      return cnt > 0 ? cnt.toString() : '?';
    } else {
      return '?';
    }
  }

  @override
  bool canPrevVerbTap() {
    final work = cnst.AppData.workMethods!.getCurrentWork();
    final emotion = (work != null && work.emotions.isNotEmpty)
        ? work.emotions[work.currentEmotionIndex]
        : null;
    return emotion != null && emotion.currentVerbIndex > 0;
  }

  @override
  List<Widget> getVerbTitle(BuildContext context) {
    final work = cnst.AppData.workMethods!.getCurrentWork();
    final emotion = (work != null && work.emotions.isNotEmpty)
        ? work.emotions[work.currentEmotionIndex]
        : null;
    if (emotion != null) {
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
    } else {
      return [];
    }
  }

  @override
  String getVerbBackground() {
    final work = cnst.AppData.workMethods!.getCurrentWork();
    final emotion = (work != null && work.emotions.isNotEmpty)
        ? work.emotions[work.currentEmotionIndex]
        : null;
    return emotion == null || emotion.verbIds.isEmpty
        ? cnst.AssetPaths.verbsFront
        : cnst.AssetPaths.verbsBack;
  }

  @override
  bool canAddWork() {
    final work = cnst.AppData.workMethods!.getCurrentWork();
    if (work == null) return false;
    return true;
  }

  @override
  String getWorkAddText() {
    var textList = "";
    if ((cnst.AppData.appUser?.works.length ?? 0) == 3) {
      textList = "Самая старая несохраненная работа будет удалена!";
    }
    return textList;
  }

  @override
  WorkState getCurrentWorkState() {
    final work = cnst.AppData.workMethods!.getCurrentWork();
    if (work == null || work.intention.isEmpty) {
      return WorkState.notStarted;
    } else {
      return (cnst.AppData.appUser?.works.length ?? 0) < 3
          ? WorkState.inProgressExistplace
          : WorkState.inProgressFullList;
    }
  }

  @override
  Widget getWorkSelectDialog(
      BuildContext dialogContext, int index, Function() endFunc) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: YesNoDialog(
            height: 210.0.a,
            title:
                'Вы хотите вернуться к работе "${AppData.appUser!.works[index].intention}"?',
            yesFunction: () {
              returnToWork(index);
              endFunc();
            },
          ),
        )
      ],
    );
  }

  @override
  void returnToWork(int index) {
    cnst.AppData.appUser =
        cnst.AppData.appUser!.copyWith(currentWorkIndex: index);
    final appData = json.encode(cnst.AppData.appUser!.toJson());
    print(appData);
    storage.write(key: 'app_data', value: appData);
  }
}
