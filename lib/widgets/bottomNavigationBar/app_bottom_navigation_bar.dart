import 'package:flutter/material.dart';
import 'package:lachule/bases/base_colors.dart';
import 'package:lachule/bases/base_sizes.dart';
import 'package:lachule/widgets/bottomNavigationBar/app_bottom_navigation_bar_controller.dart';

class AppBottomNavigationBar extends StatelessWidget {
  AppBottomNavigationBar({super.key});

  AppBottomnavigationBarController navBarController =
      AppBottomnavigationBarController();

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: navBarController.navBarItem,
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
      currentIndex: navBarController.selectIndex,
      onTap: (index) => navBarController.onTapped(index),
    );
  }
}
