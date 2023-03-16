import 'package:flutter/material.dart';
import 'package:lachule/bases/base_colors.dart';
import 'package:lachule/bases/base_controller.dart';
import 'package:get/get.dart';
import 'package:lachule/bases/base_sizes.dart';
import 'package:lachule/models/address_setting.dart';
import 'package:lachule/models/district.dart';
import 'package:lachule/models/province.dart';
import 'package:lachule/models/sub_district.dart';
import 'package:lachule/models/user.dart';
import 'package:lachule/widgets/aleart/alert.dart';

class UserAddressEditController extends BaseController {
  @override
  void onInit() {
    _addressId.value = Get.arguments['addressId'];
    _fromPage.value = Get.arguments['page'];
    _findIndex.value =
        _userAddress.indexWhere((element) => element.id == _addressId.value);
    province.value = _userAddress[_findIndex.value].provinceId;
    district.value = _userAddress[_findIndex.value].districtId;
    subDistrict.value = _userAddress[_findIndex.value].subDistrictId;
    houseNumber.text = _userAddress[_findIndex.value].houseNumber;
    village.text = _userAddress[_findIndex.value].village;
    alley.text = _userAddress[_findIndex.value].alley;
    zipCode.text = _userAddress[_findIndex.value].zipCode;
    _isMain.value = _userAddress[_findIndex.value].isMain;
    super.onInit();
  }

  // TODO : should be on SharedPreferences
  final List<AddressSettingModel> _userAddress = [
    AddressSettingModel(
      id: '1',
      houseNumber: '888',
      village: '',
      alley: 'ถ. รัชดาภิเษก',
      provinceId: '1',
      districtId: '1',
      subDistrictId: '1',
      zipCode: '33333',
      isMain: true,
    ),
    AddressSettingModel(
      id: '2',
      houseNumber: '8',
      village: 'อาคารทีวัน ชั้น 10',
      alley: 'สุขุมวิท 40 ถนนสุขุมวิท',
      provinceId: '1',
      districtId: '2',
      subDistrictId: '2',
      zipCode: '33333',
      isMain: false,
    ),
    AddressSettingModel(
      id: '1',
      houseNumber: '888',
      village: '',
      alley: '-',
      provinceId: '1',
      districtId: '3',
      subDistrictId: '3',
      zipCode: '33333',
      isMain: false,
    ),
  ];

  // TODO : Do not forget to remove this
  final RxList<ProvinceModel> _provinceList = [
    ProvinceModel(
      id: '1',
      name: 'กรุงเทพมหานคร',
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
      name: 'ดินแดง',
      provinceId: '1',
    ),
    DistrictModel(
      id: '2',
      name: 'คลองเตย',
      provinceId: '1',
    ),
    DistrictModel(
      id: '3',
      name: 'ลำลูกกา',
      provinceId: '1',
    ),
    DistrictModel(
      id: '4',
      name: 'd',
      provinceId: '1',
    ),
    DistrictModel(
      id: '5',
      name: 'aa',
      provinceId: '1',
    ),
    DistrictModel(
      id: '6',
      name: 'bb',
      provinceId: '1',
    ),
    DistrictModel(
      id: '7',
      name: 'cc',
      provinceId: '1',
    ),
    DistrictModel(
      id: '8',
      name: 'dd',
      provinceId: '1',
    ),
  ].obs;
  final RxList<SubDistrictModel> _subDistrictList = [
    SubDistrictModel(
      id: '1',
      name: 'ดินแดง',
      districeId: '1',
      zipCode: '10400',
    ),
    SubDistrictModel(
      id: '2',
      name: 'พระโขนง',
      districeId: '2',
      zipCode: '10110',
    ),
    SubDistrictModel(
      id: '3',
      name: 'คูคต',
      districeId: '3',
      zipCode: '12130',
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
  // TODO : To here

  final _fromPage = ''.obs;
  final _addressId = ''.obs;
  final RxInt _findIndex = 0.obs;
  final _isMain = false.obs;
  final RxString province = ''.obs;
  final RxString district = ''.obs;
  final RxString subDistrict = ''.obs;
  TextEditingController houseNumber = TextEditingController();
  TextEditingController village = TextEditingController();
  TextEditingController alley = TextEditingController();
  TextEditingController zipCode = TextEditingController();
  final _switchValue = false.obs;

  // Getter
  String get addressId => _addressId.value;
  List<AddressSettingModel> get userAddress => _userAddress;
  List<ProvinceModel> get provinceList => _provinceList;
  List<DistrictModel> get districtList => _districtList;
  List<SubDistrictModel> get subDistrictList => _subDistrictList;
  bool get isMain => _isMain.value;
  bool get switchValue => _switchValue.value;

  void onSelectBottomSheet(String value, RxString toChangeValue) {
    toChangeValue.value = value;
  }

  void onPressedSwitch(bool value) {
    _switchValue.value = value;
  }

  void onPressedSubmit() {
    Get.back();
    Get.bottomSheet(
      AlertView(
        onPressedOutline: () => {
          Get.back(),
        },
        buttonTextOutline: 'รับทราบ',
        buttonTextStyleOutline: const TextStyle(
          color: BaseColors.textPrimary,
          fontSize: BaseSizes.fontH4,
        ),
        title: 'แก้ไขข้อมูลเรียบร้อยแล้ว',
        titleStyle: const TextStyle(
          color: BaseColors.textPrimary,
          fontSize: 21,
        ),
      ),
    );
  }
}
