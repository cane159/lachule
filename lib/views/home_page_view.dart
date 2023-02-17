import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lachule/bases/base_assets.dart';
import 'package:lachule/bases/base_colors.dart';
import 'package:lachule/bases/base_sizes.dart';
import 'package:lachule/controllers/home_page_view_controller.dart';
import 'package:lachule/views/home_page.dart';
import 'package:lachule/views/notification_page.dart';

class HomePageView extends GetView<HomePageViewController> {
  const HomePageView({super.key});

  @override
  Widget build(BuildContext context) {
    controller.setBuildContext(context);
    return Obx(
      () => Scaffold(
        appBar: controller.selectIndex == 0 ? _appBar() : null,
        body: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: controller.pageController,
          allowImplicitScrolling: true,
          children: [
            HomePage(),
            HomePage(),
            HomePage(),
            const NotificationPage(),
            HomePage(),
          ],
        ),
        bottomNavigationBar: _bottomNavigationBar(),
      ),
    );
  }

  AppBar _appBar() {
    return AppBar(
      leadingWidth: 51,
      elevation: 0,
      backgroundColor: BaseColors.primaryRed,
      surfaceTintColor: BaseColors.primaryRed,
      centerTitle: false,
      automaticallyImplyLeading: false,
      actions: <Widget>[
        IconButton(
          onPressed: () => controller.pressedCart(),
          icon: Image.asset(
            IconAssets.bagHappy,
            width: 24,
            height: 24,
            fit: BoxFit.fitWidth,
            color: BaseColors.white,
          ),
        ),
        Image.asset(ImageAssets.userAppbar),
      ],
      title: Row(
        children: [
          Text(
            'คุณ${controller.userFirstName} ${controller.userLastName}', //TODO: w8 for api
            style: const TextStyle(
              color: BaseColors.btnInput,
              fontSize: BaseSizes.fontH4,
            ),
          ),
        ],
      ),
    );
  }

  Widget _bottomNavigationBar() {
    return Container(
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
            fontSize: BaseSizes.fontBody2,
          ),
          unselectedLabelStyle: const TextStyle(
            color: BaseColors.btnDisabledPlaceholder,
            fontSize: 10,
          ),
          showUnselectedLabels: true,
          currentIndex: controller.selectIndex,
          onTap: (index) => controller.onTapped(index),
          type: BottomNavigationBarType.fixed,
        ),
      ),
    );
  }
}
