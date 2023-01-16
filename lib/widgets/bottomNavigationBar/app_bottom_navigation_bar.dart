import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lachule/bases/base_colors.dart';
import 'package:lachule/bases/base_sizes.dart';
import 'package:lachule/widgets/bottomNavigationBar/app_bottom_navigation_bar_controller.dart';

class AppBottomNavigationBar extends GetView<AppBottomnavigationBarController> {
  const AppBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.04),
              spreadRadius: 8,
              blurRadius: 7,
              offset: const Offset(0, -1),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.vertical(
            top: Radius.circular(20),
          ),
          child: BottomNavigationBar(
            items: controller.navBarItem,
            selectedItemColor: BaseColors.primaryRed,
            unselectedItemColor: BaseColors.btnDisabledPlaceholder,
            selectedLabelStyle: const TextStyle(
              color: BaseColors.primaryRed,
              fontSize: BaseSizes.fontH3,
            ),
            unselectedLabelStyle: const TextStyle(
              color: BaseColors.btnDisabledPlaceholder,
              fontSize: BaseSizes.fontH3,
            ),
            showUnselectedLabels: true,
            currentIndex: controller.selectIndex,
            onTap: (index) => controller.onTapped(index),
            type: BottomNavigationBarType.fixed,
          ),
        ),
      ),
    );
  }
}
