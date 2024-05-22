// ignore_for_file: prefer_single_quotes

import 'package:i18n_extension/i18n_extension.dart';

extension AppLocalizations on String {
  static TranslationsByLocale? t;

  String get i18n => localize(this, t!);
}

final translation = Translations.byLocale('ru') +
    {
      "ru": {"intention": "Намерение"},
    } +
    {
      "ru": {"work_template": "шаблон для работы"},
    };
