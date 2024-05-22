import 'package:flutter/material.dart';
import 'package:metacards/data/constants.dart';
import 'package:metacards/general/const/app_colors.dart';
import 'package:metacards/general/const/app_text_styles.dart';
import 'package:metacards/general/ui/button.dart';
import 'package:metacards/general/utils/screen_adapt.dart';

class YesNoDialog extends StatelessWidget {
  final String title;
  final String message;
  final double? height;
  final String noButtonText;
  final String yesButtonText;
  final TextStyle? noButtonStyle;
  final TextStyle? yesButtonStyle;
  final Function()? yesFunction;
  final Function()? noFunction;
  const YesNoDialog({
    Key? key,
    this.message = '',
    this.height,
    this.title = '',
    this.noButtonText = 'НЕТ',
    this.yesButtonText = 'ДА',
    this.yesFunction,
    this.noFunction,
    this.noButtonStyle,
    this.yesButtonStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    double ratio = size.height / 700;
    ratio = ratio < 0 ? 1 : ratio;
    return AlertDialog(
      insetPadding: const EdgeInsets.symmetric(horizontal: 22.0),
      backgroundColor: AppColor.buttonColor,
      shape: borderTranspRadius15,
      content: SingleChildScrollView(
        child: SizedBox(
          width: size.width,
          height: (height ?? size.height * 0.5) * ratio,
          child: Column(
            children: [
              const Spacer(),
              Column(children: [
                if (title.isNotEmpty)
                  Text(
                    title,
                    textAlign: TextAlign.center,
                    style: AppTextStyles.normal21.copyWith(
                        fontSize: AppTextStyles.normal21.fontSize! * ratio),
                  ),
                if (message.isNotEmpty) const SizedBox(height: 30.0),
                if (message.isNotEmpty)
                  Text(
                    message,
                    textAlign: TextAlign.center,
                    style: AppTextStyles.medium21.copyWith(
                        fontSize: AppTextStyles.medium21.fontSize! * ratio),
                  ),
              ]),
              const Spacer(),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Flexible(
                  flex: 7,
                  child: Button(
                    height: 55.0.a,
                    label: yesButtonText,
                    color: AppColor.greyLight,
                    labelStyle: yesButtonStyle ??
                        AppTextStyles.normal21.copyWith(
                            fontSize: AppTextStyles.normal21.fontSize! * ratio),
                    onTap: yesFunction ?? () => Navigator.pop(context),
                  ),
                ),
                Flexible(child: Container()),
                Flexible(
                  flex: 7,
                  child: Button(
                    height: 55.0.a,
                    withBorder: true,
                    label: noButtonText,
                    color: AppColor.greyLight,
                    labelStyle: noButtonStyle ??
                        AppTextStyles.normal21.copyWith(
                            fontSize: AppTextStyles.normal21.fontSize! * ratio),
                    onTap: noFunction ?? () => Navigator.pop(context),
                  ),
                ),
              ]),
            ],
          ),
        ),
      ),
    );
  }
}
