import 'package:base_structure/gen/colors.gen.dart';
import 'package:flutter/material.dart';

const lightColorScheme = ColorScheme(
  brightness: Brightness.light,
  primary: ColorName.bluePrimary,
  onPrimary: ColorName.greyPrimary,
  secondary: ColorName.greySecondary,
  onSecondary: ColorName.bluePrimary,
  error: ColorName.redPrimary,
  onError: ColorName.redPrimary,
  background: ColorName.background,
  onBackground: ColorName.background,
  surface: Colors.white,
  onSurface: Colors.white,
);

const darkColorScheme = ColorScheme(
  brightness: Brightness.dark,
  primary: ColorName.bluePrimary,
  onPrimary: ColorName.greyPrimary,
  secondary: ColorName.greySecondary,
  onSecondary: ColorName.bluePrimary,
  error: ColorName.redPrimary,
  onError: ColorName.redPrimary,
  background: ColorName.background,
  onBackground: ColorName.background,
  surface: Colors.white,
  onSurface: Colors.white,
);
