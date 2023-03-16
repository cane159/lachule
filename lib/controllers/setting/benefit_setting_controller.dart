import 'package:lachule/bases/base_controller.dart';
import 'package:get/get.dart';
import 'package:lachule/models/benefit_setting.dart';

class BenefitSettingController extends BaseController {
  final _benefit = BenefitModel(
    id: '1',
    bankName: 'กสิกรไทย',
    bankBranch: 'พหลโยธิน',
    bookBankType: 'ฝากประจำ',
    bookBankNumber: '123456789XXXX',
    bookBankName: 'ดวงเดือน ลัทธิพงศ์',
  ).obs;

  // Getter
  BenefitModel get benefit => _benefit.value;
}
