import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lachule/bases/base_assets.dart';
import 'package:lachule/bases/base_colors.dart';
import 'package:lachule/widgets/button/outline_button.dart';
import 'package:lachule/widgets/button/primary_button.dart';

class AlertView extends StatelessWidget {
  const AlertView({
    Key? key,
    this.title,
    this.titleStyle,
    this.onPressedOutline,
    this.buttonTextOutline,
    this.buttonTextStyleOutline,
    this.onPressedPrimary,
    this.buttonTextPrimary,
    this.buttonTextStylePrimary,
    this.icon,
  }) : super(key: key);

  final String? title;
  final TextStyle? titleStyle;
  final Function()? onPressedOutline;
  final String? buttonTextOutline;
  final TextStyle? buttonTextStyleOutline;
  final Function()? onPressedPrimary;
  final String? buttonTextPrimary;
  final TextStyle? buttonTextStylePrimary;
  final Widget? icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      mainAxisSize: MainAxisSize.min,
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.vertical(
            top: Radius.circular(20),
          ),
          child: Container(
            padding: const EdgeInsets.fromLTRB(23, 45, 23, 50),
            width: double.infinity,
            decoration: const BoxDecoration(
              color: BaseColors.white,
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(20),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                icon ??
                    Image.asset(
                      IconAssets.check,
                      width: 40,
                      fit: BoxFit.fitWidth,
                    ),
                const SizedBox(
                  height: 30,
                ),
                Text(
                  title ?? '',
                  style: titleStyle ??
                      const TextStyle(
                        color: BaseColors.textPrimary,
                        fontSize: 21,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(
                  height: 40,
                ),
                if (onPressedPrimary != null) ...[
                  SizedBox(
                    width: double.infinity,
                    child: PrimaryButtonView(
                      onPressed: onPressedPrimary!,
                      title: buttonTextPrimary,
                      textStyle: buttonTextStylePrimary,
                    ),
                  ),
                ],
                if (onPressedPrimary != null && onPressedOutline != null) ...[
                  const SizedBox(
                    height: 10,
                  ),
                ],
                if (onPressedOutline != null) ...[
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButtonView(
                      onPressed: onPressedOutline!,
                      borderColor: BaseColors.borderColor,
                      title: buttonTextOutline,
                      textStyle: buttonTextStyleOutline,
                    ),
                  ),
                ]
              ],
            ),
          ),
        )
      ],
    );
  }
}
