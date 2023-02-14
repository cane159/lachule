import 'dart:async';
import 'package:get/get.dart';
import 'package:lachule/bases/base_controller.dart';
import 'package:lachule/routes/app_pages.dart';

class PaymentGatewayController extends BaseController {
  @override
  void onInit() {
    // TODO: implement onInit
    timer();
    super.onInit();
  }

  Future<void> timer() async {
    print('in timer');
    await Future.delayed(const Duration(seconds: 3));
    Get.toNamed(
      AppRoutes.REGISTERSUCCESS,
    );
  }
}
