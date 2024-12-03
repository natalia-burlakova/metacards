import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:metacards/dashboard/widgets/cards_app_bar.dart';
import 'package:metacards/general/const/app_colors.dart';

import 'package:metacards/data/constants.dart' as cnst;
import 'package:metacards/menu/menu_drawer.dart';

class PageGeneral extends StatefulWidget {
  final bool canBack;
  final Key? pageKey;
  final Widget? body;
  final String title;
  final Function? onUpdate;
  const PageGeneral({
    super.key,
    this.pageKey,
    this.canBack = false,
    this.body,
    this.title = '',
    this.onUpdate,
  });

  @override
  State<PageGeneral> createState() => _PageGeneralState();
}

class _PageGeneralState extends State<PageGeneral> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawerEnableOpenDragGesture: false,
        key: widget.pageKey,
        appBar: AppBar(
            automaticallyImplyLeading: false,
            foregroundColor: AppColor.backgroundColor,
            backgroundColor: AppColor.buttonColor,
            leading: Padding(
              padding: const EdgeInsets.all(5.0),
              child: InkWell(
                onTap: () {
                  if (widget.canBack) {
                    context.pop(true);
                  } else {
                    if (cnst.globalKey.currentState!.isDrawerOpen) {
                      cnst.globalKey.currentState!.closeDrawer();
                    } else {
                      cnst.globalKey.currentState!.openDrawer();
                    }
                  }
                },
                child: Container(
                  height: 30.0,
                  width: 30.0,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.black,
                        width: 2.0,
                      )),
                  child: Icon(
                    widget.canBack ? Icons.arrow_back : Icons.menu,
                  ),
                ),
              ),
            ),
            titleSpacing: 0.0,
            title: CardsAppBar(
              intention: (cnst.AppData.appUser?.creativeModeWork == null)
                  ? ((cnst.AppData.appUser?.works.isNotEmpty ?? false)
                      ? cnst
                          .AppData
                          .appUser!
                          .works[cnst.AppData.appUser!.currentWorkIndex]
                          .intention
                      : '')
                  : '',
              showIntention: (cnst.AppData.appUser?.creativeModeWork == null)
                  ? widget.title.isEmpty
                  : false,
              titel: (cnst.AppData.appUser?.creativeModeWork == null)
                  ? widget.title
                  : 'Творческий режим',
              onUpdate: () {
                setState(() {});
                if (widget.onUpdate != null) {
              widget.onUpdate!();
            }
              },
            )),
        backgroundColor:
            widget.canBack ? AppColor.buttonColor : AppColor.backgroundColor,
        drawer: MenuDrawer(
          onUpdate: () {
            setState(() {});
            if (widget.onUpdate != null) {
              widget.onUpdate!();
            }
          },
        ),
        body: widget.body ?? const SizedBox.shrink());
  }
}
