import 'package:flutter/material.dart';
import 'package:lachule/bases/base_colors.dart';
import 'package:lachule/bases/base_sizes.dart';
import 'package:lachule/widgets/button/button_theme_helper.dart';

class PrimaryButtonView extends StatelessWidget {
  const PrimaryButtonView({
    super.key,
    this.title,
    required this.onPressed,
    this.prefixIcon,
    this.suffixIcon,
    this.icon,
    this.isDisable = false,
    this.height = ButtonThemeHelper.normalHeight,
    this.borderSide,
    this.textStyle,
    this.width,
  });
  final String? title;
  final VoidCallback onPressed;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Widget? icon;
  final bool isDisable;
  final double height;
  final BorderSide? borderSide;
  final TextStyle? textStyle;
  final double? width;

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
              foregroundColor: isDisable
                  ? BaseColors.btnDisabledPlaceholder
                  : BaseColors.primaryRed,
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
                  : BaseColors.primaryRed,
              side: borderSide ??
                  BorderSide(
                    color: isDisable
                        ? BaseColors.btnDisabledPlaceholder
                        : BaseColors.primaryRed,
                  ),
              shape: const RoundedRectangleBorder(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                side: BorderSide(
                  color: BaseColors.primaryRed,
                ),
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (prefixIcon != null) ...[
                  prefixIcon!,
                  const SizedBox(width: 8)
                ],
                if (icon != null)
                  icon!
                else
                  Text(
                    title ?? '',
                    style: textStyle ??
                        const TextStyle(
                          fontSize: BaseSizes.fontH4,
                          color: BaseColors.white,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                if (suffixIcon != null) ...[
                  const SizedBox(width: 8),
                  suffixIcon!
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
