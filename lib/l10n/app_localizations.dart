import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_ru.dart';
import 'app_localizations_sr.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ru'),
    Locale('en'),
    Locale('sr'),
  ];

  /// No description provided for @workTemplateTitle.
  ///
  /// In ru, this message translates to:
  /// **'шаблон для работы'**
  String get workTemplateTitle;

  /// No description provided for @commonYes.
  ///
  /// In ru, this message translates to:
  /// **'ДА'**
  String get commonYes;

  /// No description provided for @commonNo.
  ///
  /// In ru, this message translates to:
  /// **'НЕТ'**
  String get commonNo;

  /// No description provided for @workCongratulations.
  ///
  /// In ru, this message translates to:
  /// **'Поздравляем!'**
  String get workCongratulations;

  /// No description provided for @workAllVerbsDoneMessage.
  ///
  /// In ru, this message translates to:
  /// **'Вы проработали все глаголы для этой эмоции! Переходите к следующей.'**
  String get workAllVerbsDoneMessage;

  /// No description provided for @intentionLabel.
  ///
  /// In ru, this message translates to:
  /// **'Намерение'**
  String get intentionLabel;

  /// No description provided for @cardsAppBarStopIntentionConfirm.
  ///
  /// In ru, this message translates to:
  /// **'Вы точно хотите прекратить работу по данному намерению \"{intention}\" и начать новую? Текущая работа будет сохранена.'**
  String cardsAppBarStopIntentionConfirm(String intention);

  /// No description provided for @workOldestWillBeDeleted.
  ///
  /// In ru, this message translates to:
  /// **'Самая старая несохраненная работа будет удалена!'**
  String get workOldestWillBeDeleted;

  /// No description provided for @emotionCardIntentionMissingWarning.
  ///
  /// In ru, this message translates to:
  /// **'Сначала заполните намерение.'**
  String get emotionCardIntentionMissingWarning;

  /// No description provided for @emotionCardContinueOrFinishConfirm.
  ///
  /// In ru, this message translates to:
  /// **'Поднимаются ли еще негативные эмоции на эту ситуацию? Если да, нажмите кнопку ДОРАБОТАТЬ , если нет, то нажмите кнопку ЗАВЕРШИТЬ.'**
  String get emotionCardContinueOrFinishConfirm;

  /// No description provided for @emotionCardContinueButton.
  ///
  /// In ru, this message translates to:
  /// **'ДОРАБОТАТЬ'**
  String get emotionCardContinueButton;

  /// No description provided for @emotionCardFinishButton.
  ///
  /// In ru, this message translates to:
  /// **'ЗАВЕРШИТЬ'**
  String get emotionCardFinishButton;

  /// No description provided for @emotionCardTransformationCelebration.
  ///
  /// In ru, this message translates to:
  /// **'Поздравляем с успешной трансформацией себя!'**
  String get emotionCardTransformationCelebration;

  /// No description provided for @emotionCardVerbsNotDoneWarning.
  ///
  /// In ru, this message translates to:
  /// **'Прежде чем перейти к следующей эмоции проработайте все глаголы этой.'**
  String get emotionCardVerbsNotDoneWarning;

  /// No description provided for @menuTitle.
  ///
  /// In ru, this message translates to:
  /// **'МЕНЮ'**
  String get menuTitle;

  /// No description provided for @menuAboutEmotions.
  ///
  /// In ru, this message translates to:
  /// **'Что такое эмоции?'**
  String get menuAboutEmotions;

  /// No description provided for @menuVideoLesson.
  ///
  /// In ru, this message translates to:
  /// **'Видео-урок'**
  String get menuVideoLesson;

  /// No description provided for @menuCreativeMode.
  ///
  /// In ru, this message translates to:
  /// **'Творческий режим'**
  String get menuCreativeMode;

  /// No description provided for @menuSavedWorks.
  ///
  /// In ru, this message translates to:
  /// **'Сохраненные работы'**
  String get menuSavedWorks;

  /// No description provided for @menuSchoolName.
  ///
  /// In ru, this message translates to:
  /// **'\"ТОЛЬКО ТЫ\"'**
  String get menuSchoolName;

  /// No description provided for @menuSchoolSubtitle.
  ///
  /// In ru, this message translates to:
  /// **'Школа Психологии и Энергопрактики'**
  String get menuSchoolSubtitle;

  /// No description provided for @menuAboutSchool.
  ///
  /// In ru, this message translates to:
  /// **'О нас'**
  String get menuAboutSchool;

  /// No description provided for @menuContacts.
  ///
  /// In ru, this message translates to:
  /// **'Контакты'**
  String get menuContacts;

  /// No description provided for @menuDonate.
  ///
  /// In ru, this message translates to:
  /// **'Поддержать проект'**
  String get menuDonate;

  /// No description provided for @menuBuyDecks.
  ///
  /// In ru, this message translates to:
  /// **'Купить печатные колоды'**
  String get menuBuyDecks;

  /// No description provided for @menuHowToUse.
  ///
  /// In ru, this message translates to:
  /// **'Как пользоваться приложением'**
  String get menuHowToUse;

  /// No description provided for @menuSettings.
  ///
  /// In ru, this message translates to:
  /// **'Настройки'**
  String get menuSettings;

  /// No description provided for @menuVersionLabel.
  ///
  /// In ru, this message translates to:
  /// **'Версия 1.1.0'**
  String get menuVersionLabel;

  /// No description provided for @settingsLanguageLabel.
  ///
  /// In ru, this message translates to:
  /// **'Язык'**
  String get settingsLanguageLabel;

  /// No description provided for @settingsLanguageRussian.
  ///
  /// In ru, this message translates to:
  /// **'Русский'**
  String get settingsLanguageRussian;

  /// No description provided for @settingsLanguageEnglish.
  ///
  /// In ru, this message translates to:
  /// **'Английский'**
  String get settingsLanguageEnglish;

  /// No description provided for @settingsLanguageSerbian.
  ///
  /// In ru, this message translates to:
  /// **'Сербский'**
  String get settingsLanguageSerbian;

  /// No description provided for @aboutEmotionsBody.
  ///
  /// In ru, this message translates to:
  /// **'Эмоции - это реакции (переживания, ощущения, настроения, чувства) человека, на определённые события или действия.\n\nГлавная роль эмоций заключается в налаживании четкой связи между объективной реальностью и оценочным восприятием человека, то есть между тем что реально происходит в мире и тем как вы это оцениваете. \n\nУмение правильно распознавать эмоции окружающих помогает человеку строить отношения с людьми, что приводит к социальной адаптивности и эффективности.\n\nУправление эмоциями – это способность человека чувствовать свои эмоции, давать им характеристику, переживать их и отпускать после этого.\n\nНе стоит путать управление эмоциями с их подавлением. В первом случае мы получаем контроль над собой, а во втором только заглушаем свои чувства и не решаем проблему. \nУправление эмоциями помогает не подавлять их или скрывать, а уметь распознавать, называть, брать под контроль и использовать себе на благо.\n\nЭмоции и чувства побуждают человека к действиям, оказывают влияние на принятие решений и постановку жизненных целей, определяют поведение, и просто оказываются необходимыми в преодолении трудностей повседневной жизни.\n\nПроживание чувств, эмоциональный опыт делают человека более зрелым. Таким образом, благодаря управлению эмоциями и чувствами мы остаемся в контакте с собой, с другими и в целом, с окружающим миром.\n'**
  String get aboutEmotionsBody;

  /// No description provided for @aboutSchoolBody.
  ///
  /// In ru, this message translates to:
  /// **'Школа психологии и энергопрактики \"Только ТЫ\"\n\nСуществует более 5 лет\n\n 🔐 Мы предлагаем обучение от нулевого уровня до мастера - \"под ключ\"\n\nРабота проходит как в малых группах, так и в VIP-сессиях \n\nОбучение по всем продуктам можно пройти Off-line или On-line\n\nГлавная особенность школы:\n 1️⃣ забота о безопасности и экологичности обучающих процессов\n 2️⃣ баланс между психологическими и энергетическими практиками\n 3️⃣ работа до 100% результатов в материальном мире\n\nПрограмма обучения состоит из следующих форматов:\n  ✔️Лекции\n  ✔️Медитации\n  ✔️Курсы\n  ✔️Тренинги\n  ✔️Терапии (индивидуальные и групповые)\n  ✔️Расстановка (комбо-метод)\n  ✔️Марафоны\n  ✔️Трансформационные игры'**
  String get aboutSchoolBody;

  /// No description provided for @workListEmptyMessage.
  ///
  /// In ru, this message translates to:
  /// **'Сохраненных работ не найдено.'**
  String get workListEmptyMessage;

  /// No description provided for @contactsTelegramChannelTitle.
  ///
  /// In ru, this message translates to:
  /// **'Телеграмм КАНАЛ школы \"Только Ты\"'**
  String get contactsTelegramChannelTitle;

  /// No description provided for @contactsTelegramChatTitle.
  ///
  /// In ru, this message translates to:
  /// **'Телеграмм ЧАТ школы \"Только Ты\"'**
  String get contactsTelegramChatTitle;

  /// No description provided for @contactsYoutubeChannelTitle.
  ///
  /// In ru, this message translates to:
  /// **'YouTube канал школы \"Только Ты\"'**
  String get contactsYoutubeChannelTitle;

  /// No description provided for @contactsReachMastersIntro.
  ///
  /// In ru, this message translates to:
  /// **'Связаться с мастерами школы:'**
  String get contactsReachMastersIntro;

  /// No description provided for @contactsMasterAlla.
  ///
  /// In ru, this message translates to:
  /// **'Аллой Сысоевой'**
  String get contactsMasterAlla;

  /// No description provided for @contactsMasterEvgenia.
  ///
  /// In ru, this message translates to:
  /// **'Евгенией Зеленской'**
  String get contactsMasterEvgenia;

  /// No description provided for @contactsMasterOlga.
  ///
  /// In ru, this message translates to:
  /// **'Ольгой Осадченко'**
  String get contactsMasterOlga;

  /// No description provided for @intentionAddButton.
  ///
  /// In ru, this message translates to:
  /// **'Начать работу'**
  String get intentionAddButton;

  /// No description provided for @workTemplateRefrain.
  ///
  /// In ru, this message translates to:
  /// **'я тебя вижу,\nя тебя слышу,\nя тебя чувствую.'**
  String get workTemplateRefrain;

  /// No description provided for @workTemplatePurpose.
  ///
  /// In ru, this message translates to:
  /// **'Ты мне необходима для того, чтобы '**
  String get workTemplatePurpose;

  /// No description provided for @workTemplateListen.
  ///
  /// In ru, this message translates to:
  /// **'... прислушайтесь к себе и'**
  String get workTemplateListen;

  /// No description provided for @workTemplateRealize.
  ///
  /// In ru, this message translates to:
  /// **'осознайте для чего эта эмоция'**
  String get workTemplateRealize;

  /// No description provided for @workTemplateNeedIt.
  ///
  /// In ru, this message translates to:
  /// **'нужна именно вам.'**
  String get workTemplateNeedIt;

  /// No description provided for @workTemplateStep2Intro1.
  ///
  /// In ru, this message translates to:
  /// **'Заходите еще глубже'**
  String get workTemplateStep2Intro1;

  /// No description provided for @workTemplateStep2Intro2.
  ///
  /// In ru, this message translates to:
  /// **'с помощью вопросов'**
  String get workTemplateStep2Intro2;

  /// No description provided for @workTemplateQuestionWhy.
  ///
  /// In ru, this message translates to:
  /// **'ДЛЯ ЧЕГО?'**
  String get workTemplateQuestionWhy;

  /// No description provided for @workTemplateAnd.
  ///
  /// In ru, this message translates to:
  /// **' и '**
  String get workTemplateAnd;

  /// No description provided for @workTemplateQuestionEvenIf.
  ///
  /// In ru, this message translates to:
  /// **'ДАЖЕ ЕСЛИ...'**
  String get workTemplateQuestionEvenIf;

  /// No description provided for @workTemplateThanks.
  ///
  /// In ru, this message translates to:
  /// **'Спасибо тебе, эмоция,\nза этот опыт, и спасибо\nвсем людям, которые\nнаучили меня тебя\nчувствовать!'**
  String get workTemplateThanks;

  /// No description provided for @workTemplateAccept.
  ///
  /// In ru, this message translates to:
  /// **'Я принимаю тебя и даю тебе\nместо в своем теле.'**
  String get workTemplateAccept;

  /// No description provided for @workTemplateNextVerbButton.
  ///
  /// In ru, this message translates to:
  /// **'Следующий глагол'**
  String get workTemplateNextVerbButton;

  /// No description provided for @workTemplatePrevVerbButton.
  ///
  /// In ru, this message translates to:
  /// **'Предыдущий глагол'**
  String get workTemplatePrevVerbButton;

  /// No description provided for @workConfirmDeleteWork.
  ///
  /// In ru, this message translates to:
  /// **'Вы точно хотите полностью удалить работу по данному намерению \"{intention}\"?'**
  String workConfirmDeleteWork(String intention);

  /// No description provided for @workConfirmResumeWork.
  ///
  /// In ru, this message translates to:
  /// **'Вы хотите вернуться к работе \"{intention}\"?'**
  String workConfirmResumeWork(String intention);

  /// No description provided for @creativeModeDisableConfirm.
  ///
  /// In ru, this message translates to:
  /// **'Выключить творческий режим?'**
  String get creativeModeDisableConfirm;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'ru', 'sr'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'ru':
      return AppLocalizationsRu();
    case 'sr':
      return AppLocalizationsSr();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
