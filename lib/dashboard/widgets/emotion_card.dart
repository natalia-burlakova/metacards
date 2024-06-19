import 'package:flutter/material.dart';
import 'package:metacards/data/models/emotion_in_progress.dart';
import 'package:metacards/general/const/app_text_styles.dart';
import 'package:metacards/data/constants.dart' as cnst;
import 'package:metacards/general/ui/message_dialog.dart';
import 'package:metacards/general/ui/yesno_dialog.dart';
import 'package:metacards/general/utils/screen_adapt.dart';

class EmotionCard extends StatefulWidget {
  final EmotionInProgress? emotion;
  final Function? onUpdate;
  const EmotionCard({
    super.key,
    this.emotion,
    this.onUpdate,
  });

  @override
  State<EmotionCard> createState() => _EmotionCardState();
}

class _EmotionCardState extends State<EmotionCard> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height * 0.40;
    final emotion = cnst.AppData.workMethods!.getCurrentEmotion();
    return Stack(
      children: [
        GestureDetector(
          onHorizontalDragEnd: (details) {
            if (details.velocity.pixelsPerSecond.dx < 1) {
              // Right Swipe
              nextEmotion();
            }
          },
          onTap: () {
            nextEmotion();
          },
          child: Image.asset(
            emotion == null
                ? cnst.AssetPaths.emotionsFront
                : cnst.AssetPaths.emotionsBack,
            fit: BoxFit.fill,
            width: MediaQuery.of(context).size.width,
            height: height,
          ),
        ),
        if (emotion != null)
          Positioned.fill(
            child: Align(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children:
                    cnst.AppData.workMethods!.getEmotionTitle(emotion, context),
              ),
            ),
          ),
        Positioned(
            bottom: 2.0.a,
            right: 2.0.a,
            child: InkWell(
              onTap: () {
                nextEmotion();
              },
              child: Stack(
                children: [
                  Image.asset(
                    cnst.AssetPaths.generatorArrow,
                    height: 60.0.a,
                  ),
                  Positioned.fill(
                      child: Center(
                          child: Text(
                    cnst.AppData.workMethods!.getRestEmotionsCount(),
                    style: AppTextStyles.medium42,
                  ))),
                ],
              ),
            )),
      ],
    );
  }

  void nextEmotion() {
    final emotionState = cnst.AppData.workMethods!.canNextEmotionTap();
    switch (emotionState) {
      case cnst.EmotionState.intensionAbsent:
        showDialog(
          context: context,
          builder: (_) {
            return const MessageDialog(
              message: 'Сначала заполните намерение.',
              height: 150.0,
              child: Icon(
                Icons.report_problem_outlined,
                size: 40,
              ),
            );
          },
        );
        break;
      case cnst.EmotionState.generateList:
        cnst.AppData.workMethods!.generateEmotionsList();
        if (widget.onUpdate != null) {
          widget.onUpdate!();
        }
        break;
      case cnst.EmotionState.end:
        showDialog(
          context: context,
          builder: (dialogContext) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: YesNoDialog(
                    height: 260.0,
                    title:
                        'Поднимаются ли еще негативные эмоции на эту ситуацию? Если да, нажмите кнопку ДОРАБОТАТЬ , если нет, то нажмите кнопку ЗАВЕРШИТЬ.',
                    yesButtonText: 'ДОРАБОТАТЬ',
                    yesButtonStyle: AppTextStyles.medium18,
                    yesFunction: () {
                      Navigator.pop(dialogContext);
                      cnst.AppData.workMethods!.startWorkAgain(
                          cnst.AppData.appUser!.currentWorkIndex);
                      if (widget.onUpdate != null) {
                        widget.onUpdate!();
                      }
                    },
                    noButtonText: 'ЗАВЕРШИТЬ',
                    noButtonStyle: AppTextStyles.medium18,
                    noFunction: () {
                      Navigator.pop(dialogContext);
                      cnst.AppData.workMethods!
                          .deleteWork(cnst.AppData.appUser!.currentWorkIndex);

                      showDialog(
                        context: context,
                        builder: (_) {
                          // ignore: prefer_const_constructors
                          return MessageDialog(
                              height: 270,
                              message:
                                  'Поздравляем с успешной трансформацией себя!',
                              child: Image.asset(
                                cnst.AssetPaths.celebrationGif,
                              ));
                        },
                      ).then((value) {
                        if (widget.onUpdate != null) {
                          widget.onUpdate!();
                        }
                      });
                    },
                  ),
                )
              ],
            );
          },
        );
        break;
      case cnst.EmotionState.verbsNotEnd:
        showDialog(
          context: context,
          builder: (_) {
            return const MessageDialog(
              message:
                  'Прежде чем перейти к следующей эмоции проработайте все глаголы этой.',
              height: 170.0,
              child: Icon(
                Icons.report_problem_outlined,
                size: 40,
              ),
            );
          },
        );
        break;
      default: //next emotion
        cnst.AppData.workMethods!.nextEmotionSet();
        if (widget.onUpdate != null) {
          widget.onUpdate!();
        }
    }
  }
}
