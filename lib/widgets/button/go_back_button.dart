import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lachule/bases/base_colors.dart';

class GoBackbutton extends StatelessWidget {
  const GoBackbutton({super.key, this.onPressed});

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      style: IconButton.styleFrom(
        padding: EdgeInsets.zero,
        elevation: 0,
      ),
      onPressed: onPressed ?? () => Get.back(),
      icon: const Icon(Icons.arrow_back_ios_new_rounded),
      color: BaseColors.textPrimary,
    );
  }
}
