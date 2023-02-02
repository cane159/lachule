import 'package:get/get.dart';
import 'package:lachule/controllers/terms_of_service_controller.dart';

class TermsOfServiceBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TermsOfServiceController());
  }
}
