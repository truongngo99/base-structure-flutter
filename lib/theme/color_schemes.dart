import 'package:base_structure/gen/colors.gen.dart';
import 'package:flutter/material.dart';

const lightColorScheme = ColorScheme(
  brightness: Brightness.light,
  primary: ColorName.greenPrimary,
  onPrimary: ColorName.greenPrimary,
  secondary: ColorName.greenPrimary,
  onSecondary: ColorName.greenPrimary,
  error: ColorName.greenPrimary,
  onError: ColorName.greenPrimary,
  background: ColorName.background,
  onBackground: ColorName.background,
  surface: ColorName.greenPrimary,
  onSurface: ColorName.greenPrimary,
);

const darkColorScheme = ColorScheme(
  brightness: Brightness.dark,
  primary: Color(0xFF6750A4),
  onPrimary: Color(0xFFFFFFFF),
  secondary: Color(0xFF625B71),
  onSecondary: Color(0xFFFFFFFF),
  error: Color(0xFFB3261E),
  onError: Color(0xFFFFFFFF),
  background: ColorName.background,
  onBackground: Color(0xFF1C1B1F),
  surface: Color(0xFFFFFBFE),
  onSurface: Color(0xFF1C1B1F),
);
