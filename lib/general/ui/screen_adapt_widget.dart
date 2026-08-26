import 'package:flutter/material.dart';

import '../utils/screen_adapt.dart';

/// !!! for portrait orientation only !!!
class ScreenAdaptation extends StatelessWidget {
  final Widget child;
  final Size? designSize;

  const ScreenAdaptation({
    required this.child,
    this.designSize,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    ScreenAdapt.init(
      context,
      designSize: designSize,
    );
    return child;
  }
}
