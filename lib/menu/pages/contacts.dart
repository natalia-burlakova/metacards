import 'package:flutter/material.dart';
import 'package:metacards/data/constants.dart';
import 'package:metacards/general/const/app_text_styles.dart';
import 'package:metacards/general/ui/page_general.dart';
import 'package:metacards/general/utils/screen_adapt.dart';
import 'package:metacards/menu/link_contact_button.dart';

class Contacts extends StatelessWidget {
  const Contacts({super.key});

  @override
  Widget build(BuildContext context) {
    return PageGeneral(
        canBack: true,
        title: 'Контакты',
        body: Padding(
            padding: EdgeInsets.symmetric(vertical: 25.0.a, horizontal: 20.0.a),
            // ignore: prefer_adjacent_string_concatenation
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const LinkContactButton(
                  url: 'https://t.me/shkola_tolko_ti',
                  title: 'Телеграмм КАНАЛ школы "Только Ты"',
                  icon: Icons.telegram,
                ),
                const LinkContactButton(
                  url: 'https://t.me/+V3tiRxWoeIG61kkO',
                  title: 'Телеграмм ЧАТ школы "Только Ты"',
                  icon: Icons.telegram,
                ),
                const LinkContactButton(
                  url: 'https://www.youtube.com/@TolkoTiShkola',
                  title: 'YouTube канал школы "Только Ты"',
                  icon: Icons.telegram,
                ),
                Text(
                  '''

Связаться с мастерами школы:

▫️Аллой Сысоевой: ''',
                  style: AppTextStyles.normal16,
                ),
                Row(
                  children: [
                    LinkContactButton(
                      url: 'https://t.me/alla_sisoeva',
                      title: 'Telegram',
                      icon: Icons.telegram,
                      titleStyle: AppTextStyles.normal16,
                    ),
                    LinkContactButton(
                      url: 'https://wa.me/79515359416',
                      title: 'WhatsApp',
                      titleStyle: AppTextStyles.normal16,
                      iconWidget: Image.asset(
                        AssetPaths.whatsappLogo,
                        width: 30.0.a,
                      ),
                    ),
                  ],
                ),
                Text(
                  '''

▫️Евгенией Зеленской: ''',
                  style: AppTextStyles.normal16,
                ),
                Row(
                  children: [
                    LinkContactButton(
                      url: 'https://t.me/EvgeniyaZelenskaya',
                      title: 'Telegram',
                      icon: Icons.telegram,
                      titleStyle: AppTextStyles.normal16,
                    ),
                    LinkContactButton(
                      url: 'https://wa.me/79180601758',
                      title: 'WhatsApp',
                      titleStyle: AppTextStyles.normal16,
                      iconWidget: Image.asset(
                        AssetPaths.whatsappLogo,
                        width: 30.0.a,
                      ),
                    ),
                  ],
                ),
                Text(
                  '''

▫️Ольгой Осадченко: ''',
                  style: AppTextStyles.normal16,
                ),
                Row(
                  children: [
                    LinkContactButton(
                      url: 'http://t.me/osadchenko_olga',
                      title: 'Telegram',
                      icon: Icons.telegram,
                      titleStyle: AppTextStyles.normal16,
                    ),
                    LinkContactButton(
                      url: 'https://wa.me/79289678003',
                      title: 'WhatsApp',
                      titleStyle: AppTextStyles.normal16,
                      iconWidget: Image.asset(
                        AssetPaths.whatsappLogo,
                        width: 30.0.a,
                      ),
                    ),
                  ],
                )
              ],
            )));
  }
}
