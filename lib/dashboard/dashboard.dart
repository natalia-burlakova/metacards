import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:metacards/dashboard/widgets/emotion_card.dart';
import 'package:metacards/dashboard/widgets/verb_card.dart';
import 'package:metacards/general/const/app_colors.dart';

import 'package:metacards/data/constants.dart' as cnst;
import 'package:metacards/general/const/app_text_styles.dart';
import 'package:metacards/general/ui/page_general.dart';
import 'package:metacards/general/utils/screen_adapt.dart';
import 'package:metacards/l10n/app_localizations.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  StreamSubscription<bool>? _updateSubscription;

  @override
  void initState() {
    super.initState();
    if (cnst.AppInitializer.appData.appUser == null) {
      cnst.AppInitializer.appData
          .initialize(context)
          .then((value) => setState(() {}));
    }

    // Listen to transcript stream
    _updateSubscription = cnst.AppInitializer.appData.updateStream.listen(
      (transcript) {
        if (mounted) {
          setState(() {});
        }
      },
      onError: (error) {},
    );
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
                          AppLocalizations.of(context)!.workTemplateTitle,
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
