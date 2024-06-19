import 'package:flutter/material.dart';
import 'package:metacards/data/constants.dart';
import 'package:metacards/data/models/work_in_progress.dart';
import 'package:metacards/general/const/app_colors.dart';

import 'package:metacards/general/ui/button.dart';
import 'package:metacards/general/ui/page_general.dart';
import 'package:metacards/general/ui/text_form_item.dart';
import 'package:go_router/go_router.dart';
import 'package:metacards/general/utils/screen_adapt.dart';

class IntentionAdd extends StatefulWidget {
  const IntentionAdd({super.key});

  @override
  State<IntentionAdd> createState() => _IntentionAddState();
}

class _IntentionAddState extends State<IntentionAdd> {
  final TextEditingController _intentionController = TextEditingController();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PageGeneral(
      title: 'Намерение',
      canBack: true,
      body: Padding(
        padding: EdgeInsets.all(5.0.a),
        child: Container(
          color: AppColor.buttonColor,
          child: Column(
            children: [
              Container(
                constraints: const BoxConstraints(maxHeight: 100),
                child: SingleChildScrollView(
                  child: TextFormItem(
                    padding: EdgeInsets.all(15.0.a),
                    controller: _intentionController,
                    maxLength: 500,
                    maxLines: null,
                    keyboardType: TextInputType.multiline,
                  ),
                ),
              ),
              Button(
                  label: "Начать работу",
                  onTap: () {
                    AppData.workMethods!.addWork(
                        WorkInProgress(intention: _intentionController.text));
                    while (GoRouter.of(context).location != "/") {
                      GoRouter.of(context).pop(true);
                    }
                  })
            ],
          ),
        ),
      ),
    );
  }
}
