import 'package:flutter/material.dart';
import 'package:metacards/general/const/app_colors.dart';
import 'package:metacards/general/const/app_text_styles.dart';
import 'package:metacards/general/utils/screen_adapt.dart';

class ExpancionMenuItem extends StatelessWidget {
  final String title;
  final TextStyle? titleTextStyle;
  final Widget? leading;
  final Widget? trailing;
  final String? subtitle;
  final double? height;
  final List<Widget>? children;
  const ExpancionMenuItem(
      {super.key,
      required this.title,
      this.leading,
      this.subtitle,
      this.height,
      this.trailing,
      this.children,
      this.titleTextStyle});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5.0.a),
      child: ExpansionTile(
        leading: leading,
        trailing: trailing,
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
        backgroundColor: AppColor.buttonColor,
        collapsedBackgroundColor: AppColor.buttonColor,
        textColor: Colors.black,
        iconColor: Colors.black,
        children: children ?? [],
      ),
    );
  }
}
