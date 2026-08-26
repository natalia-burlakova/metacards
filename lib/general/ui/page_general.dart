import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:metacards/l10n/app_localizations.dart';
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
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) return;
        if (cnst.globalKey.currentState?.isDrawerOpen ?? false) {
          cnst.globalKey.currentState!.closeDrawer();
        } else if (widget.canBack) {
          context.pop(true);
        } else {
          SystemNavigator.pop();
        }
      },
      child: Scaffold(
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
              intention: (cnst
                          .AppInitializer.appData.appUser?.creativeModeWork ==
                      null)
                  ? ((cnst.AppInitializer.appData.appUser?.works.isNotEmpty ??
                          false)
                      ? cnst
                          .AppInitializer
                          .appData
                          .appUser!
                          .works[cnst
                              .AppInitializer.appData.appUser!.currentWorkIndex]
                          .intention
                      : '')
                  : '',
              showIntention:
                  (cnst.AppInitializer.appData.appUser?.creativeModeWork ==
                          null)
                      ? widget.title.isEmpty
                      : false,
              titel: (cnst.AppInitializer.appData.appUser?.creativeModeWork ==
                      null)
                  ? widget.title
                  : AppLocalizations.of(context)!.menuCreativeMode,
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
        body: widget.body ?? const SizedBox.shrink(),
      ),
    );
  }
}
