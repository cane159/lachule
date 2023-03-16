
import 'package:intl/intl.dart';
import 'package:lachule/bases/base_controller.dart';
import 'package:get/get.dart';
import 'package:lachule/models/address_setting.dart';
import 'package:lachule/models/benefit_setting.dart';
import 'package:lachule/models/district.dart';
import 'package:lachule/models/province.dart';
import 'package:lachule/models/sub_district.dart';
import 'package:lachule/models/user.dart';

class ProfileController extends BaseController {
  @override
  void onInit() {
    // TODO: implement onInit
    _userProfile.value = UserModel(
      id: '1',
      prefixId: '1',
      genderId: '1',
      fullName: 'ดวงเดือน ลัทธิพงศ์',
      dateOfBirth: '1997-09-03T07:08:03.904654Z',
      nationality: 'ไทย',
      idCard: '123456789XXXX',
      homePhone: '012-123-4567',
      phoneNumber: '095-524-5396',
      lineId: '@LaChule',
      memberCode: 'TEMP003938',
    );
    _userBenefit.value = BenefitModel(
      id: '1',
      bankName: 'กสิกรไทย',
      bankBranch: 'พหลโยธิน',
      bookBankType: 'ฝากประจำ',
      bookBankNumber: '123456789XXXX',
      bookBankName: 'ดวงเดือน ลัทธิพงศ์',
    );
    super.onInit();
  }

  final _userProfile = UserModel(
    id: '',
    prefixId: '',
    genderId: '',
    fullName: '',
    dateOfBirth: '',
    nationality: '',
    idCard: '',
    homePhone: '',
    phoneNumber: '',
    lineId: '',
    memberCode: '',
  ).obs;

  final _userBenefit = BenefitModel(
    id: '',
    bankName: '',
    bankBranch: '',
    bookBankType: '',
    bookBankNumber: '',
    bookBankName: '',
  ).obs;

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

  final _profileIndex = 0.obs;

  // Getter
  UserModel get userProfile => _userProfile.value;
  BenefitModel get userBenefit => _userBenefit.value;
  int get profileIndex => _profileIndex.value;
  List<AddressSettingModel> get userAddress => _userAddress;
  List<ProvinceModel> get provinceList => _provinceList;
  List<DistrictModel> get districtList => _districtList;
  List<SubDistrictModel> get subDistrictList => _subDistrictList;

  void pressedProfileTextButton(int index) {
    _profileIndex.value = index;
  }

  String dateFormat(String date) {
    return '${DateFormat('dd/MM').format(DateTime.parse(date))}/${DateTime.parse(date).year + 543}';
  }

  String connectUserAddressData(int addressIndex) {
    return '${userAddress[addressIndex].houseNumber} ${userAddress[addressIndex].village} ${userAddress[addressIndex].alley} ${provinceList[provinceList.indexWhere((element) => element.id == userAddress[addressIndex].provinceId)].name} ${districtList[districtList.indexWhere((element) => element.id == userAddress[addressIndex].districtId)].name} ${subDistrictList[subDistrictList.indexWhere((element) => element.id == userAddress[addressIndex].subDistrictId)].name} ${subDistrictList[subDistrictList.indexWhere((element) => element.id == userAddress[addressIndex].subDistrictId)].zipCode}';
  }
}
