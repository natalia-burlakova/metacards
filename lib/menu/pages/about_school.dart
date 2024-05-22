import 'package:flutter/material.dart';
import 'package:metacards/general/const/app_text_styles.dart';
import 'package:metacards/general/ui/page_general.dart';
import 'package:metacards/general/utils/screen_adapt.dart';

class AboutSchool extends StatelessWidget {
  const AboutSchool({super.key});

  @override
  Widget build(BuildContext context) {
    return PageGeneral(
        canBack: true,
        title: 'О нас ',
        body: Padding(
            padding: EdgeInsets.symmetric(vertical: 25.0.a, horizontal: 20.0.a),
            // ignore: prefer_adjacent_string_concatenation
            child: SelectableText(
              '''Школа психологии и энергопрактики "Только ТЫ"

Существует более 5 лет

 🔐 Мы предлагаем обучение от нулевого уровня до мастера - "под ключ"

Работа проходит как в малых группах, так и в VIP-сессиях 

Обучение по всем продуктам можно пройти Off-line или On-line

Главная особенность школы:
 1️⃣ забота о безопасности и экологичности обучающих процессов
 2️⃣ баланс между психологическими и энергетическими практиками
 3️⃣ работа до 100% результатов в материальном мире

Программа обучения состоит из следующих форматов:
  ✔️Лекции
  ✔️Медитации
  ✔️Курсы
  ✔️Тренинги
  ✔️Терапии (индивидуальные и групповые)
  ✔️Расстановка (комбо-метод)
  ✔️Марафоны
  ✔️Трансформационные игры''',
              style: AppTextStyles.normal16,
            )));
  }
}
