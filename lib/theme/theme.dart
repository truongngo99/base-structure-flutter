import 'package:base_structure/gen/colors.gen.dart';
import 'package:base_structure/theme/color_schemes.dart';
import 'package:base_structure/theme/styles.dart';
import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  colorScheme: lightColorScheme,
  useMaterial3: true,
  textTheme: const TextTheme(
      bodyLarge: bodyText1, bodyMedium: bodyText2, headlineMedium: headline4),
  fontFamily: "Noto_Sans_JP",
);

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  colorScheme: darkColorScheme,
  textTheme: TextTheme(
      bodyLarge: bodyText1.copyWith(color: ColorName.redPrimary),
      bodyMedium: bodyText2.copyWith(color: ColorName.redPrimary),
      headlineMedium: headline4),
  fontFamily: "Noto_Sans_JP",
);
