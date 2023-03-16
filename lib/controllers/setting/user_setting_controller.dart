import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lachule/bases/base_controller.dart';
import 'package:get/get.dart';
import 'package:lachule/models/gender.dart';
import 'package:lachule/models/prefix.dart';
import 'package:lachule/models/user.dart';
import 'package:lachule/routes/app_pages.dart';

class UserSettingController extends BaseController {
  @override
  void onInit() {
    // TODO: implement onInit

    _fromPage.value = Get.arguments;

    _userBirthDate = DateTime.parse(_userData.dateOfBirth);
    userPrefix.value = _userData.prefixId;
    userGender.value = _userData.genderId;
    userFullName.text = _userData.fullName;
    userBirthDate.text =
        '${DateFormat('dd/MM').format(_userBirthDate)}/${_userBirthDate.year + 543}';
    userNationality.text = _userData.nationality;
    userIdCard.text = _userData.idCard;
    userHomePhone.text = _userData.homePhone;
    userPhoneNumber.text = _userData.phoneNumber;
    userLineId.text = _userData.lineId;
    super.onInit();
  }

  final UserModel _userData = UserModel(
    id: '1',
    prefixId: '1',
    genderId: '1',
    fullName: 'ดวงเดือน ลัทธิพงศ์',
    dateOfBirth: '1997-03-01T07:08:03.904654Z',
    nationality: 'ไทย',
    idCard: '123456789XXXX',
    homePhone: '012-123-4567',
    phoneNumber: '095-524-5396',
    lineId: '@LaChule',
    memberCode: 'TEMP003938',
  );

  final _fromPage = ''.obs;
  late DateTime _userBirthDate;
  final RxString userPrefix = ''.obs;
  final RxString userGender = ''.obs;
  TextEditingController userFullName = TextEditingController();
  TextEditingController userBirthDate = TextEditingController();
  TextEditingController userNationality = TextEditingController();
  TextEditingController userIdCard = TextEditingController();
  TextEditingController userHomePhone = TextEditingController();
  TextEditingController userPhoneNumber = TextEditingController();
  TextEditingController userLineId = TextEditingController();
  final isPhoneNumberError = false.obs;

  final RxList<PrefixModel> _prefixList = [
    PrefixModel(
      id: '1',
      name: 'นาย',
    ),
    PrefixModel(
      id: '2',
      name: 'นาง',
    ),
    PrefixModel(
      id: '3',
      name: 'นางสาว',
    ),
    PrefixModel(
      id: '4',
      name: 'ไม่ระบุ',
    ),
  ].obs;

  final RxList<GenderModel> _genderList = [
    GenderModel(
      id: '1',
      name: 'ชาย',
    ),
    GenderModel(
      id: '2',
      name: 'หญิง',
    ),
    GenderModel(
      id: '3',
      name: 'ไม่ระบุ',
    ),
  ].obs;

  // Getter
  UserModel get userData => _userData;
  List<PrefixModel> get prefixList => _prefixList;
  List<GenderModel> get genderList => _genderList;

  void onSelectBottomSheet(String value, RxString toChangeValue) {
    toChangeValue.value = value;
  }

  Future<void> datePicker() async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(DateTime.now().year - 100),
      //DateTime.now() - not to allow to choose before today.
      lastDate: DateTime(DateTime.now().year + 1),
      //locale: const Locale('th', 'TH'),
    );

    if (pickedDate != null) {
      print(pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
      String formattedDate =
          '${DateFormat('dd/MM').format(pickedDate)}/${pickedDate.year + 543}';
      print(
          formattedDate); //formatted date output using intl package =>  2021-03-16
      userBirthDate.text = formattedDate;
    } else {}
  }

  void onPressedSubmit() {
    Get.toNamed(
      AppRoutes.OTP,
      arguments: {
        'page': _fromPage.value,
        'phoneNumber': userPhoneNumber.text,
      },
    );
  }
}
