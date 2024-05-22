import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:metacards/data/work_functions.dart';
import 'package:metacards/general/const/app_colors.dart';
import 'package:metacards/general/ui/message_dialog.dart';
import 'package:metacards/data/constants.dart' as cnst;
import 'package:metacards/general/ui/yesno_dialog.dart';

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
    return Container(
        color: AppColor.buttonColor,
        child: Row(
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
            if (intention.isNotEmpty && showIntention)
              InkWell(
                onTap: () {
                  if (intention.isNotEmpty) {
                    showDialog(
                      context: context,
                      builder: (dialogContext) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Center(
                              child: YesNoDialog(
                                height: 210.0,
                                title:
                                    'Вы точно хотите полностью удалить работу по данному намерению "$intention"?',
                                yesFunction: () {
                                  Navigator.pop(dialogContext);
                                  WorkMethods.deleteWork(
                                      cnst.AppData.appUser!.currentWorkIndex);

                                  if (onUpdate != null) {
                                    onUpdate!();
                                  }
                                  while (GoRouter.of(context).location != "/") {
                                    GoRouter.of(context).pop(true);
                                  }
                                },
                              ),
                            )
                          ],
                        );
                      },
                    );
                  }
                },
                child: const Icon(
                  Icons.delete_outline,
                  size: 40,
                ),
              ),
          ],
        ));
  }
}
