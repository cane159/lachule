import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lachule/bases/base_assets.dart';
import 'package:lachule/bases/base_colors.dart';
import 'package:lachule/bases/base_controller.dart';
import 'package:lachule/routes/app_pages.dart';

class HomePageViewController extends BaseController {
  // w8 for API
  String userFirstName = 'ดวงเดือน';
  String userLastName = 'ลัทธิพงศ์';

  //variable
  final _selectIndex = 0.obs;
  final PageController pageController = PageController();

  // List
  final List<BottomNavigationBarItem> _navBarItem = [
    BottomNavigationBarItem(
      icon: Image.asset(
        IconAssets.home,
        color: BaseColors.bgImageInputDisabled,
        width: 24,
        fit: BoxFit.fitWidth,
      ),
      label: 'หน้าแรก',
      activeIcon: Image.asset(
        IconAssets.homeFill,
        width: 24,
        fit: BoxFit.fitWidth,
      ),
    ),
    BottomNavigationBarItem(
      icon: Image.asset(
        IconAssets.shop,
        color: BaseColors.bgImageInputDisabled,
        width: 24,
        fit: BoxFit.fitWidth,
      ),
      label: 'สินค้า',
      activeIcon: Image.asset(
        IconAssets.shopFill,
        width: 24,
        fit: BoxFit.fitWidth,
      ),
    ),
    BottomNavigationBarItem(
      icon: Image.asset(
        IconAssets.transport,
        color: BaseColors.bgImageInputDisabled,
        width: 24,
        fit: BoxFit.fitWidth,
      ),
      label: 'ขนส่ง',
      activeIcon: Image.asset(
        IconAssets.transportFill,
        width: 24,
        fit: BoxFit.fitWidth,
      ),
    ),
    BottomNavigationBarItem(
      icon: Image.asset(
        IconAssets.message,
        color: BaseColors.bgImageInputDisabled,
        width: 24,
        fit: BoxFit.fitWidth,
      ),
      label: 'ข้อความ',
      activeIcon: Image.asset(
        IconAssets.messageFill,
        width: 24,
        fit: BoxFit.fitWidth,
      ),
    ),
    BottomNavigationBarItem(
      icon: Image.asset(
        IconAssets.setting,
        color: BaseColors.bgImageInputDisabled,
        width: 24,
        fit: BoxFit.fitWidth,
      ),
      label: 'ตั้งค่า',
      activeIcon: Image.asset(
        IconAssets.settingFill,
        width: 24,
        fit: BoxFit.fitWidth,
      ),
    ),
  ];

  // Getter

  int get selectIndex => _selectIndex.value;
  List<BottomNavigationBarItem> get navBarItem => _navBarItem;

  void onTapped(int index) {
    _selectIndex.value = index;
    pageController.jumpToPage(index);
  }

  void pressedCart() {
    Get.toNamed(AppRoutes.CART);
  }

  void pressedProfile() {
    Get.toNamed(AppRoutes.PROFILE);
  }
}
