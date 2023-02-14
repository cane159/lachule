import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lachule/bases/base_assets.dart';
import 'package:lachule/bases/base_colors.dart';
import 'package:lachule/bases/base_sizes.dart';
import 'package:lachule/controllers/register/otp_page_controller.dart';
import 'package:lachule/controllers/register/payment_controller.dart';
import 'package:lachule/controllers/register/register_page_view_controller.dart';
import 'package:lachule/routes/app_pages.dart';
import 'package:lachule/widgets/button/primary_button.dart';
import 'package:lachule/widgets/dismissible_keyboard.dart';
import 'package:lachule/widgets/register_app_scaffold.dart';

class PaymentPage extends GetView<PaymentController> {
  const PaymentPage({super.key});

  @override
  Widget build(BuildContext context) {
    controller.setBuildContext(context);
    return DismissibleKeyboard(
      child: Scaffold(
        backgroundColor: BaseColors.white,
        body: Stack(
          children: [
            Image.asset(
              ImageAssets.splashBg,
              fit: BoxFit.fitWidth,
              width: double.infinity,
            ),
            SingleChildScrollView(
              child: SafeArea(
                child: IntrinsicHeight(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Row(
                          children: const [
                            Text(
                              'สมัครสมาชิก',
                              style: TextStyle(
                                color: BaseColors.textPrimary,
                                fontSize: 21,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Container(
                          decoration: const BoxDecoration(
                            color: BaseColors.white,
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(20),
                            ),
                          ),
                          padding: const EdgeInsets.symmetric(
                            vertical: 24,
                            horizontal: 22,
                          ),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  for (int i = 0; i < 8; i++) ...[
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 2),
                                        child: Container(
                                            height: 3,
                                            color: BaseColors.secondaryRed),
                                      ),
                                    ),
                                  ]
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(left: 20),
                        decoration:
                            const BoxDecoration(color: BaseColors.white),
                        child: Row(
                          children: <Widget>[
                            Image.asset(
                              IconAssets.bitcoinCard,
                              width: 20,
                              fit: BoxFit.fitWidth,
                            ),
                            const SizedBox(
                              width: 9,
                            ),
                            const Text(
                              'ชำระค่าสมาชิก',
                              style: TextStyle(
                                color: BaseColors.textPrimary,
                                fontSize: BaseSizes.fontH4,
                              ),
                            )
                          ],
                        ),
                      ),
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            decoration:
                                const BoxDecoration(color: BaseColors.white),
                            padding: const EdgeInsets.only(top: 100.0),
                            child: Image.asset(
                              ImageAssets.fadeOutBg,
                              width: Get.width,
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                          Image.asset(
                            ImageAssets.vipCard,
                            width: 333,
                            fit: BoxFit.fitWidth,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: _bottomNavBar(),
      ),
    );
  }

  Widget _bottomNavBar() {
    return ClipRRect(
      borderRadius: const BorderRadius.vertical(
        top: Radius.circular(20),
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 22,
          vertical: 14,
        ),
        decoration: BoxDecoration(
          color: BaseColors.white,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.04),
              spreadRadius: 8,
              blurRadius: 7,
              offset: const Offset(0, -1),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              decoration: BoxDecoration(
                color: BaseColors.white,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.04),
                    spreadRadius: 8,
                    blurRadius: 7,
                    offset: const Offset(0, -1),
                  ),
                ],
              ),
              padding: const EdgeInsets.all(14.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    'ชำระค่าสมาชิก',
                    style: TextStyle(
                      color: BaseColors.textPrimary,
                      fontSize: BaseSizes.fontBody1,
                    ),
                  ),
                  Text(
                    '฿ 300',
                    style: TextStyle(
                      color: BaseColors.primaryRed,
                      fontSize: 21,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: Row(
                children: [
                  Expanded(
                    child: PrimaryButtonView(
                      onPressed: () =>
                          {Get.toNamed(AppRoutes.REGISTERPAYMENTGATEWAY)},
                      title: 'ชำระค่าสมาชิก',
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
