import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lachule/controllers/transport_controller.dart';
import 'package:lachule/widgets/dismissible_keyboard.dart';

class TranSportPage extends GetView<TransportController> {
  const TranSportPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DismissibleKeyboard(
      child: Scaffold(),
    );
  }
}
