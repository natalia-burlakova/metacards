// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get workTemplateTitle => 'шаблон для работы';

  @override
  String get commonYes => 'ДА';

  @override
  String get commonNo => 'НЕТ';

  @override
  String get workCongratulations => 'Поздравляем!';

  @override
  String get workAllVerbsDoneMessage =>
      'Вы проработали все глаголы для этой эмоции! Переходите к следующей.';

  @override
  String get intentionLabel => 'Намерение';

  @override
  String cardsAppBarStopIntentionConfirm(String intention) {
    return 'Вы точно хотите прекратить работу по данному намерению \"$intention\" и начать новую? Текущая работа будет сохранена.';
  }

  @override
  String get workOldestWillBeDeleted =>
      'Самая старая несохраненная работа будет удалена!';

  @override
  String get emotionCardIntentionMissingWarning =>
      'Сначала заполните намерение.';

  @override
  String get emotionCardContinueOrFinishConfirm =>
      'Поднимаются ли еще негативные эмоции на эту ситуацию? Если да, нажмите кнопку ДОРАБОТАТЬ , если нет, то нажмите кнопку ЗАВЕРШИТЬ.';

  @override
  String get emotionCardContinueButton => 'ДОРАБОТАТЬ';

  @override
  String get emotionCardFinishButton => 'ЗАВЕРШИТЬ';

  @override
  String get emotionCardTransformationCelebration =>
      'Поздравляем с успешной трансформацией себя!';

  @override
  String get emotionCardVerbsNotDoneWarning =>
      'Прежде чем перейти к следующей эмоции проработайте все глаголы этой.';

  @override
  String get menuTitle => 'МЕНЮ';

  @override
  String get menuAboutEmotions => 'Что такое эмоции?';

  @override
  String get menuVideoLesson => 'Видео-урок';

  @override
  String get menuCreativeMode => 'Творческий режим';

  @override
  String get menuSavedWorks => 'Сохраненные работы';

  @override
  String get menuSchoolName => '\"ТОЛЬКО ТЫ\"';

  @override
  String get menuSchoolSubtitle => 'Школа Психологии и Энергопрактики';

  @override
  String get menuAboutSchool => 'О нас';

  @override
  String get menuContacts => 'Контакты';

  @override
  String get menuDonate => 'Поддержать проект';

  @override
  String get menuBuyDecks => 'Купить печатные колоды';

  @override
  String get menuHowToUse => 'Как пользоваться приложением';

  @override
  String get menuSettings => 'Настройки';

  @override
  String get menuVersionLabel => 'Версия 1.1.0';

  @override
  String get settingsLanguageLabel => 'Язык';

  @override
  String get settingsLanguageRussian => 'Русский';

  @override
  String get settingsLanguageEnglish => 'Английский';

  @override
  String get settingsLanguageSerbian => 'Сербский';

  @override
  String get aboutEmotionsBody =>
      'Эмоции - это реакции (переживания, ощущения, настроения, чувства) человека, на определённые события или действия.\n\nГлавная роль эмоций заключается в налаживании четкой связи между объективной реальностью и оценочным восприятием человека, то есть между тем что реально происходит в мире и тем как вы это оцениваете. \n\nУмение правильно распознавать эмоции окружающих помогает человеку строить отношения с людьми, что приводит к социальной адаптивности и эффективности.\n\nУправление эмоциями – это способность человека чувствовать свои эмоции, давать им характеристику, переживать их и отпускать после этого.\n\nНе стоит путать управление эмоциями с их подавлением. В первом случае мы получаем контроль над собой, а во втором только заглушаем свои чувства и не решаем проблему. \nУправление эмоциями помогает не подавлять их или скрывать, а уметь распознавать, называть, брать под контроль и использовать себе на благо.\n\nЭмоции и чувства побуждают человека к действиям, оказывают влияние на принятие решений и постановку жизненных целей, определяют поведение, и просто оказываются необходимыми в преодолении трудностей повседневной жизни.\n\nПроживание чувств, эмоциональный опыт делают человека более зрелым. Таким образом, благодаря управлению эмоциями и чувствами мы остаемся в контакте с собой, с другими и в целом, с окружающим миром.\n';

  @override
  String get aboutSchoolBody =>
      'Школа психологии и энергопрактики \"Только ТЫ\"\n\nСуществует более 5 лет\n\n 🔐 Мы предлагаем обучение от нулевого уровня до мастера - \"под ключ\"\n\nРабота проходит как в малых группах, так и в VIP-сессиях \n\nОбучение по всем продуктам можно пройти Off-line или On-line\n\nГлавная особенность школы:\n 1️⃣ забота о безопасности и экологичности обучающих процессов\n 2️⃣ баланс между психологическими и энергетическими практиками\n 3️⃣ работа до 100% результатов в материальном мире\n\nПрограмма обучения состоит из следующих форматов:\n  ✔️Лекции\n  ✔️Медитации\n  ✔️Курсы\n  ✔️Тренинги\n  ✔️Терапии (индивидуальные и групповые)\n  ✔️Расстановка (комбо-метод)\n  ✔️Марафоны\n  ✔️Трансформационные игры';

  @override
  String get workListEmptyMessage => 'Сохраненных работ не найдено.';

  @override
  String get contactsTelegramChannelTitle =>
      'Телеграмм КАНАЛ школы \"Только Ты\"';

  @override
  String get contactsTelegramChatTitle => 'Телеграмм ЧАТ школы \"Только Ты\"';

  @override
  String get contactsYoutubeChannelTitle => 'YouTube канал школы \"Только Ты\"';

  @override
  String get contactsReachMastersIntro => 'Связаться с мастерами школы:';

  @override
  String get contactsMasterAlla => 'Аллой Сысоевой';

  @override
  String get contactsMasterEvgenia => 'Евгенией Зеленской';

  @override
  String get contactsMasterOlga => 'Ольгой Осадченко';

  @override
  String get intentionAddButton => 'Начать работу';

  @override
  String get workTemplateRefrain =>
      'я тебя вижу,\nя тебя слышу,\nя тебя чувствую.';

  @override
  String get workTemplatePurpose => 'Ты мне необходима для того, чтобы ';

  @override
  String get workTemplateListen => '... прислушайтесь к себе и';

  @override
  String get workTemplateRealize => 'осознайте для чего эта эмоция';

  @override
  String get workTemplateNeedIt => 'нужна именно вам.';

  @override
  String get workTemplateStep2Intro1 => 'Заходите еще глубже';

  @override
  String get workTemplateStep2Intro2 => 'с помощью вопросов';

  @override
  String get workTemplateQuestionWhy => 'ДЛЯ ЧЕГО?';

  @override
  String get workTemplateAnd => ' и ';

  @override
  String get workTemplateQuestionEvenIf => 'ДАЖЕ ЕСЛИ...';

  @override
  String get workTemplateThanks =>
      'Спасибо тебе, эмоция,\nза этот опыт, и спасибо\nвсем людям, которые\nнаучили меня тебя\nчувствовать!';

  @override
  String get workTemplateAccept =>
      'Я принимаю тебя и даю тебе\nместо в своем теле.';

  @override
  String get workTemplateNextVerbButton => 'Следующий глагол';

  @override
  String get workTemplatePrevVerbButton => 'Предыдущий глагол';

  @override
  String workConfirmDeleteWork(String intention) {
    return 'Вы точно хотите полностью удалить работу по данному намерению \"$intention\"?';
  }

  @override
  String workConfirmResumeWork(String intention) {
    return 'Вы хотите вернуться к работе \"$intention\"?';
  }

  @override
  String get creativeModeDisableConfirm => 'Выключить творческий режим?';
}
