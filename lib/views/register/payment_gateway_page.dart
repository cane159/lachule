import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lachule/bases/base_colors.dart';
import 'package:lachule/controllers/register/payment_gateway_controller.dart';

class PaymentGatewayPage extends GetView<PaymentGatewayController> {
  const PaymentGatewayPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BaseColors.btnInput,
      appBar: _appBar(),
      body: Center(
        child: Column(
          children: const [
            Text(
              'Payment Gateway 2C2P \n ┐(￣ヘ￣)┌',
              style: TextStyle(fontSize: 40),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  AppBar _appBar() {
    return AppBar(
      leadingWidth: 36,
      elevation: 0,
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.white,
      automaticallyImplyLeading: false,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: const [
          Text(
            'ชำระค่าสมาชิก',
            style: TextStyle(
              color: BaseColors.textPrimary,
              fontSize: 21,
            ),
          ),
        ],
      ),
    );
  }
}
