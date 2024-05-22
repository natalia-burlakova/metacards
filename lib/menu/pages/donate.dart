import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:metacards/general/const/app_text_styles.dart';
import 'package:metacards/general/ui/page_general.dart';
import 'package:metacards/general/utils/screen_adapt.dart';

class Donate extends StatelessWidget {
  const Donate({super.key});

  @override
  Widget build(BuildContext context) {
    return PageGeneral(
      canBack: true,
      title: 'Поддержать проект',
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 25.0.a, horizontal: 20.0.a),
        // ignore: prefer_adjacent_string_concatenation
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SelectableText(
                '''Донаты:
''',
                style: AppTextStyles.normal16,
              ),
              RichText(
                  text: TextSpan(
                children: <TextSpan>[
                  TextSpan(
                    text: '🔸Карта Россбанк (',
                    style: AppTextStyles.normal16,
                  ),
                  TextSpan(text: 'рублевый счет', style: AppTextStyles.bold16),
                  TextSpan(
                    text: '):',
                    style: AppTextStyles.normal16,
                  ),
                ],
              )),
              InkWell(
                onTap: () {
                  Clipboard.setData(
                      const ClipboardData(text: '2200 3908 0039 7019'));
                },
                child: Row(
                  children: [
                    SelectableText(
                      '''2200 3908 0039 7019''',
                      style: AppTextStyles.normal16,
                    ),
                    Icon(
                      Icons.copy,
                      size: 30.0.a,
                    ),
                  ],
                ),
              ),
              SelectableText(
                '''Евгения Валерьевна З.
                  ''',
                style: AppTextStyles.normal16,
              ),
              RichText(
                  text: TextSpan(
                children: <TextSpan>[
                  TextSpan(
                    text: '🔸Райффайзен карта (',
                    style: AppTextStyles.normal16,
                  ),
                  TextSpan(text: 'валютный счет', style: AppTextStyles.bold16),
                  TextSpan(
                    text: '):',
                    style: AppTextStyles.normal16,
                  ),
                ],
              )),
              SelectableText(
                '''
Счет получателя:
40817840126100008220

Получатель:
SYSOEVA ALLA VLADIMIROVNA, 347933, Rostovskaya obl, Taganrog, Sergeya SHilo ul, house  265-a, # 34

Банк получателя:
AO Raiffeisenbank
SWIFT: RZBMRUMM
Address:17/1 Troitskaya, Moscow, 129090, Russia

Банк посредник:
The Bank of New York Mellon
SWIFT: IRVTUS3N
ABA: 021000018
CHIPS Routing No: 0001
Address: One Wall Street, New York, NY 10286, United States of America

Корреспондентский счет в Банке-посреднике:
8901303402

Назначение платежа:
Назначение платежа указывается на английском языке и должно раскрывать суть перевода, например «Current expenses for July for my child Ivanov Sergey», «Salary for June under Contract 55 dated 15.07.2015».
''',
                style: AppTextStyles.normal16,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
