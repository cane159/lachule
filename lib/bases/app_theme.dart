import 'package:flutter/material.dart';
import 'package:lachule/bases/base_colors.dart';
import 'package:lachule/bases/base_sizes.dart';

ThemeData appTheme = ThemeData(
  backgroundColor: Colors.transparent,
  textTheme: textTheme,
  fontFamily: 'NotoSansThai',
);

TextTheme textTheme = const TextTheme(
  headline1: TextStyle(
    fontSize: BaseSizes.fontH1,
    fontWeight: FontWeight.bold,
    color: BaseColors.textPrimary,
  ),
  headline2: TextStyle(
    fontSize: BaseSizes.fontH2,
    fontWeight: FontWeight.bold,
    color: BaseColors.textPrimary,
  ),
  headline3: TextStyle(
    fontSize: BaseSizes.fontH3,
    fontWeight: FontWeight.bold,
    color: BaseColors.textPrimary,
  ),
  headline4: TextStyle(
    fontSize: BaseSizes.fontH4,
    fontWeight: FontWeight.bold,
    color: BaseColors.textPrimary,
  ),
  headline5: TextStyle(
    fontSize: BaseSizes.fontH5,
    fontWeight: FontWeight.bold,
    color: BaseColors.textPrimary,
  ),
  bodyText1: TextStyle(
    fontSize: BaseSizes.fontBody1,
    fontWeight: FontWeight.w500,
    color: BaseColors.textPrimary,
  ),
  bodyText2: TextStyle(
    fontSize: BaseSizes.fontBody2,
    fontWeight: FontWeight.w500,
    color: BaseColors.textPrimary,
  ),
);
