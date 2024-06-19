import 'package:flutter/material.dart';
import 'package:metacards/data/constants.dart' as cnst;
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

    return Stack(children: [
      SizedBox.expand(
        child: GestureDetector(
          onHorizontalDragEnd: (details) {
            if (details.velocity.pixelsPerSecond.dx < 1) {
              // Right Swipe
              nextVerb();
            } else {
              //Left Swipe
              cnst.AppData.workMethods!.prevVerbSet();
              if (widget.onUpdate != null) {
                widget.onUpdate!();
              }
            }
          },
          onTap: () {
            nextVerb();
          },
          child: Image.asset(
            cnst.AppData.workMethods!.getVerbBackground(),
            fit: BoxFit.fill,
            width: MediaQuery.of(context).size.width,
            height: height,
          ),
        ),
      ),
      Positioned.fill(
        bottom: 40.0.a,
        right: 10.0.a,
        left: 10.0.a,
        child: Align(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: cnst.AppData.workMethods!.getVerbTitle(context),
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
                          cnst.AppData.workMethods!.getRestVerbCount(),
                          style: AppTextStyles.medium42,
                        ))),
              ],
            ),
          )),
      if (cnst.AppData.workMethods!.canPrevVerbTap())
        Positioned(
            bottom: 2.0.a,
            left: 2.0.a,
            child: InkWell(
              onTap: () {
                cnst.AppData.workMethods!.prevVerbSet();
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
    final verbState = cnst.AppData.workMethods!.canNextVerbTap();
    switch (verbState) {
      case cnst.VerbState.generateList:
        cnst.AppData.workMethods!.generateVerbsList();
        if (widget.onUpdate != null) {
          widget.onUpdate!();
        }
        break;
      case cnst.VerbState.end:
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
        break;
      default:
        cnst.AppData.workMethods!.nextVerbSet();
        if (widget.onUpdate != null) {
          widget.onUpdate!();
        }
    }
  }
}
