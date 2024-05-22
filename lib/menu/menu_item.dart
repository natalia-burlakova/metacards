import 'package:flutter/material.dart';
import 'package:metacards/general/const/app_colors.dart';
import 'package:metacards/general/const/app_text_styles.dart';
import 'package:metacards/general/utils/screen_adapt.dart';

class MenuItem extends StatelessWidget {
  final void Function() navigation;
  final String title;
  final Widget? leading;
  final Widget? trailing;
  final String? subtitle;
  final double? height;
  final EdgeInsetsGeometry? contentPadding;
  final TextStyle? titleTextStyle;
  const MenuItem(
      {super.key,
      required this.navigation,
      required this.title,
      this.leading,
      this.subtitle,
      this.height,
      this.trailing,
      this.contentPadding,
      this.titleTextStyle});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:  EdgeInsets.symmetric(vertical: 5.0.a),
      height: height ?? 55.0.a,
      child: ListTile(
        leading: leading,
        horizontalTitleGap: 0,
        trailing: trailing,
        contentPadding: leading == null ? contentPadding : EdgeInsets.zero,
        title: Text(
          title,
          style: titleTextStyle ?? AppTextStyles.normal16,
          textAlign: TextAlign.center,
        ),
        subtitle: subtitle == null
            ? null
            : Text(
                subtitle!,
                style: AppTextStyles.normal14,
                textAlign: TextAlign.center,
              ),
        tileColor: AppColor.buttonColor,
        onTap: () {
          Navigator.pop(context);
          navigation();
        },
      ),
    );
  }
}
