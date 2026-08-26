import 'package:flutter/material.dart';
import 'package:metacards/general/const/app_colors.dart';
import 'package:metacards/general/const/app_text_styles.dart';
import 'package:metacards/general/utils/screen_adapt.dart';

import '../../data/constants.dart';

class MessageDialog extends StatelessWidget {
  final Widget? child;
  final String message;
  final double? height;
  final bool showCloseButton;
  const MessageDialog({
    super.key,
    this.child,
    this.message = '',
    this.height,
    this.showCloseButton = true,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    double ratio = size.height / 700;
    ratio = ratio < 0 ? 1 : ratio;
    return AlertDialog(
      insetPadding: EdgeInsets.symmetric(horizontal: 15.0.a),
      backgroundColor: AppColor.buttonColor,
      shape: borderTranspRadius15,
      content: SingleChildScrollView(
        child: SizedBox(
          width: size.width,
          height: (height ?? size.height * 0.5) * ratio,
          child: Stack(
            children: [
              if (showCloseButton)
                Positioned(
                  right: 1.0.a,
                  top: 1,
                  child: InkWell(
                    onTap: () => Navigator.of(context).pop(),
                    child: Icon(Icons.close, size: (30.0 * ratio).a),
                  ),
                ),
              Positioned.fill(
                top: showCloseButton ? 30.0.a : 0,
                child: Align(
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ?child,
                      if (message.isNotEmpty && child != null)
                        const SizedBox(height: 10),
                      if (message.isNotEmpty)
                        Text(
                          message,
                          textAlign: TextAlign.center,
                          style: AppTextStyles.normal16.copyWith(
                            fontSize: AppTextStyles.normal18.fontSize! * ratio,
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
