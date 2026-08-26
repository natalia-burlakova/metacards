import 'package:flutter/material.dart';
import 'package:metacards/l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:metacards/general/const/app_colors.dart';
import 'package:metacards/general/const/app_text_styles.dart';
import 'package:metacards/general/utils/screen_adapt.dart';
import 'package:metacards/menu/expantion_menu_item.dart';
import 'package:metacards/menu/menu_item.dart';
import 'package:metacards/data/constants.dart' as cnst;

class MenuDrawer extends StatefulWidget {
  final Function? onUpdate;
  const MenuDrawer({super.key, this.onUpdate});

  @override
  State<MenuDrawer> createState() => _MenuDrawerState();
}

class _MenuDrawerState extends State<MenuDrawer> {
  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final mediaQuery = MediaQuery.of(context);
    return SizedBox(
      width: mediaQuery.size.width * 0.8,
      child: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: Colors.black.withAlpha(128),
        ),
        child: Drawer(
          elevation: 0,
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 10.0.a),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              SizedBox(
                height: (cnst.appBarHeight + 35).a,
                child: DrawerHeader(
                  margin: EdgeInsets.zero,
                  padding: EdgeInsets.only(bottom: 5.0.a),
                  child: Container(
                    decoration: const BoxDecoration(
                      color: AppColor.buttonColor,
                    ),
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 10.0.a),
                          child: InkWell(
                            onTap: () {
                              cnst.globalKey.currentState!.closeDrawer();
                            },
                            child: Container(
                              height: 30.0.a,
                              width: 30.0.a,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: Colors.black,
                                    width: 2.0,
                                  )),
                              child: const Center(
                                child: Icon(
                                  Icons.menu,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Flexible(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                l10n.menuTitle,
                                style: AppTextStyles.bold21,
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              MenuItem(
                title: l10n.menuAboutEmotions,
                navigation: () {
                  context.push('/about_emotions');
                },
              ),
              MenuItem(
                title: l10n.menuVideoLesson,
                navigation: () {},
              ),
              MenuItem(
                title: l10n.menuCreativeMode,
                titleTextStyle:
                    cnst.AppInitializer.appData.appUser!.creativeModeWork ==
                            null
                        ? null
                        : AppTextStyles.bold16,
                navigation: () {
                  if (cnst.AppInitializer.appData.appUser!.creativeModeWork ==
                      null) {
                    //включить творческий режим
                    cnst.AppInitializer.appData.creativeModeTurnOn();
                  } else {
                    //выключить
                    cnst.AppInitializer.appData.creativeModeTurnOff();
                  }
                  while (GoRouterState.of(context).uri.path != "/") {
                    GoRouter.of(context).pop(true);
                  }
                  if (widget.onUpdate != null) {
                    widget.onUpdate!();
                  }
                },
              ),
              MenuItem(
                title: l10n.menuSavedWorks,
                navigation: () {
                  context.push('/work_list');
                },
              ),
              ExpancionMenuItem(
                leading: Image.asset(
                  cnst.AssetPaths.logoTransparent,
                  width: 70,
                  fit: BoxFit.fitWidth,
                ),
                height: 80,
                title: l10n.menuSchoolName,
                titleTextStyle: AppTextStyles.bold16,
                subtitle: l10n.menuSchoolSubtitle,
                children: [
                  Container(
                    color: Colors.black,
                    height: 5,
                  ),
                  MenuItem(
                    title: l10n.menuAboutSchool,
                    navigation: () {
                      context.push('/about_school');
                    },
                  ),
                  Container(
                    color: Colors.black,
                    height: 5,
                  ),
                  MenuItem(
                    title: l10n.menuContacts,
                    navigation: () {
                      context.push('/contacts');
                    },
                    contentPadding: EdgeInsets.zero,
                  ),
                  Container(
                    color: Colors.black,
                    height: 5,
                  ),
                  MenuItem(
                    title: l10n.menuDonate,
                    navigation: () {
                      context.push('/donate');
                    },
                  ),
                ],
              ),
              MenuItem(
                title: l10n.menuBuyDecks,
                navigation: () {},
              ),
              MenuItem(
                title: l10n.menuHowToUse,
                navigation: () {},
              ),
              MenuItem(
                title: l10n.menuSettings,
                navigation: () {
                  context.push('/settings');
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    l10n.menuVersionLabel,
                    style: AppTextStyles.medium18.copyWith(color: Colors.white),
                  ),
                ],
              )
            ]),
          ),
        ),
      ),
    );
  }
}
