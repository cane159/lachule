import 'package:get/get.dart';
import 'package:lachule/controllers/register/register_page_view_controller.dart';
import 'package:lachule/models/bank.dart';
import 'package:lachule/models/bank_account_type.dart';

class BenefitInformationController extends RegisterPageViewController {
  final RxList<BankModel> _bankList = [
    BankModel(
      id: '1',
      name: 'ธนาคาร 1',
    ),
    BankModel(
      id: '2',
      name: 'ธนาคาร 2',
    ),
    BankModel(
      id: '3',
      name: 'ธนาคาร 3',
    ),
    BankModel(
      id: '4',
      name: 'ธนาคาร 4',
    ),
  ].obs;

  final RxList<BankAccountTypeModel> _bankAccountTypeList = [
    BankAccountTypeModel(
      id: '1',
      name: 'ประเภท 1',
    ),
    BankAccountTypeModel(
      id: '2',
      name: 'ประเภท 2',
    ),
    BankAccountTypeModel(
      id: '3',
      name: 'ประเภท 3',
    ),
  ].obs;

  // Getter
  List<BankModel> get bankList => _bankList;
  List<BankAccountTypeModel> get bankAccountTypeList => _bankAccountTypeList;
}
