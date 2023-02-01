import 'package:base_structure/theme/color_schemes.dart';
import 'package:base_structure/theme/styles.dart';
import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  colorScheme: lightColorScheme,
  useMaterial3: true,
  appBarTheme: const AppBarTheme(backgroundColor: Colors.white),
  textTheme: const TextTheme(
      headlineLarge: headlineLarge,
      headlineSmall: headLineSmall,
      bodyLarge: bodyLarge,
      titleSmall: titleSmall,
      bodyMedium: bodyMedium,
      headlineMedium: headlineMedium),
  fontFamily: "Noto_Sans_JP",
);

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  colorScheme: darkColorScheme,
  useMaterial3: true,
  appBarTheme: const AppBarTheme(backgroundColor: Colors.white),
  textTheme: const TextTheme(
      headlineLarge: headlineLarge,
      headlineSmall: headLineSmall,
      bodyMedium: bodyMedium,
      bodyLarge: bodyLarge,
      titleSmall: titleSmall,
      headlineMedium: headlineMedium),
  fontFamily: "Noto_Sans_JP",
);
