import 'package:flutter/material.dart';
import 'package:metacards/l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:metacards/general/ui/message_dialog.dart';
import 'package:metacards/data/constants.dart' as cnst;
import 'package:metacards/general/ui/yesno_dialog.dart';
import 'package:metacards/general/utils/screen_adapt.dart';

class CardsAppBar extends StatelessWidget {
  final String intention;
  final bool showIntention;
  final String titel;
  final Function? onUpdate;
  const CardsAppBar({
    super.key,
    this.intention = '',
    this.showIntention = true,
    this.titel = '',
    this.onUpdate,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: showIntention
              ? InkWell(
                  onTap: () {
                    if (intention.isEmpty) {
                      context.push('/intention_add');
                    } else {
                      showDialog(
                        context: context,
                        builder: (_) {
                          return MessageDialog(
                            height: 200.0,
                            child: Text(intention),
                          );
                        },
                      );
                    }
                  },
                  child: Row(children: [
                    if (intention.isEmpty) Text(l10n.intentionLabel),
                    Flexible(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 5.0),
                        child: Container(
                          decoration: const BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                              color: Colors.black,
                              width: 1.5,
                            )),
                          ),
                          child: Text(
                            intention.padRight(500),
                          ),
                        ),
                      ),
                    ),
                  ]),
                )
              : Text(titel),
        ),
        Row(
          children: [
            if (cnst.AppInitializer.appData.workMethods!.canAddWork())
              InkWell(
                onTap: () {
                  final willDeleteOldest = cnst
                      .AppInitializer.appData.workMethods!
                      .willDeleteOldestWork();
                  final title = willDeleteOldest
                      ? '${l10n.cardsAppBarStopIntentionConfirm(intention)} ${l10n.workOldestWillBeDeleted}'
                      : l10n.cardsAppBarStopIntentionConfirm(intention);
                  showDialog(
                      context: context,
                      builder: (dialogContext) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Center(
                              child: YesNoDialog(
                                height: willDeleteOldest ? 340.0.a : 285.0.a,
                                title: title,
                                yesFunction: () {
                                  Navigator.pop(dialogContext);
                                  context.push('/intention_add');
                                },
                              ),
                            )
                          ],
                        );
                      });
                },
                child: const Icon(
                  Icons.add,
                  size: 40,
                ),
              ),
            if (cnst.AppInitializer.appData.workMethods!.canDeleteWork())
              InkWell(
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (dialogContext) {
                        return cnst.AppInitializer.appData.workMethods!
                            .getWorkDeleteDialog(
                          dialogContext,
                          cnst.AppInitializer.appData.appUser
                                  ?.currentWorkIndex ??
                              0,
                          () {
                            Navigator.pop(dialogContext);

                            if (onUpdate != null) {
                              onUpdate!();
                            }
                            while (GoRouterState.of(context).uri.path != "/") {
                              GoRouter.of(context).pop(true);
                            }
                          },
                        );
                      });
                },
                child: const Icon(
                  Icons.delete_outline,
                  size: 40,
                ),
              ),
          ],
        ),
      ],
    );
  }
}
