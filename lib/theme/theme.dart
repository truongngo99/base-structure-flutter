import 'package:base_structure/gen/colors.gen.dart';
import 'package:base_structure/theme/styles.dart';
import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  backgroundColor: Colors.white,
  primaryColor: ColorName.redPrimary,
  textTheme: const TextTheme(
    bodyText1: bodyText1,
    bodyText2: bodyText2,
  ),
  fontFamily: "Noto_Sans_JP",
);

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  backgroundColor: ColorName.greenPrimary,
  primaryColor: ColorName.orangePrimary,
  textTheme: TextTheme(
    bodyText1: bodyText1.copyWith(color: ColorName.redPrimary),
    bodyText2: bodyText2.copyWith(color: ColorName.redPrimary),
  ),
  fontFamily: "Noto_Sans_JP",
);
