import 'package:flutter/material.dart';
import 'package:metacards/data/models/emotion_in_progress.dart';
import 'package:metacards/data/work_functions.dart';
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
    final work = (cnst.AppData.appUser?.works.isEmpty ?? true)
        ? null
        : cnst.AppData.appUser
            ?.works[cnst.AppData.appUser?.currentWorkIndex ?? 0];
    final emotion = (work != null && work.emotions.isNotEmpty)
        ? WorkMethods.getEmotionById(
            work.emotions[work.currentEmotionIndex].emotionId)
        : null;
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
                children: WorkMethods.getEmotionTitle(emotion, context),
              ),
            ),
          ),
        Positioned(
            bottom: 2.0.a,
            right: 2.0.a,
            child: InkWell(
              onTap: () {
                if (work != null && work.emotions.isNotEmpty) {
                  nextEmotion();
                }
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
                    (work == null || work.emotions.isEmpty)
                        ? '?'
                        : (work.emotions.length - work.currentEmotionIndex)
                            .toString(),
                    style: AppTextStyles.medium42,
                  ))),
                ],
              ),
            )),
      ],
    );
  }

  void nextEmotion() {
    final work = (cnst.AppData.appUser?.works.isEmpty ?? true)
        ? null
        : cnst.AppData.appUser
            ?.works[cnst.AppData.appUser?.currentWorkIndex ?? 0];
    if ((work?.intention ?? '').isNotEmpty && (work?.emotions.isEmpty ?? true)) {
      WorkMethods.generateEmotionsList();
      if (widget.onUpdate != null) {
        widget.onUpdate!();
      }
    } else {
      final emotion = work?.emotions[work.currentEmotionIndex];
      //если нет намерения - предупреждение что надо заполнить
      if ((work?.intention ?? '').isEmpty) {
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
      } else if (work != null && work.emotions.isNotEmpty) {
        if (emotion != null &&
            emotion.currentVerbIndex == emotion.verbIds.length - 1 &&
            emotion.verbIds.isNotEmpty) {
          if (work.currentEmotionIndex == work.emotions.length - 1) {
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
                          WorkMethods.startWorkAgain(
                              cnst.AppData.appUser!.currentWorkIndex);
                          if (widget.onUpdate != null) {
                            widget.onUpdate!();
                          }
                        },
                        noButtonText: 'ЗАВЕРШИТЬ',
                        noButtonStyle: AppTextStyles.medium18,
                        noFunction: () {
                          Navigator.pop(dialogContext);
                          WorkMethods.deleteWork(
                              cnst.AppData.appUser!.currentWorkIndex);

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
          } else {
            WorkMethods.nextEmotionSet();
            if (widget.onUpdate != null) {
              widget.onUpdate!();
            }
          }
        } else {
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
        }
      }
    }
  }
}
