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
      ),
      label: 'หน้าแรก',
      activeIcon: Image.asset(
        IconAssets.homeFill,
      ),
    ),
    BottomNavigationBarItem(
      icon: Image.asset(
        IconAssets.shop,
        color: BaseColors.bgImageInputDisabled,
      ),
      label: 'สินค้า',
      activeIcon: Image.asset(
        IconAssets.shopFill,
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
        IconAssets.messageFill,
      ),
    ),
    BottomNavigationBarItem(
      icon: Image.asset(
        IconAssets.setting,
        color: BaseColors.bgImageInputDisabled,
      ),
      label: 'ตั้งค่า',
      activeIcon: Image.asset(
        IconAssets.settingFill,
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
}
