class AddressSettingModel extends Object {
  final String id;
  final String houseNumber;
  final String village;
  final String alley;
  final String provinceId;
  final String districtId;
  final String subDistrictId;
  final String zipCode;
  final bool isMain;
  AddressSettingModel({
    required this.id,
    required this.houseNumber,
    required this.village,
    required this.alley,
    required this.provinceId,
    required this.districtId,
    required this.subDistrictId,
    required this.zipCode,
    required this.isMain,
  });
}
