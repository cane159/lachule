import 'package:get/get.dart';
import 'package:lachule/controllers/transport_controller.dart';

class TranSportBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TransportController());
  }
}
