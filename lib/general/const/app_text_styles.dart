import 'package:flutter/material.dart';
import 'package:metacards/general/utils/screen_adapt.dart';

class AppTextStyles {
  AppTextStyles._();

  static const normal = TextStyle(fontFamily: 'Evolventa', color: Colors.black);
  static final normal8 = normal.copyWith(fontSize: 8.0.t);
  static final normal12 = normal.copyWith(fontSize: 12.0.t);
  static final normal14 = normal.copyWith(fontSize: 14.0.t);
  static final normal16 = normal.copyWith(fontSize: 16.0.t);
  static final normal18 = normal.copyWith(fontSize: 18.0.t);
  static final normal19 = normal.copyWith(fontSize: 19.0.t);
  static final normal21 = normal.copyWith(fontSize: 21.0.t);
  static final title = normal16.copyWith(
      fontWeight: FontWeight.bold, fontSize: ((normal16.fontSize ?? 12) + 6).t);
  static final medium18 = normal18.copyWith(fontWeight: FontWeight.w500);
  static final medium21 = normal21.copyWith(fontWeight: FontWeight.w500);
  static final medium42 =
      normal.copyWith(fontSize: 42.0, fontWeight: FontWeight.w500);
  static final bold21 = normal21.copyWith(fontWeight: FontWeight.bold);
  static final bold14 = normal14.copyWith(fontWeight: FontWeight.bold);
  static final bold18 = normal18.copyWith(fontWeight: FontWeight.bold);
  static final bold16 = normal16.copyWith(fontWeight: FontWeight.bold);
  static final normalLink16 = normal.copyWith(
    fontSize: 16.0.t,
    color: Colors.lightBlue,
    decoration: TextDecoration.underline,
  );
}
