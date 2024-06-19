import 'package:flutter/material.dart';
import 'package:metacards/data/constants.dart';
import 'package:metacards/data/models/emotion.dart';
import 'package:metacards/data/models/verb.dart';
import 'package:metacards/data/models/work_in_progress.dart';
import 'package:metacards/data/constants.dart' as cnst;
import 'package:metacards/general/const/app_text_styles.dart';
import 'package:metacards/general/utils/screen_adapt.dart';

abstract class IWorkMethods {
  WorkInProgress? getCurrentWork();

  Emotion? getCurrentEmotion();

  EmotionState canNextEmotionTap();

  String getRestEmotionsCount();

  void addWork(WorkInProgress work);

  void startWorkAgain(int index);

  void deleteWork(int workIndex);

  void generateEmotionsList();

  Emotion? getEmotionById(int emotionId) {
    if (cnst.AppData.metacards?.emotions.isNotEmpty ?? false) {
      for (int i = 0; i < cnst.AppData.metacards!.emotions.length; i++) {
        if (cnst.AppData.metacards!.emotions[i].id == emotionId) {
          return cnst.AppData.metacards!.emotions[i];
        }
      }
    }
    return null;
  }

  String getCurrentEmotionText();

  Widget getCurrentVerbTitleWidget();

  List<Widget> getEmotionTitle(Emotion emotion, BuildContext context) {
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

  void nextEmotionSet();

  VerbState canNextVerbTap();

  bool canPrevVerbTap();

  void generateVerbsList();

  String getRestVerbCount();

  List<Widget> getVerbTitle(BuildContext context);

  Verb? getVerbById(int id) {
    if (cnst.AppData.metacards?.verbs.isNotEmpty ?? false) {
      for (int i = 0; i < cnst.AppData.metacards!.verbs.length; i++) {
        if (cnst.AppData.metacards!.verbs[i].id == id) {
          return cnst.AppData.metacards!.verbs[i];
        }
      }
    }
    return null;
  }

  void nextVerbSet();

  void prevVerbSet();

  Widget getWorkDeleteDialog(
      BuildContext dialogContext, String text, Function() endFunc);

  bool canDeleteWork();

  String getVerbBackground();
}
