import 'package:flutter/material.dart';
import 'package:metacards/general/const/app_colors.dart';
import 'package:metacards/general/utils/screen_adapt.dart';

class Button extends StatelessWidget {
  final TextStyle? labelStyle;
  final BorderRadius? borderRadius;
  final VoidCallback? onTap;
  final Widget? child;
  final Widget? icon;
  final String label;
  final Color? color;
  final bool withBorder;
  final bool withShadow;
  final double verticalPadding;
  final double horizontalPadding;
  final double? width;
  final double height;

  const Button({
    Key? key,
    this.label = '',
    this.labelStyle,
    this.color,
    this.borderRadius,
    this.icon,
    this.child,
    this.withBorder = false,
    this.withShadow = false,
    this.onTap,
    this.verticalPadding = 9,
    this.horizontalPadding = 15.0,
    this.width,
    this.height = 60,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bRadius = borderRadius ?? BorderRadius.circular(15.0);
    final currentColor = color;
    return Material(
      color: currentColor,
      borderRadius: bRadius,
      shadowColor: withShadow ? AppColor.greyLight : null,
      elevation: withShadow ? 5 : 0,
      child: InkWell(
        onTap: onTap,
        highlightColor: currentColor?.withOpacity(0.2) ?? AppColor.buttonColor,
        borderRadius: bRadius,
        hoverColor: AppColor.greyLight,
        child: Container(
          width: width ??
              MediaQuery.of(context).size.width - horizontalPadding * 3,
          height: height,
          padding: EdgeInsets.symmetric(
            horizontal: horizontalPadding,
            vertical: verticalPadding,
          ),
          decoration: BoxDecoration(
              border: withBorder
                  ? Border.all(color: AppColor.greyLight, width: 2.0)
                  : null,
              borderRadius: bRadius),
          child: Row(
            mainAxisAlignment: icon == null
                ? MainAxisAlignment.center
                : MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              if (icon != null)
                Flexible(
                  child: Padding(
                    padding: EdgeInsets.only(
                        right: label.isNotEmpty ? 14.0.a : 0, left: 6.0.a),
                    child: icon,
                  ),
                ),
              Flexible(
                flex: 4,
                child: child ??
                    Text(
                      label,
                      overflow: TextOverflow.ellipsis,
                      style: labelStyle,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
