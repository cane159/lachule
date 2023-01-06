import 'package:flutter/material.dart';

class ButtonThemeHelper {
  static const double smallHeight = 30;
  static const double normalHeight = 50;
  static bool isSmall(double height) => height == smallHeight;
  static EdgeInsets padding({
    required double height,
    Widget? icon,
    Widget? prefixIcon,
    Widget? suffixIcon,
  }) {
    if (isSmall(height)) {
      if (icon != null) {
        return const EdgeInsets.all(8);
      } else if (prefixIcon != null || suffixIcon != null) {
        return const EdgeInsets.symmetric(vertical: 4, horizontal: 8);
      } else {
        return const EdgeInsets.symmetric(vertical: 4, horizontal: 8);
      }
    } else {
      if (icon != null) {
        return const EdgeInsets.all(12);
      } else if (prefixIcon != null || suffixIcon != null) {
        return const EdgeInsets.symmetric(vertical: 13, horizontal: 16);
      } else {
        return const EdgeInsets.symmetric(vertical: 10.5, horizontal: 36);
      }
    }
  }
}
