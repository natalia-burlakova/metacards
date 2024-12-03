import 'package:flutter/material.dart';
import 'package:metacards/data/constants.dart' as cnst;
import 'package:metacards/general/const/app_colors.dart';
import 'package:metacards/general/const/app_text_styles.dart';
import 'package:metacards/general/ui/page_general.dart';
import 'package:metacards/general/utils/screen_adapt.dart';
import 'package:metacards/menu/pages/work_item.dart';

class WorkList extends StatefulWidget {
  const WorkList({super.key});

  @override
  State<WorkList> createState() => _WorkListState();
}

class _WorkListState extends State<WorkList> {
  @override
  Widget build(BuildContext context) {
    return PageGeneral(
        title: 'Сохраненные работы',
        canBack: true,
        body: (cnst.AppData.appUser?.works.isEmpty ?? true)
            ? Center(
                child: Container(
                    padding: EdgeInsets.all(10.0.a),
                    color: AppColor.buttonColor,
                    child: Text(
                      'Сохраненных работ не найдено.',
                      textAlign: TextAlign.center,
                      style: AppTextStyles.medium42,
                    )),
              )
            : Padding(
                padding: EdgeInsets.all(5.0.a),
                child: Column(
                  children: List.generate(
                    cnst.AppData.appUser!.works.length,
                    (index) => WorkItem(
                        index: index,
                        onTap: (){
                          showDialog(
                              context: context,
                              builder: (dialogContext) {
                                return cnst.AppData.workMethods!
                                    .getWorkDeleteDialog(
                                  dialogContext,
                                  index,
                                  () {
                                    Navigator.pop(dialogContext);
                                    setState(() {});
                                  },
                                );
                              });
                        },
                        onDelete: () {
                          showDialog(
                              context: context,
                              builder: (dialogContext) {
                                return cnst.AppData.workMethods!
                                    .getWorkDeleteDialog(
                                  dialogContext,
                                  index,
                                  () {
                                    Navigator.pop(dialogContext);
                                    setState(() {});
                                  },
                                );
                              });
                        }),
                  ),
                ),
              ));
  }
}
