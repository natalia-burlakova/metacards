import 'package:flutter/material.dart';
import 'package:metacards/data/constants.dart' as cnst;
import 'package:metacards/general/const/app_colors.dart';
import 'package:metacards/general/const/app_text_styles.dart';
import 'package:metacards/general/utils/screen_adapt.dart';

class WorkItem extends StatelessWidget {
  final int index;
  final Function onDelete;
  final Function onTap;
  const WorkItem(
      {super.key, this.index = 0, required this.onDelete, required this.onTap});

  @override
  Widget build(BuildContext context) {
    if (index < cnst.AppData.appUser!.works.length) {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: 5.a, vertical: 2.0.a),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 5.0.a),
          color: AppColor.buttonColor,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${index + 1}. ',
                style: AppTextStyles.normal18,
              ),
              InkWell(
                onTap: () {
                  onTap();
                },
                child: Expanded(
                  child: Text(
                    cnst.AppData.appUser!.works[index].intention,
                    style: AppTextStyles.normal18,
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  onDelete();
                },
                child: Icon(
                  Icons.delete_outline,
                  size: 40.a,
                ),
              ),
            ],
          ),
        ),
      );
    } else {
      return const SizedBox.shrink();
    }
  }
}
