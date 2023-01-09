import 'package:flutter/material.dart';
import 'package:lachule/bases/base_colors.dart';

class BackGround extends StatelessWidget {
  const BackGround({
    super.key,
    this.color,
  });

  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: color ?? BaseColors.white,
    );
  }
}
