import 'package:flutter/material.dart';
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
                      '1)  ${AppData.workMethods!.getCurrentEmotionText()}',
                      style: AppTextStyles.bold16,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 50.0.a),
                      child: Text('''я тебя вижу,
я тебя слышу,
я тебя чувствую.''', style: AppTextStyles.normal16),
                    ),
                    Text('Ты мне необходима для того, чтобы ',
                        style: AppTextStyles.normal16),
                    SizedBox(
                      width: MediaQuery.of(context).size.width - 50.0.a,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          if (AppData.workMethods!.canPrevVerbTap())
                            InkWell(
                              onTap: () {
                                prevVerb();
                              },
                              child: Icon(
                                Icons.arrow_left,
                                size: 40.0.a,
                              ),
                            ),
                          AppData.workMethods!.getCurrentVerbTitleWidget(),
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
                      child: Text('... прислушайтесь к себе и',
                          style: AppTextStyles.normal16),
                    ),
                    Text('осознайте для чего эта эмоция',
                        style: AppTextStyles.normal16),
                    Padding(
                      padding: EdgeInsets.only(left: 50.0.a),
                      child: Text('нужна именно вам.',
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
                            Text('Заходите еще глубже',
                                style: AppTextStyles.normal16),
                            Text('с помощью вопросов',
                                style: AppTextStyles.normal16),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('ДЛЯ ЧЕГО?', style: AppTextStyles.bold16),
                                Text(' и ', style: AppTextStyles.normal16),
                                Text('ДАЖЕ ЕСЛИ...',
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
                          Text('''Спасибо тебе, эмоция,
за этот опыт, и спасибо
всем людям, которые
научили меня тебя
чувствовать!''', style: AppTextStyles.normal16),
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
                        Text('''Я принимаю тебя и даю тебе
место в своем теле.''', style: AppTextStyles.normal16),
                      ],
                    ),
                    SizedBox(
                      height: 20.0.a,
                    ),
                    Center(
                        child: Button(
                            label: "Следующий глагол",
                            onTap: () {
                              nextVerb();
                            })),
                    SizedBox(
                      height: 10.0.a,
                    ),
                    if (AppData.workMethods!.canPrevVerbTap())
                      Center(
                          child: Button(
                              label: "Предыдущий глагол",
                              onTap: () {
                                prevVerb();
                              }))
                  ]),
            ),
          ),
        ));
  }

  void prevVerb() {
    AppData.workMethods!.prevVerbSet();
    setState(() {});
  }

  void nextVerb() {
    final verbState = AppData.workMethods!.canNextVerbTap();
    switch (verbState) {
      case VerbState.generateList:
        AppData.workMethods!.generateVerbsList();
        setState(() {});
        break;
      case VerbState.end:
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
        ).then((value) {
          while (GoRouter.of(context).location != "/") {
            GoRouter.of(context).pop(true);
          }
        });
        break;
      default:
        AppData.workMethods!.nextVerbSet();
        setState(() {});
    }
  }
}
