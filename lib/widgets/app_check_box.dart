import 'package:flutter/material.dart';
import 'package:lachule/bases/base_colors.dart';

class AppCheckBox extends StatelessWidget {
  const AppCheckBox({
    super.key,
    required this.value,
    this.onChanged,
    this.checkColor,
    this.fillColor,
  });

  final bool value;
  final Function(bool?)? onChanged;
  final Color? checkColor;
  final MaterialStateProperty<Color?>? fillColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 18,
      height: 18,
      child: Checkbox(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
        checkColor: checkColor ?? Colors.white,
        fillColor: fillColor ?? MaterialStateProperty.all(BaseColors.actived),
        value: value,
        onChanged: onChanged,
      ),
    );
  }
}
