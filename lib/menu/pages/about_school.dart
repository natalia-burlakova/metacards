import 'package:flutter/material.dart';
import 'package:metacards/l10n/app_localizations.dart';
import 'package:metacards/general/const/app_text_styles.dart';
import 'package:metacards/general/ui/page_general.dart';
import 'package:metacards/general/utils/screen_adapt.dart';

class AboutSchool extends StatelessWidget {
  const AboutSchool({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return PageGeneral(
        canBack: true,
        title: l10n.menuAboutSchool,
        body: Padding(
            padding: EdgeInsets.symmetric(vertical: 25.0.a, horizontal: 20.0.a),
            child: SelectableText(
              l10n.aboutSchoolBody,
              style: AppTextStyles.normal16,
            )));
  }
}
