import 'package:flutter/material.dart';
import 'package:metacards/l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:metacards/data/constants.dart';
import 'package:metacards/general/const/app_text_styles.dart';
import 'package:metacards/general/ui/button.dart';
import 'package:metacards/general/ui/message_dialog.dart';
import 'package:metacards/general/ui/page_general.dart';
import 'package:metacards/general/utils/screen_adapt.dart';

class WorkTemplate extends StatefulWidget {
  const WorkTemplate({super.key});

  @override
  State<WorkTemplate> createState() => _WorkTemplateState();
}

class _WorkTemplateState extends State<WorkTemplate> {
  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return PageGeneral(
        canBack: true,
        body: Padding(
          padding: EdgeInsets.all(10.0.a),
          child: SingleChildScrollView(
            child: GestureDetector(
              onHorizontalDragEnd: (details) {
                if (details.velocity.pixelsPerSecond.dx < 1) {
                  // Right Swipe
                  nextVerb();
                } else {
                  //Left Swipe
                  prevVerb();
                }
              },
              onTap: () {
                nextVerb();
              },
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '1)  ${AppInitializer.appData.workMethods!.getCurrentEmotionText()}',
                      style: AppTextStyles.bold16,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 50.0.a),
                      child: Text(l10n.workTemplateRefrain,
                          style: AppTextStyles.normal16),
                    ),
                    Text(l10n.workTemplatePurpose,
                        style: AppTextStyles.normal16),
                    SizedBox(
                      width: MediaQuery.of(context).size.width - 50.0.a,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          if (AppInitializer.appData.workMethods!
                              .canPrevVerbTap())
                            InkWell(
                              onTap: () {
                                prevVerb();
                              },
                              child: Icon(
                                Icons.arrow_left,
                                size: 40.0.a,
                              ),
                            ),
                          AppInitializer.appData.workMethods!
                              .getCurrentVerbTitleWidget(),
                          InkWell(
                            onTap: () {
                              nextVerb();
                            },
                            child: Icon(
                              Icons.arrow_right,
                              size: 40.0.a,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 30.0.a),
                      child: Text(l10n.workTemplateListen,
                          style: AppTextStyles.normal16),
                    ),
                    Text(l10n.workTemplateRealize,
                        style: AppTextStyles.normal16),
                    Padding(
                      padding: EdgeInsets.only(left: 50.0.a),
                      child: Text(l10n.workTemplateNeedIt,
                          style: AppTextStyles.normal16),
                    ),
                    SizedBox(
                      height: 10.0.a,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 25.0.a,
                          child: Text('2) ', style: AppTextStyles.bold16),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(l10n.workTemplateStep2Intro1,
                                style: AppTextStyles.normal16),
                            Text(l10n.workTemplateStep2Intro2,
                                style: AppTextStyles.normal16),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(l10n.workTemplateQuestionWhy,
                                    style: AppTextStyles.bold16),
                                Text(l10n.workTemplateAnd,
                                    style: AppTextStyles.normal16),
                                Text(l10n.workTemplateQuestionEvenIf,
                                    style: AppTextStyles.bold16),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10.0.a,
                    ),
                    Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 25.0.a,
                            child: Text('3) ', style: AppTextStyles.bold16),
                          ),
                          Text(l10n.workTemplateThanks,
                              style: AppTextStyles.normal16),
                        ]),
                    SizedBox(
                      height: 10.0.a,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 25.0.a,
                          child: Text('4) ', style: AppTextStyles.bold16),
                        ),
                        Text(l10n.workTemplateAccept,
                            style: AppTextStyles.normal16),
                      ],
                    ),
                    SizedBox(
                      height: 20.0.a,
                    ),
                    Center(
                        child: Button(
                            label: l10n.workTemplateNextVerbButton,
                            onTap: () {
                              nextVerb();
                            })),
                    SizedBox(
                      height: 10.0.a,
                    ),
                    if (AppInitializer.appData.workMethods!.canPrevVerbTap())
                      Center(
                          child: Button(
                              label: l10n.workTemplatePrevVerbButton,
                              onTap: () {
                                prevVerb();
                              }))
                  ]),
            ),
          ),
        ));
  }

  void prevVerb() {
    AppInitializer.appData.workMethods!.prevVerbSet();
    setState(() {});
  }

  void nextVerb() {
    final l10n = AppLocalizations.of(context)!;
    final verbState = AppInitializer.appData.workMethods!.canNextVerbTap();
    switch (verbState) {
      case VerbState.generateList:
        AppInitializer.appData.workMethods!.generateVerbsList();
        setState(() {});
        break;
      case VerbState.end:
        //show dialog and select next emotion
        showDialog(
          context: context,
          builder: (_) {
            return MessageDialog(
              height: 250,
              message: l10n.workAllVerbsDoneMessage,
              child: Column(
                children: [
                  const Icon(
                    Icons.thumb_up,
                    size: 50,
                  ),
                  Text(
                    l10n.workCongratulations,
                    style: AppTextStyles.bold18,
                  )
                ],
              ),
            );
          },
        ).then((value) {
          while (GoRouterState.of(context).uri.path != "/") {
            GoRouter.of(context).pop(true);
          }
        });
        break;
      default:
        AppInitializer.appData.workMethods!.nextVerbSet();
        setState(() {});
    }
  }
}
