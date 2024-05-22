import 'package:flutter/material.dart';
import 'package:metacards/general/const/app_text_styles.dart';
import 'package:metacards/general/utils/screen_adapt.dart';
import 'package:url_launcher/link.dart';

class LinkContactButton extends StatelessWidget {
  final String title;
  final TextStyle? titleStyle;
  final String url;
  final IconData? icon;
  final double? iconSize;
  final Widget? iconWidget;
  const LinkContactButton({
    super.key,
    this.title = '',
    required this.url,
    this.icon,
    this.titleStyle,
    this.iconWidget,
    this.iconSize,
  });

  @override
  Widget build(BuildContext context) {
    return Link(
      uri: Uri.parse(url),
      target: LinkTarget.blank,
      builder: (BuildContext ctx, FollowLink? openLink) {
        return TextButton.icon(
          onPressed: openLink,
          label: Text(
            title,
            style: titleStyle ?? AppTextStyles.normalLink16,
          ),
          icon: iconWidget ??
              Icon(
                icon,
                size: iconSize ?? 30.0.a,
              ),
        );
      },
    );
  }
}
