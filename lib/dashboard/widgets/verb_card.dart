import 'package:flutter/material.dart';
import 'package:metacards/data/constants.dart' as cnst;
import 'package:metacards/data/work_functions.dart';
import 'package:metacards/general/const/app_text_styles.dart';
import 'package:metacards/general/ui/message_dialog.dart';
import 'package:metacards/general/utils/screen_adapt.dart';

class VerbCard extends StatefulWidget {
  final Function? onUpdate;
  const VerbCard({
    super.key,
    this.onUpdate,
  });

  @override
  State<VerbCard> createState() => _VerbCardState();
}

class _VerbCardState extends State<VerbCard> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height * 0.40;
    final work = (cnst.AppData.appUser?.works.isEmpty ?? true)
        ? null
        : cnst.AppData.appUser
            ?.works[cnst.AppData.appUser?.currentWorkIndex ?? 0];
    final emotion = (work != null && work.emotions.isNotEmpty)
        ? work.emotions[work.currentEmotionIndex]
        : null;

    return Stack(children: [
      SizedBox.expand(
        child: GestureDetector(
          onHorizontalDragEnd: (details) {
            if (details.velocity.pixelsPerSecond.dx < 1) {
              // Right Swipe
              nextVerb();
            } else {
              //Left Swipe
              WorkMethods.prevVerbSet();
              if (widget.onUpdate != null) {
                widget.onUpdate!();
              }
            }
          },
          onTap: () {
            nextVerb();
          },
          child: Image.asset(
            emotion == null || emotion.verbIds.isEmpty
                ? cnst.AssetPaths.verbsFront
                : cnst.AssetPaths.verbsBack,
            fit: BoxFit.fill,
            width: MediaQuery.of(context).size.width,
            height: height,
          ),
        ),
      ),
      if (emotion != null)
        Positioned.fill(
          bottom: 40.0.a,
          right: 10.0.a,
          left: 10.0.a,
          child: Align(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: WorkMethods.getVerbTitle(emotion, context),
            ),
          ),
        ),
      Positioned(
          bottom: 2.0.a,
          right: 2.0.a,
          child: InkWell(
            onTap: () {
              nextVerb();
            },
            child: Stack(
              children: [
                Image.asset(
                  cnst.AssetPaths.generatorArrow,
                  height: 60.0.a,
                ),
                Positioned.fill(
                    child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          (emotion == null || emotion.verbIds.isEmpty)
                              ? '?'
                              : (emotion.verbIds.length -
                                      emotion.currentVerbIndex)
                                  .toString(),
                          style: AppTextStyles.medium42,
                        ))),
              ],
            ),
          )),
      if (emotion != null && emotion.currentVerbIndex > 0)
        Positioned(
            bottom: 2.0.a,
            left: 2.0.a,
            child: InkWell(
              onTap: () {
                WorkMethods.prevVerbSet();
                if (widget.onUpdate != null) {
                  widget.onUpdate!();
                }
              },
              child: Image.asset(
                cnst.AssetPaths.backArrow,
                height: 60.0.a,
              ),
            )),
    ]);
  }

  void nextVerb() {
    final work = (cnst.AppData.appUser?.works.isEmpty ?? true)
        ? null
        : cnst.AppData.appUser
            ?.works[cnst.AppData.appUser?.currentWorkIndex ?? 0];
    final emotion = (work != null && work.emotions.isNotEmpty)
        ? work.emotions[work.currentEmotionIndex]
        : null;
    if (emotion != null) {
      if (emotion.verbIds.isEmpty) {
        WorkMethods.generateVerbsList();
        if (widget.onUpdate != null) {
          widget.onUpdate!();
        }
      } else {
        //get next verb
        if (emotion.verbIds.isNotEmpty &&
            emotion.verbIds.length >= emotion.currentVerbIndex) {
          if (emotion.currentVerbIndex == emotion.verbIds.length - 1) {
            //show dialog and select next emotion
            showDialog(
              context: context,
              builder: (_) {
                return MessageDialog(
                  height: 250,
                  message:
                      'Вы проработали все глаголы для этой эмоции! Переходите к следующей.',
                  child: Column(
                    children: [
                      const Icon(
                        Icons.thumb_up,
                        size: 50,
                      ),
                      Text(
                        'Поздравляем!',
                        style: AppTextStyles.bold18,
                      )
                    ],
                  ),
                );
              },
            );
          } else {
            WorkMethods.nextVerbSet();
            if (widget.onUpdate != null) {
              widget.onUpdate!();
            }
          }
        }
      }
    }
  }
}
