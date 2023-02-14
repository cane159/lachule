import 'package:flutter/material.dart';
import 'package:lachule/controllers/register/register_page_view_controller.dart';

class BusinessInformationController extends RegisterPageViewController {
  void pressReferralCode(bool value) {
    isReferralCode.value = value;
    if (value == true) {
      referralCode.value = const TextEditingValue(text: '1234');
    }
  }
}
