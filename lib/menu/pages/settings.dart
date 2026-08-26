import 'package:flutter/material.dart';
import 'package:metacards/data/constants.dart' as cnst;
import 'package:metacards/data/constants.dart';
import 'package:metacards/general/const/app_colors.dart';
import 'package:metacards/general/const/app_text_styles.dart';
import 'package:metacards/general/ui/page_general.dart';
import 'package:metacards/general/utils/screen_adapt.dart';
import 'package:metacards/l10n/app_localizations.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final currentCode = cnst.AppInitializer.localeNotifier.value.languageCode;
    final selectedCode = AppData.supportedDataLocales.contains(currentCode)
        ? currentCode
        : AppData.defaultLocale;

    return PageGeneral(
      canBack: true,
      title: l10n.menuSettings,
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 25.0.a, horizontal: 20.0.a),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(l10n.settingsLanguageLabel, style: AppTextStyles.normal16),
            SizedBox(height: 10.0.a),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15.0.a),
              decoration: BoxDecoration(
                color: AppColor.buttonColor,
                borderRadius: cnst.borderRadius15,
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  value: selectedCode,
                  isExpanded: true,
                  style: AppTextStyles.normal16,
                  items: AppData.supportedDataLocales
                      .map(
                        (code) => DropdownMenuItem<String>(
                          value: code,
                          child: Text(_languageLabel(l10n, code)),
                        ),
                      )
                      .toList(),
                  onChanged: (code) {
                    if (code == null || code == selectedCode) return;
                    cnst.AppInitializer.appData.setLocale(context, code);
                    setState(() {});
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _languageLabel(AppLocalizations l10n, String code) {
    switch (code) {
      case 'en':
        return l10n.settingsLanguageEnglish;
      case 'sr':
        return l10n.settingsLanguageSerbian;
      case 'ru':
      default:
        return l10n.settingsLanguageRussian;
    }
  }
}
