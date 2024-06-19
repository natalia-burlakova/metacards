import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:metacards/general/ui/message_dialog.dart';
import 'package:metacards/data/constants.dart' as cnst;

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
                    if (intention.isEmpty) const Text('Намерение'),
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
        if (cnst.AppData.workMethods!.canDeleteWork())
          Row(
            children: [
              InkWell(
                onTap: () {
                  if (cnst.AppData.workMethods!.canDeleteWork()) {
                    showDialog(
                        context: context,
                        builder: (dialogContext) {
                          return cnst.AppData.workMethods!.getWorkDeleteDialog(
                            dialogContext,
                            intention,
                            () {
                              Navigator.pop(dialogContext);

                              if (onUpdate != null) {
                                onUpdate!();
                              }
                              while (GoRouter.of(context).location != "/") {
                                GoRouter.of(context).pop(true);
                              }
                            },
                          );
                        });
                  }
                },
                child: const Icon(
                  Icons.add,
                  size: 40,
                ),
              ),
              InkWell(
                onTap: () {
                  if (cnst.AppData.workMethods!.canDeleteWork()) {
                    showDialog(
                        context: context,
                        builder: (dialogContext) {
                          return cnst.AppData.workMethods!.getWorkDeleteDialog(
                            dialogContext,
                            intention,
                            () {
                              Navigator.pop(dialogContext);

                              if (onUpdate != null) {
                                onUpdate!();
                              }
                              while (GoRouter.of(context).location != "/") {
                                GoRouter.of(context).pop(true);
                              }
                            },
                          );
                        });
                  }
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
