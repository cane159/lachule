import 'package:flutter/material.dart';
import 'package:lachule/bases/base_colors.dart';

class AppCheckBox extends StatelessWidget {
  const AppCheckBox({
    super.key,
    required this.value,
    this.onChanged,
  });

  final bool value;
  final Function(bool?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 18,
      height: 18,
      child: Checkbox(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
        checkColor: Colors.white,
        fillColor: MaterialStateProperty.all(BaseColors.actived),
        value: value,
        onChanged: onChanged,
      ),
    );
  }
}
