import 'package:flutter/material.dart';

extension ScreenAdaptExtension on num {
  double get a => ScreenAdapt.dp(this);
  double get t => ScreenAdapt.dpText(this);
}

class ScreenAdapt {
  static MediaQueryData? _mediaQuery;
  static double _height = 0;
  static double _width = 0;
  static late Size _designSize;

  ScreenAdapt._();

  static void init(BuildContext context, {Size? designSize}) {
    if (_mediaQuery == null) {
      _mediaQuery = MediaQuery.of(context);
      _height = _mediaQuery!.size.height;
      _width = _mediaQuery!.size.width;
    }
    if (designSize != null) {
      _designSize = designSize;
    } else {
      _designSize = Size(_width, _height);
    }
  }

  static double dp(num value) =>
      (_height * value / _designSize.height).roundToDouble();

  static double dpText(num value) {
    if (_height < 600) return value * 0.8;
    return value.toDouble();
  }

  static double get height => _height;

  static double get width => _width;
}
