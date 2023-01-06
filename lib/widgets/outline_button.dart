import 'package:flutter/material.dart';
import 'package:lachule/bases/base_colors.dart';
import 'package:lachule/bases/base_sizes.dart';
import 'package:lachule/widgets/button_theme_helper.dart';

class OutlinedButtonView extends StatelessWidget {
  const OutlinedButtonView({
    super.key,
    this.title,
    required this.onPressed,
    this.prefixIcon,
    this.suffixIcon,
    this.icon,
    this.isDisable = false,
    this.height = ButtonThemeHelper.normalHeight,
    this.isBorder = true,
    this.borderSide,
    this.textStyle,
    this.width,
    this.backgroundColor,
    this.borderColor,
  });
  final String? title;
  final VoidCallback onPressed;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Widget? icon;
  final bool isDisable;
  final double height;

  final bool isBorder;
  final BorderSide? borderSide;
  final TextStyle? textStyle;
  final double? width;
  final Color? backgroundColor;
  final Color? borderColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: IgnorePointer(
        ignoring: isDisable,
        child: ButtonTheme(
          height: icon == null ? height : 48,
          child: OutlinedButton(
            onPressed: onPressed,
            style: OutlinedButton.styleFrom(
              fixedSize: icon != null ? Size(height, height) : null,
              minimumSize: icon != null ? Size(height, height) : null,
              padding: ButtonThemeHelper.padding(
                height: height,
                icon: icon,
                prefixIcon: prefixIcon,
                suffixIcon: suffixIcon,
              ),
              backgroundColor: isDisable
                  ? BaseColors.btnDisabledPlaceholder
                  : backgroundColor ?? BaseColors.white,
              side: borderSide ??
                  (isBorder
                      ? BorderSide(
                          color: isDisable
                              ? BaseColors.btnDisabledPlaceholder
                              : borderColor ?? BaseColors.primaryRed,
                        )
                      : null),
              shape: isBorder
                  ? const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      side: BorderSide(
                        color: BaseColors.primaryRed,
                      ),
                    )
                  : null,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (prefixIcon != null) ...[
                  prefixIcon!,
                  const SizedBox(width: 4)
                ],
                if (icon != null)
                  FittedBox(
                    fit: BoxFit.cover,
                    child: icon,
                  )
                else
                  Text(
                    title ?? '',
                    style: textStyle ??
                        const TextStyle(
                          fontSize: BaseSizes.fontH4,
                          color: BaseColors.primaryRed,
                        ),
                  ),
                if (suffixIcon != null) ...[
                  const SizedBox(width: 4),
                  suffixIcon!,
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
