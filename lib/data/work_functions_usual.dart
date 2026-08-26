import 'dart:convert';
import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:metacards/l10n/app_localizations.dart';
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
    return (cnst.AppInitializer.appData.appUser?.works.isEmpty ?? true)
        ? null
        : cnst.AppInitializer.appData.appUser?.works[cnst
                  .AppInitializer
                  .appData
                  .appUser
                  ?.currentWorkIndex ??
              0];
  }

  @override
  void addWork(WorkInProgress work) {
    final works = <WorkInProgress>[];
    if (cnst.AppInitializer.appData.appUser?.works.isNotEmpty ?? false) {
      works.addAll(cnst.AppInitializer.appData.appUser!.works);
    }
    if (works.length >= 3) {
      works.removeAt(0);
    }
    works.add(work);
    cnst.AppInitializer.appData.appUser = cnst.AppInitializer.appData.appUser!
        .copyWith(currentWorkIndex: works.length - 1, works: works);
    final appData = json.encode(cnst.AppInitializer.appData.appUser!.toJson());
    if (kDebugMode) print(appData);
    storage.write(key: 'app_data', value: appData);
    cnst.AppInitializer.appData.updateController.add(true);
  }

  @override
  void startWorkAgain(int index) {
    cnst.AppInitializer.appData.appUser = cnst.AppInitializer.appData.appUser!
        .copyWith(currentWorkIndex: index);
    final appData = json.encode(cnst.AppInitializer.appData.appUser!.toJson());
    if (kDebugMode) print(appData);
    storage.write(key: 'app_data', value: appData);
    cnst.AppInitializer.appData.updateController.add(true);
  }

  @override
  void deleteWork(int workIndex) {
    final works = <WorkInProgress>[];
    works.addAll(cnst.AppInitializer.appData.appUser!.works);
    works.removeAt(workIndex);

    cnst.AppInitializer.appData.appUser = cnst.AppInitializer.appData.appUser!
        .copyWith(currentWorkIndex: 0, works: works);
    final appData = json.encode(cnst.AppInitializer.appData.appUser!.toJson());
    if (kDebugMode) print(appData);
    storage.write(key: 'app_data', value: appData);
    cnst.AppInitializer.appData.updateController.add(true);
  }

  @override
  void generateEmotionsList() {
    var rnd = Random();
    final emotionsCount = rnd.nextInt(20);
    final emotions = <EmotionInProgress>[];
    for (var i = 0; i < emotionsCount; i++) {
      var id = -1;
      id = cnst
          .AppInitializer
          .appData
          .metacards!
          .emotions[Random().nextInt(
            cnst.AppInitializer.appData.metacards!.emotions.length,
          )]
          .id;
      emotions.add(EmotionInProgress(emotionId: id));
    }
    final works = <WorkInProgress>[];
    works.addAll(cnst.AppInitializer.appData.appUser!.works);
    works[cnst.AppInitializer.appData.appUser!.currentWorkIndex] =
        WorkInProgress(
          intention: cnst
              .AppInitializer
              .appData
              .appUser!
              .works[cnst.AppInitializer.appData.appUser!.currentWorkIndex]
              .intention,
          emotions: emotions,
        );
    cnst.AppInitializer.appData.appUser = cnst.AppInitializer.appData.appUser!
        .copyWith(works: works);
    final appData = json.encode(cnst.AppInitializer.appData.appUser!.toJson());
    if (kDebugMode) print(appData);
    storage.write(key: 'app_data', value: appData);
  }

  @override
  String getCurrentEmotionText() {
    String title = '';
    final work = getCurrentWork();
    if (work != null && work.emotions.isNotEmpty) {
      final emotion = getEmotionById(
        work.emotions[work.currentEmotionIndex].emotionId,
      );
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
        final verb = cnst.AppInitializer.appData.workMethods!.getVerbById(
          emotion.verbIds[emotion.currentVerbIndex],
        );
        if (verb != null) {
          for (int i = 0; i < verb.lines.length; i++) {
            titleList.add(
              Text(
                verb.lines[i].title.toUpperCase(),
                style: AppTextStyles.bold18,
              ),
            );
          }
        }
      }
    }
    if (titleList.isEmpty) {
      titleList.add(Text('???', style: AppTextStyles.bold18));
    }
    return Column(children: titleList);
  }

  @override
  void nextEmotionSet() {
    if (cnst.AppInitializer.appData.appUser?.works.isNotEmpty ?? false) {
      final work = cnst
          .AppInitializer
          .appData
          .appUser
          ?.works[cnst.AppInitializer.appData.appUser?.currentWorkIndex ?? 0];
      if (work != null &&
          work.currentEmotionIndex < work.emotions.length - 1 &&
          work.emotions[work.currentEmotionIndex].currentVerbIndex ==
              work.emotions[work.currentEmotionIndex].verbIds.length - 1 &&
          work.emotions[work.currentEmotionIndex].verbIds.isNotEmpty) {
        final works = <WorkInProgress>[];
        works.addAll(cnst.AppInitializer.appData.appUser!.works);
        works[cnst.AppInitializer.appData.appUser!.currentWorkIndex] =
            WorkInProgress(
              intention: cnst
                  .AppInitializer
                  .appData
                  .appUser!
                  .works[cnst.AppInitializer.appData.appUser!.currentWorkIndex]
                  .intention,
              emotions: cnst
                  .AppInitializer
                  .appData
                  .appUser!
                  .works[cnst.AppInitializer.appData.appUser!.currentWorkIndex]
                  .emotions,
              currentEmotionIndex: work.currentEmotionIndex + 1,
            );
        cnst.AppInitializer.appData.appUser = cnst
            .AppInitializer
            .appData
            .appUser!
            .copyWith(works: works);
        final appData = json.encode(
          cnst.AppInitializer.appData.appUser!.toJson(),
        );
        if (kDebugMode) print(appData);
        storage.write(key: 'app_data', value: appData);
      }
    }
  }

  @override
  void generateVerbsList() {
    final work = cnst
        .AppInitializer
        .appData
        .appUser
        ?.works[cnst.AppInitializer.appData.appUser?.currentWorkIndex ?? 0];
    if (work != null && work.emotions.isNotEmpty) {
      final emotion = work.emotions[work.currentEmotionIndex];
      var rnd = Random();
      final verbsCount = rnd.nextInt(20);
      final verbsIds = <int>[];
      for (var i = 0; i < verbsCount; i++) {
        var id = -1;
        id = cnst
            .AppInitializer
            .appData
            .metacards!
            .verbs[Random().nextInt(
              cnst.AppInitializer.appData.metacards!.verbs.length,
            )]
            .id;
        verbsIds.add(id);
      }

      EmotionInProgress emotionWithVerbs = EmotionInProgress(
        emotionId: emotion.emotionId,
        verbIds: verbsIds,
        currentVerbIndex: 0,
      );

      List<EmotionInProgress> emotions = [];
      emotions.addAll(work.emotions);
      emotions[cnst
              .AppInitializer
              .appData
              .appUser!
              .works[cnst.AppInitializer.appData.appUser!.currentWorkIndex]
              .currentEmotionIndex] =
          emotionWithVerbs;
      final works = <WorkInProgress>[];
      works.addAll(cnst.AppInitializer.appData.appUser!.works);
      works[cnst.AppInitializer.appData.appUser!.currentWorkIndex] =
          WorkInProgress(
            intention: cnst
                .AppInitializer
                .appData
                .appUser!
                .works[cnst.AppInitializer.appData.appUser!.currentWorkIndex]
                .intention,
            emotions: emotions,
            currentEmotionIndex: cnst
                .AppInitializer
                .appData
                .appUser!
                .works[cnst.AppInitializer.appData.appUser!.currentWorkIndex]
                .currentEmotionIndex,
          );
      cnst.AppInitializer.appData.appUser = cnst.AppInitializer.appData.appUser!
          .copyWith(works: works);
      final appData = json.encode(
        cnst.AppInitializer.appData.appUser!.toJson(),
      );
      if (kDebugMode) print(appData);
      storage.write(key: 'app_data', value: appData);
    }
  }

  @override
  void nextVerbSet() {
    if (cnst.AppInitializer.appData.appUser != null &&
        cnst.AppInitializer.appData.appUser!.works.isNotEmpty) {
      final work = cnst
          .AppInitializer
          .appData
          .appUser
          ?.works[cnst.AppInitializer.appData.appUser?.currentWorkIndex ?? 0];
      if (work != null && work.emotions.isNotEmpty) {
        final emotion = work.emotions[work.currentEmotionIndex];

        EmotionInProgress emotionWithVerbs = EmotionInProgress(
          emotionId: emotion.emotionId,
          verbIds: emotion.verbIds,
          currentVerbIndex: emotion.currentVerbIndex + 1,
        );

        List<EmotionInProgress> emotions = [];
        emotions.addAll(work.emotions);
        emotions[cnst
                .AppInitializer
                .appData
                .appUser!
                .works[cnst.AppInitializer.appData.appUser!.currentWorkIndex]
                .currentEmotionIndex] =
            emotionWithVerbs;
        final works = <WorkInProgress>[];
        works.addAll(cnst.AppInitializer.appData.appUser!.works);
        works[cnst.AppInitializer.appData.appUser!.currentWorkIndex] =
            WorkInProgress(
              intention: cnst
                  .AppInitializer
                  .appData
                  .appUser!
                  .works[cnst.AppInitializer.appData.appUser!.currentWorkIndex]
                  .intention,
              emotions: emotions,
              currentEmotionIndex: cnst
                  .AppInitializer
                  .appData
                  .appUser!
                  .works[cnst.AppInitializer.appData.appUser!.currentWorkIndex]
                  .currentEmotionIndex,
            );
        cnst.AppInitializer.appData.appUser = cnst
            .AppInitializer
            .appData
            .appUser!
            .copyWith(works: works);
        final appData = json.encode(
          cnst.AppInitializer.appData.appUser!.toJson(),
        );
        if (kDebugMode) print(appData);
        storage.write(key: 'app_data', value: appData);
      }
    }
  }

  @override
  void prevVerbSet() {
    final work = cnst
        .AppInitializer
        .appData
        .appUser
        ?.works[cnst.AppInitializer.appData.appUser?.currentWorkIndex ?? 0];
    if (work != null && work.emotions.isNotEmpty) {
      final emotion = work.emotions[work.currentEmotionIndex];
      if (emotion.currentVerbIndex > 0) {
        EmotionInProgress emotionWithVerbs = EmotionInProgress(
          emotionId: emotion.emotionId,
          verbIds: emotion.verbIds,
          currentVerbIndex: emotion.currentVerbIndex - 1,
        );

        List<EmotionInProgress> emotions = [];
        emotions.addAll(work.emotions);
        emotions[work.currentEmotionIndex] = emotionWithVerbs;
        final works = <WorkInProgress>[];
        works.addAll(cnst.AppInitializer.appData.appUser!.works);
        works[cnst.AppInitializer.appData.appUser!.currentWorkIndex] =
            WorkInProgress(
              intention: cnst
                  .AppInitializer
                  .appData
                  .appUser!
                  .works[cnst.AppInitializer.appData.appUser!.currentWorkIndex]
                  .intention,
              emotions: emotions,
              currentEmotionIndex: cnst
                  .AppInitializer
                  .appData
                  .appUser!
                  .works[cnst.AppInitializer.appData.appUser!.currentWorkIndex]
                  .currentEmotionIndex,
            );
        cnst.AppInitializer.appData.appUser = cnst
            .AppInitializer
            .appData
            .appUser!
            .copyWith(works: works);
        final appData = json.encode(
          cnst.AppInitializer.appData.appUser!.toJson(),
        );
        if (kDebugMode) print(appData);
        storage.write(key: 'app_data', value: appData);
      }
    }
  }

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
            title: AppLocalizations.of(dialogContext)!.workConfirmDeleteWork(
              cnst.AppInitializer.appData.appUser!.works[index].intention,
            ),
            yesFunction: () {
              deleteWork(index);
              endFunc();
            },
          ),
        ),
      ],
    );
  }

  @override
  Emotion? getCurrentEmotion() {
    final work = cnst.AppInitializer.appData.workMethods!.getCurrentWork();
    return (work != null && work.emotions.isNotEmpty)
        ? cnst.AppInitializer.appData.workMethods!.getEmotionById(
            work.emotions[work.currentEmotionIndex].emotionId,
          )
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
    return (cnst.AppInitializer.appData.appUser?.works.isNotEmpty ?? false);
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
    final work = cnst.AppInitializer.appData.workMethods!.getCurrentWork();
    final emotion = (work != null && work.emotions.isNotEmpty)
        ? work.emotions[work.currentEmotionIndex]
        : null;
    return emotion != null && emotion.currentVerbIndex > 0;
  }

  @override
  List<Widget> getVerbTitle(BuildContext context) {
    final work = cnst.AppInitializer.appData.workMethods!.getCurrentWork();
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
      }
      return children;
    } else {
      return [];
    }
  }

  @override
  String getVerbBackground() {
    final work = cnst.AppInitializer.appData.workMethods!.getCurrentWork();
    final emotion = (work != null && work.emotions.isNotEmpty)
        ? work.emotions[work.currentEmotionIndex]
        : null;
    return emotion == null || emotion.verbIds.isEmpty
        ? cnst.AssetPaths.verbsFront
        : cnst.AssetPaths.verbsBack;
  }

  @override
  bool canAddWork() {
    final work = cnst.AppInitializer.appData.workMethods!.getCurrentWork();
    if (work == null) return false;
    return true;
  }

  @override
  bool willDeleteOldestWork() {
    return (cnst.AppInitializer.appData.appUser?.works.length ?? 0) == 3;
  }

  @override
  Widget getWorkSelectDialog(
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
            title: AppLocalizations.of(dialogContext)!.workConfirmResumeWork(
              cnst.AppInitializer.appData.appUser!.works[index].intention,
            ),
            yesFunction: () {
              returnToWork(index);
              GoRouter.of(dialogContext).go('/');
            },
          ),
        ),
      ],
    );
  }

  @override
  void returnToWork(int index) {
    cnst.AppInitializer.appData.appUser = cnst.AppInitializer.appData.appUser!
        .copyWith(currentWorkIndex: index);
    final appData = json.encode(cnst.AppInitializer.appData.appUser!.toJson());
    if (kDebugMode) print(appData);
    storage.write(key: 'app_data', value: appData);
    cnst.AppInitializer.appData.updateController.add(true);
  }

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
