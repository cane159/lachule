import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:lachule/bases/base_controller.dart';
import 'package:lachule/models/bank.dart';
import 'package:lachule/models/bank_account_type.dart';
import 'package:lachule/models/district.dart';
import 'package:lachule/models/gender.dart';
import 'package:lachule/models/prefix.dart';
import 'package:lachule/models/province.dart';
import 'package:lachule/models/sub_district.dart';
import 'package:lachule/routes/app_pages.dart';

class RegisterPageViewController extends BaseController {
  // Register page view variable
  final _imagePicker = ImagePicker();
  final PageController pageController = PageController();
  final _currentIndex = 0.obs;
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
  List<PrefixModel> get prefixList => _prefixList;
  List<GenderModel> get genderList => _genderList;
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
  final isReferralCodeError = false.obs;
  final isReferralCode = false.obs;
  TextEditingController referralCode = TextEditingController();
  TextEditingController referralName = TextEditingController();

  // Applicate information variable
  final RxString userPrefix = ''.obs;
  final RxString userGender = ''.obs;
  final isUserprefix = false.obs;
  final isUserGender = false.obs;
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

  // User address variable
  final isHourseAddress = false.obs;
  final RxString userProvince = ''.obs;
  final RxString userDistrict = ''.obs;
  final RxString userSubDistrict = ''.obs;
  TextEditingController userLiveHouseNumber = TextEditingController();
  TextEditingController userVillageOrProject = TextEditingController();
  TextEditingController userAlley = TextEditingController();
  TextEditingController userZipCode = TextEditingController();

  // Document variable
  XFile? idCardImage;
  final RxString idCardImagePath = ''.obs;
  XFile? bookBankImage;
  final RxString bookBankImagePath = ''.obs;

  // Register page view getter
  int get currentIndex => _currentIndex.value;
  List<ProvinceModel> get provinceList => _provinceList;
  List<DistrictModel> get districtList => _districtList;
  List<SubDistrictModel> get subDistrictList => _subDistrictList;

  void onTapped(int index, PageController pageViewController) {
    if (userPrefix.value == '') {
      isUserprefix.value = true;
    }
    if (userGender.value == '') {
      isUserGender.value = true;
    } else {
      isUserprefix.value = false;
      isUserGender.value = false;
      _currentIndex.value = index;
      pageViewController.jumpToPage(index);
    }
  }

  void onTappedDocumentPage() {
    Get.toNamed(AppRoutes.REGISTEROTP);
  }

  void pressReferralCode(bool value) {
    isReferralCode.value = value;
    if (value == true) {
      referralCode.value = const TextEditingValue(text: '1234');
    }
  }

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

  void pressUserAddress(bool value) {
    isHourseAddress.value = value;
    if (value == true) {
      userProvince.value = userHouseProvince.value;
      userDistrict.value = userHouseDistrict.value;
      userSubDistrict.value = userHouseSubDistrict.value;
      userLiveHouseNumber.text = userHouseNumber.text;
      userVillageOrProject.text = userHouseVillageOrProject.text;
      userAlley.text = userHouseAlley.text;
      userZipCode.text = userHouseZipCode.text;
    }
    if (value == false) {
      userProvince.value = '';
      userDistrict.value = '';
      userSubDistrict.value = '';
      userLiveHouseNumber.text = '';
      userVillageOrProject.text = '';
      userAlley.text = '';
      userZipCode.text = '';
    }
  }

  static String getFileSizeString({required int bytes, int decimals = 0}) {
    if (bytes <= 0) return "0 Bytes";
    const suffixes = [" Bytes", " KB", " MB", " GB", " TB"];
    var i = (log(bytes) / log(1024)).floor();
    return ((bytes / pow(1024, i)).toStringAsFixed(decimals)) + suffixes[i];
  }

  Future<void> getImageIdCardFromGallery() async {
    final pickedFile = await _imagePicker.pickImage(
      source: ImageSource.gallery,
    );
    if (pickedFile != null) {
      idCardImage = pickedFile;
      idCardImagePath.value = pickedFile.path;
      Get.back();
      print(pickedFile.path);
    } else {}
  }

  Future<void> getImageIdCardFromCamera() async {
    final pickedFile = await _imagePicker.pickImage(
      source: ImageSource.camera,
    );
    if (pickedFile != null) {
      idCardImage = pickedFile;
      idCardImagePath.value = pickedFile.path;
      Get.back();
      print(pickedFile.path);
    } else {}
  }

  Future<void> getImageBookBankFromGallery() async {
    final pickedFile = await _imagePicker.pickImage(
      source: ImageSource.gallery,
    );
    if (pickedFile != null) {
      bookBankImage = pickedFile;
      bookBankImagePath.value = pickedFile.path;
      Get.back();
      print(pickedFile.path);
    } else {}
  }

  Future<void> getImageBookBankFromCamera() async {
    final pickedFile = await _imagePicker.pickImage(
      source: ImageSource.camera,
    );
    if (pickedFile != null) {
      bookBankImage = pickedFile;
      bookBankImagePath.value = pickedFile.path;
      Get.back();
      print(pickedFile.path);
    } else {}
  }
}
