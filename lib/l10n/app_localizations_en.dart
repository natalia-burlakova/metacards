// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get workTemplateTitle => 'work template';

  @override
  String get commonYes => 'YES';

  @override
  String get commonNo => 'NO';

  @override
  String get workCongratulations => 'Congratulations!';

  @override
  String get workAllVerbsDoneMessage =>
      'You\'ve worked through all the verbs for this emotion! Move on to the next one.';

  @override
  String get intentionLabel => 'Intention';

  @override
  String cardsAppBarStopIntentionConfirm(String intention) {
    return 'Are you sure you want to stop working on the intention \"$intention\" and start a new one? Your current work will be saved.';
  }

  @override
  String get workOldestWillBeDeleted =>
      'The oldest unsaved work will be deleted!';

  @override
  String get emotionCardIntentionMissingWarning =>
      'Please fill in an intention first.';

  @override
  String get emotionCardContinueOrFinishConfirm =>
      'Are any more negative emotions coming up about this situation? If yes, tap CONTINUE. If not, tap FINISH.';

  @override
  String get emotionCardContinueButton => 'CONTINUE';

  @override
  String get emotionCardFinishButton => 'FINISH';

  @override
  String get emotionCardTransformationCelebration =>
      'Congratulations on successfully transforming yourself!';

  @override
  String get emotionCardVerbsNotDoneWarning =>
      'Before moving to the next emotion, work through all the verbs for this one.';

  @override
  String get menuTitle => 'MENU';

  @override
  String get menuAboutEmotions => 'What are emotions?';

  @override
  String get menuVideoLesson => 'Video lesson';

  @override
  String get menuCreativeMode => 'Creative mode';

  @override
  String get menuSavedWorks => 'Saved works';

  @override
  String get menuSchoolName => '\"ONLY YOU\"';

  @override
  String get menuSchoolSubtitle => 'School of Psychology and Energy Practice';

  @override
  String get menuAboutSchool => 'About us';

  @override
  String get menuContacts => 'Contacts';

  @override
  String get menuDonate => 'Support the project';

  @override
  String get menuBuyDecks => 'Buy printed decks';

  @override
  String get menuHowToUse => 'How to use the app';

  @override
  String get menuSettings => 'Settings';

  @override
  String get menuVersionLabel => 'Version 1.1.0';

  @override
  String get settingsLanguageLabel => 'Language';

  @override
  String get settingsLanguageRussian => 'Russian';

  @override
  String get settingsLanguageEnglish => 'English';

  @override
  String get settingsLanguageSerbian => 'Serbian';

  @override
  String get aboutEmotionsBody =>
      'Emotions are a person\'s reactions (experiences, sensations, moods, feelings) to particular events or actions.\n\nThe main role of emotions is to build a clear link between objective reality and a person\'s evaluative perception — that is, between what is actually happening in the world and how you assess it.\n\nBeing able to correctly recognize the emotions of others helps a person build relationships, which leads to social adaptability and effectiveness.\n\nManaging emotions is a person\'s ability to feel their emotions, characterize them, experience them, and then let them go.\n\nDon\'t confuse managing emotions with suppressing them. In the first case we gain control over ourselves, while in the second we only mute our feelings without solving the problem.\nManaging emotions isn\'t about suppressing or hiding them, but about being able to recognize, name, take control of, and use them for your own benefit.\n\nEmotions and feelings drive a person to act, influence decision-making and life goals, shape behavior, and are simply necessary for overcoming the difficulties of everyday life.\n\nLiving through feelings and emotional experience make a person more mature. In this way, by managing our emotions and feelings we stay in contact with ourselves, with others, and with the world around us.\n';

  @override
  String get aboutSchoolBody =>
      '\"Only You\" School of Psychology and Energy Practice\n\nRunning for more than 5 years\n\n 🔐 We offer turnkey training from zero level all the way to master\n\nWork happens both in small groups and in VIP sessions\n\nAll programs can be taken offline or online\n\nThe school\'s main features:\n 1️⃣ care for the safety and soundness of the training process\n 2️⃣ balance between psychological and energy practices\n 3️⃣ working toward 100% results in the material world\n\nThe training program consists of the following formats:\n  ✔️Lectures\n  ✔️Meditations\n  ✔️Courses\n  ✔️Trainings\n  ✔️Therapy (individual and group)\n  ✔️Family/systemic constellations (combo method)\n  ✔️Marathons\n  ✔️Transformational games';

  @override
  String get workListEmptyMessage => 'No saved works found.';

  @override
  String get contactsTelegramChannelTitle =>
      '\"Only You\" school Telegram CHANNEL';

  @override
  String get contactsTelegramChatTitle => '\"Only You\" school Telegram CHAT';

  @override
  String get contactsYoutubeChannelTitle =>
      '\"Only You\" school YouTube channel';

  @override
  String get contactsReachMastersIntro => 'Contact the school\'s masters:';

  @override
  String get contactsMasterAlla => 'Alla Sysoeva';

  @override
  String get contactsMasterEvgenia => 'Evgenia Zelenskaya';

  @override
  String get contactsMasterOlga => 'Olga Osadchenko';

  @override
  String get intentionAddButton => 'Start work';

  @override
  String get workTemplateRefrain => 'I see you,\nI hear you,\nI feel you.';

  @override
  String get workTemplatePurpose => 'I need you in order to ';

  @override
  String get workTemplateListen => '... listen to yourself and';

  @override
  String get workTemplateRealize => 'realize why this emotion';

  @override
  String get workTemplateNeedIt => 'is needed by you.';

  @override
  String get workTemplateStep2Intro1 => 'Go even deeper';

  @override
  String get workTemplateStep2Intro2 => 'with the help of questions';

  @override
  String get workTemplateQuestionWhy => 'WHAT FOR?';

  @override
  String get workTemplateAnd => ' and ';

  @override
  String get workTemplateQuestionEvenIf => 'EVEN IF...';

  @override
  String get workTemplateThanks =>
      'Thank you, emotion,\nfor this experience, and thank you\nto all the people who\ntaught me to feel\nyou!';

  @override
  String get workTemplateAccept =>
      'I accept you and give you\na place in my body.';

  @override
  String get workTemplateNextVerbButton => 'Next verb';

  @override
  String get workTemplatePrevVerbButton => 'Previous verb';

  @override
  String workConfirmDeleteWork(String intention) {
    return 'Are you sure you want to completely delete the work for the intention \"$intention\"?';
  }

  @override
  String workConfirmResumeWork(String intention) {
    return 'Do you want to return to the work \"$intention\"?';
  }

  @override
  String get creativeModeDisableConfirm => 'Turn off creative mode?';
}
