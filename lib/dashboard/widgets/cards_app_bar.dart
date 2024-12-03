import 'package:flutter/material.dart';
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
        Row(
          children: [
            if (cnst.AppData.workMethods!.canAddWork())
              InkWell(
                onTap: () {
                  final text = cnst.AppData.workMethods!.getWorkAddText();
                  showDialog(
                      context: context,
                      builder: (dialogContext) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Center(
                              child: YesNoDialog(
                                height: text.isEmpty ? 285.0.a : 340.0.a,
                                title:
                                    'Вы точно хотите прекратить работу по данному намерению "$intention" и начать новую? Текущая работа будет сохранена. $text',
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
            if (cnst.AppData.workMethods!.canDeleteWork())
              InkWell(
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (dialogContext) {
                        return cnst.AppData.workMethods!.getWorkDeleteDialog(
                          dialogContext,
                          cnst.AppData.appUser?.currentWorkIndex ?? 0,
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
