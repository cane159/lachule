import 'package:flutter/material.dart';
import 'package:lachule/bases/base_colors.dart';
import 'package:lachule/bases/base_sizes.dart';

class DividerWithText extends StatelessWidget {
  const DividerWithText({
    super.key,
    this.title,
    this.thickness = 1,
    this.textStyle,
    this.padding,
  });

  final String? title;
  final double thickness;
  final TextStyle? textStyle;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Expanded(
          child: Divider(
            thickness: thickness,
          ),
        ),
        Padding(
          padding: padding ?? const EdgeInsets.all(22),
          child: Text(
            title ?? '',
            style: textStyle ??
                const TextStyle(
                  fontSize: BaseSizes.fontH5,
                  color: BaseColors.btnDisabledPlaceholder,
                ),
          ),
        ),
        Expanded(
          child: Divider(
            thickness: thickness,
          ),
        ),
      ],
    );
  }
}
