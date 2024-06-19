import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:metacards/dashboard/widgets/emotion_card.dart';
import 'package:metacards/dashboard/widgets/verb_card.dart';
import 'package:metacards/general/const/app_colors.dart';

import 'package:metacards/data/constants.dart' as cnst;
import 'package:metacards/general/const/app_text_styles.dart';
import 'package:metacards/general/ui/page_general.dart';
import 'package:metacards/general/utils/screen_adapt.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  void initState() {
    super.initState();
    if (cnst.AppData.appUser == null) {
      cnst.AppData.getStaticData(context).then((value) => setState(() {}));
    }
  }

  @override
  Widget build(BuildContext context) {
    return PageGeneral(
        pageKey: cnst.globalKey,
        onUpdate: () {
          setState(() {});
        },
        body: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Column(
            children: [
              Flexible(
                flex: 10,
                child: EmotionCard(
                  onUpdate: () {
                    setState(() {});
                  },
                ),
              ),
              InkWell(
                onTap: () {
                  context.push('/work_template');
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 5.0.a,
                  ),
                  child: Container(
                    color: AppColor.buttonColor,
                    height: 55.0.a,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'шаблон для работы',
                          style: AppTextStyles.normal21,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Flexible(
                flex: 10,
                child: VerbCard(
                  onUpdate: () {
                    setState(() {});
                  },
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).viewPadding.bottom,
              )
            ],
          ),
        ));
  }
}
