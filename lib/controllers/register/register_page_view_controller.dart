import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:lachule/bases/base_controller.dart';

class RegisterPageViewController extends BaseController {
  // Register page view variable
  final PageController pageController = PageController();
  final _currentIndex = 0.obs;

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

  // Register page view getter
  int get currentIndex => _currentIndex.value;

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
