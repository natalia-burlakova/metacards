import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:metacards/general/const/app_colors.dart';
import 'package:metacards/general/const/app_text_styles.dart';
import 'package:metacards/general/utils/screen_adapt.dart';
import 'package:metacards/menu/expantion_menu_item.dart';
import 'package:metacards/menu/menu_item.dart';
import 'package:metacards/data/constants.dart' as cnst;

class MenuDrawer extends StatefulWidget {
  const MenuDrawer({super.key});

  @override
  State<MenuDrawer> createState() => _MenuDrawerState();
}

class _MenuDrawerState extends State<MenuDrawer> {
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return SizedBox(
      width: mediaQuery.size.width * 0.8,
      child: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: Colors.black.withOpacity(0.5),
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
                                'МЕНЮ',
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
                title: "Что такое эмоции?",
                navigation: () {
                  context.push('/about_emotions');
                },
              ),
              MenuItem(
                title: "Видео-урок",
                navigation: () {

                },
              ),
              MenuItem(
                title: "Творческий режим",
                navigation: () {
                  if(cnst.AppData.appUser!.creativeModeWork == null){
                    //включить творческий режим
                  }
                  else{
                    //выключить 
                  }
                },
              ),
              MenuItem(
                title: "Сохраненные работы",
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
                title: "\"ТОЛЬКО ТЫ\"",
                titleTextStyle: AppTextStyles.bold16,
                subtitle: "Школа Психологии и Энергопрактики",
                children: [
                  Container(
                    color: Colors.black,
                    height: 5,
                  ),
                  MenuItem(
                    title: "О нас",
                    navigation: () {
                      context.push('/about_school');
                    },
                  ),
                  Container(
                    color: Colors.black,
                    height: 5,
                  ),
                  MenuItem(
                    title: "Контакты",
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
                    title: "Поддержать проект",
                    navigation: () {
                      context.push('/donate');
                    },
                  ),
                ],
              ),
              MenuItem(
                title: "Купить печатные колоды",
                navigation: () {},
              ),
              MenuItem(
                title: "Как пользоваться приложением",
                navigation: () {},
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Версия 1.0.2',
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
