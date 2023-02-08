import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lachule/controllers/register/register_page_view_controller.dart';
import 'package:lachule/models/gender.dart';
import 'package:lachule/models/prefix.dart';

class ApplicantInformationController extends RegisterPageViewController {
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
}
