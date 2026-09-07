import 'package:flutter/material.dart';
import 'package:metacards/data/constants.dart' as cnst;
import 'package:metacards/general/const/app_colors.dart';
import 'package:metacards/general/utils/screen_adapt.dart';
import 'package:metacards/l10n/app_localizations.dart';

String languageFlag(String code) {
  switch (code) {
    case 'en':
      return '🇬🇧';
    case 'sr':
      return '🇷🇸';
    case 'ru':
    default:
      return '🇷🇺';
  }
}

String languageLabel(AppLocalizations l10n, String code) {
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

class LanguageFlagSelector extends StatelessWidget {
  final String selectedCode;
  final void Function(String code) onSelect;

  const LanguageFlagSelector({
    super.key,
    required this.selectedCode,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: cnst.AppData.supportedDataLocales.map((code) {
        final isSelected = code == selectedCode;
        return Tooltip(
          message: languageLabel(l10n, code),
          child: InkWell(
            borderRadius: BorderRadius.circular(30.0.a),
            onTap: () {
              if (code == selectedCode) return;
              onSelect(code);
            },
            child: Container(
              padding: EdgeInsets.all(8.0.a),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColor.buttonColor,
                border: isSelected
                    ? Border.all(color: Colors.white, width: 2.0)
                    : null,
              ),
              child: Text(
                languageFlag(code),
                style: TextStyle(fontSize: 28.0.a),
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
