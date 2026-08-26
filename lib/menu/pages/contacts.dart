import 'package:flutter/material.dart';
import 'package:metacards/l10n/app_localizations.dart';
import 'package:metacards/data/constants.dart';
import 'package:metacards/general/const/app_text_styles.dart';
import 'package:metacards/general/ui/page_general.dart';
import 'package:metacards/general/utils/screen_adapt.dart';
import 'package:metacards/menu/link_contact_button.dart';

class Contacts extends StatelessWidget {
  const Contacts({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return PageGeneral(
        canBack: true,
        title: l10n.menuContacts,
        body: Padding(
            padding: EdgeInsets.symmetric(vertical: 25.0.a, horizontal: 20.0.a),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                LinkContactButton(
                  url: 'https://t.me/shkola_tolko_ti',
                  title: l10n.contactsTelegramChannelTitle,
                  icon: Icons.telegram,
                ),
                LinkContactButton(
                  url: 'https://t.me/+V3tiRxWoeIG61kkO',
                  title: l10n.contactsTelegramChatTitle,
                  icon: Icons.telegram,
                ),
                LinkContactButton(
                  url: 'https://www.youtube.com/@TolkoTiShkola',
                  title: l10n.contactsYoutubeChannelTitle,
                  icon: Icons.telegram,
                ),
                Text(
                  '\n\n${l10n.contactsReachMastersIntro}\n\n▫️${l10n.contactsMasterAlla}: ',
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
                  '\n\n▫️${l10n.contactsMasterEvgenia}: ',
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
                  '\n\n▫️${l10n.contactsMasterOlga}: ',
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
