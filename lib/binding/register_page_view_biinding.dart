import 'package:get/get.dart';
import 'package:lachule/controllers/register/applicant_information_controller.dart';
import 'package:lachule/controllers/register/business_information_controller.dart';
import 'package:lachule/controllers/register/register_page_view_controller.dart';

class RegisterPageViewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RegisterPageViewController());
    Get.lazyPut(() => BusinessInformationController());
    Get.lazyPut(() => ApplicantInformationController());
  }
}
