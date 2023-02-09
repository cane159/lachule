import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:lachule/bases/base_controller.dart';
import 'package:lachule/models/district.dart';
import 'package:lachule/models/province.dart';
import 'package:lachule/models/sub_district.dart';

class RegisterPageViewController extends BaseController {
  // Register page view variable
  final PageController pageController = PageController();
  final _currentIndex = 0.obs;
  final RxList<ProvinceModel> _provinceList = [
    ProvinceModel(
      id: '1',
      name: 'A',
    ),
    ProvinceModel(
      id: '2',
      name: 'B',
    ),
    ProvinceModel(
      id: '3',
      name: 'C',
    ),
    ProvinceModel(
      id: '4',
      name: 'D',
    ),
  ].obs;
  final RxList<DistrictModel> _districtList = [
    DistrictModel(
      id: '1',
      name: 'a',
      provinceId: '1',
    ),
    DistrictModel(
      id: '2',
      name: 'b',
      provinceId: '2',
    ),
    DistrictModel(
      id: '3',
      name: 'c',
      provinceId: '3',
    ),
    DistrictModel(
      id: '4',
      name: 'd',
      provinceId: '4',
    ),
    DistrictModel(
      id: '5',
      name: 'aa',
      provinceId: '1',
    ),
    DistrictModel(
      id: '6',
      name: 'bb',
      provinceId: '2',
    ),
    DistrictModel(
      id: '7',
      name: 'cc',
      provinceId: '3',
    ),
    DistrictModel(
      id: '8',
      name: 'dd',
      provinceId: '4',
    ),
  ].obs;
  final RxList<SubDistrictModel> _subDistrictList = [
    SubDistrictModel(
      id: '1',
      name: 'เอ',
      districeId: '1',
      zipCode: '11111',
    ),
    SubDistrictModel(
      id: '2',
      name: 'บี',
      districeId: '2',
      zipCode: '22222',
    ),
    SubDistrictModel(
      id: '3',
      name: 'ซี',
      districeId: '3',
      zipCode: '33333',
    ),
    SubDistrictModel(
      id: '4',
      name: 'ดี',
      districeId: '4',
      zipCode: '44444',
    ),
    SubDistrictModel(
      id: '5',
      name: 'เอเอ',
      districeId: '1',
      zipCode: '55555',
    ),
    SubDistrictModel(
      id: '6',
      name: 'บีบี',
      districeId: '2',
      zipCode: '66666',
    ),
    SubDistrictModel(
      id: '7',
      name: 'ซีซี',
      districeId: '3',
      zipCode: '77777',
    ),
    SubDistrictModel(
      id: '8',
      name: 'ดีดี',
      districeId: '4',
      zipCode: '88888',
    ),
  ].obs;

  // Business information page varaible
  final isReferralCode = false.obs;
  TextEditingController referralCode = TextEditingController();
  TextEditingController referralName = TextEditingController();

  // Applicate information variable
  final RxString userPrefix = ''.obs;
  final RxString userGender = ''.obs;
  TextEditingController userFullName = TextEditingController();
  TextEditingController userBirthDate = TextEditingController();
  TextEditingController userNationality = TextEditingController();
  TextEditingController userIdCard = TextEditingController();
  TextEditingController userHomePhone = TextEditingController();
  TextEditingController userPhoneNumber = TextEditingController();
  TextEditingController userLineId = TextEditingController();

  // Benefit information variable
  final RxString userBank = ''.obs;
  final RxString userBankAccountType = ''.obs;
  TextEditingController userBankBranch = TextEditingController();
  TextEditingController userBankAccountNumber = TextEditingController();
  TextEditingController userBankAccountName = TextEditingController();

  // House address variable
  final RxString userHouseProvince = ''.obs;
  final RxString userHouseDistrict = ''.obs;
  final RxString userHouseSubDistrict = ''.obs;
  TextEditingController userHouseNumber = TextEditingController();
  TextEditingController userHouseVillageOrProject = TextEditingController();
  TextEditingController userHouseAlley = TextEditingController();
  TextEditingController userHouseZipCode = TextEditingController();

  // Register page view getter
  int get currentIndex => _currentIndex.value;
  List<ProvinceModel> get provinceList => _provinceList;
  List<DistrictModel> get districtList => _districtList;
  List<SubDistrictModel> get subDistrictList => _subDistrictList;

  void onTapped(int index, PageController pageViewController) {
    _currentIndex.value = index;
    pageViewController.jumpToPage(index);
  }

  onSelectBottomSheet(String value, RxString toChangeValue) {
    toChangeValue.value = value;
  }

  datePicker() async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(DateTime.now().year - 100),
      //DateTime.now() - not to allow to choose before today.
      lastDate: DateTime(DateTime.now().year + 1),
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
}
