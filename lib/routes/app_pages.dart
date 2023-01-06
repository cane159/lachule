import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lachule/binding/first_menu_binding.dart';
import 'package:lachule/binding/splash_binding.dart';
import 'package:lachule/views/first_menu_page.dart';
import 'package:lachule/views/splash_page.dart';
part 'app_routes.dart';

class AppPages {
  static const INITIAl = AppRoutes.SPLASH;

  static final routes = [
    GetPage(
      name: AppRoutes.SPLASH,
      page: () => const SplashPage(),
      binding: SplashBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: AppRoutes.FIRSTMENU,
      page: () => const FirstMenuPage(),
      binding: FirstMenuBinding(),
      transition: Transition.fadeIn,
    ),
  ];
}
