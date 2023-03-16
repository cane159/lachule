import 'package:get/get.dart';
import 'package:lachule/controllers/transport_detail_controller.dart';

class TransportDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TransportDetailController());
  }
}
