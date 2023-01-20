import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lachule/bases/base_assets.dart';
import 'package:lachule/bases/base_colors.dart';
import 'package:lachule/bases/base_controller.dart';
import 'package:get/get.dart';
import 'package:lachule/routes/app_pages.dart';

class AppBottomnavigationBarController extends BaseController {
  final _selectIndex = 0.obs;

  // List
  final List<BottomNavigationBarItem> _navBarItem = [
    BottomNavigationBarItem(
      icon: Image.asset(
        IconAssets.home,
        color: BaseColors.bgImageInputDisabled,
      ),
      label: 'หน้าแรก',
      activeIcon: Image.asset(
        IconAssets.home,
      ),
    ),
    BottomNavigationBarItem(
      icon: Image.asset(
        IconAssets.shop,
        color: BaseColors.bgImageInputDisabled,
      ),
      label: 'สินค้า',
      activeIcon: Image.asset(
        IconAssets.shop,
      ),
    ),
    BottomNavigationBarItem(
      icon: Image.asset(
        IconAssets.transport,
        color: BaseColors.bgImageInputDisabled,
      ),
      label: 'ขนส่ง',
      activeIcon: Image.asset(
        IconAssets.transport,
      ),
    ),
    BottomNavigationBarItem(
      icon: Image.asset(
        IconAssets.message,
        color: BaseColors.bgImageInputDisabled,
      ),
      label: 'ข้อความ',
      activeIcon: Image.asset(
        IconAssets.message,
      ),
    ),
    BottomNavigationBarItem(
      icon: Image.asset(
        IconAssets.setting,
        color: BaseColors.bgImageInputDisabled,
      ),
      label: 'ตั้งค่า',
      activeIcon: Image.asset(
        IconAssets.setting,
      ),
    ),
  ];

  // Getter

  int get selectIndex => _selectIndex.value;
  List<BottomNavigationBarItem> get navBarItem => _navBarItem;

  void onTapped(int index) {
    _selectIndex.value = index;

    // TODO : impremention list value app route
    if (index == 0) {
      Get.offAndToNamed(AppRoutes.HOME);
    }
    if (index == 3) {
      Get.offAndToNamed(AppRoutes.NOTIFICATION);
    }
  }
}
