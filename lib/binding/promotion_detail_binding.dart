import 'package:get/get.dart';
import 'package:lachule/controllers/promotion_detail_controller.dart';

class PromotionDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PromotionDetailController());
  }
}
