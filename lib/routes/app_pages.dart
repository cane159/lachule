import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lachule/binding/cart_binding.dart';
import 'package:lachule/binding/detail_privilege_binding.dart';
import 'package:lachule/binding/first_menu_binding.dart';
import 'package:lachule/binding/home_binding.dart';
import 'package:lachule/binding/home_page_view_binding.dart';
import 'package:lachule/binding/login_binding.dart';
import 'package:lachule/binding/notification_binding.dart';
import 'package:lachule/binding/pdpa_binding.dart';
import 'package:lachule/binding/product_detail_binding.dart';
import 'package:lachule/binding/promotion_detail_binding.dart';
import 'package:lachule/binding/register_page_view_biinding.dart';
import 'package:lachule/binding/splash_binding.dart';
import 'package:lachule/binding/terms_of_service_binding.dart';
import 'package:lachule/views/cart_page.dart';
import 'package:lachule/views/first_menu_page.dart';
import 'package:lachule/views/home_page.dart';
import 'package:lachule/views/home_page_view.dart';
import 'package:lachule/views/login_page.dart';
import 'package:lachule/views/notification_page.dart';
import 'package:lachule/views/product_detail_page.dart';
import 'package:lachule/views/promotion_detail_page.dart';
import 'package:lachule/views/register/detail_privilege_page.dart';
import 'package:lachule/views/register/pdpa_page.dart';
import 'package:lachule/views/register/register_page_view.dart';
import 'package:lachule/views/register/terms_of_service_page.dart';
import 'package:lachule/views/splash_page.dart';
part 'app_routes.dart';

class AppPages {
  // ignore: constant_identifier_names
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
    GetPage(
      name: AppRoutes.LOGIN,
      page: () => const LoginPage(),
      binding: LoginBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: AppRoutes.HOME,
      page: () => HomePage(),
      binding: HomeBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: AppRoutes.NOTIFICATION,
      page: () => const NotificationPage(),
      binding: NotificationBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: AppRoutes.PRODUCTDETAIL,
      page: () => const ProductDetailPage(),
      binding: ProductDetailBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: AppRoutes.HOMEPAGEVIEW,
      page: () => const HomePageView(),
      binding: HomePageViewBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: AppRoutes.PROMOTIONDETAIL,
      page: () => const PromotionDetailPage(),
      binding: PromotionDetailBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: AppRoutes.CART,
      page: () => const CartPage(),
      binding: CartBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: AppRoutes.DETAILPRIVILEGE,
      page: () => const DetailPrivilegePage(),
      binding: DetailPrivilegeBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: AppRoutes.TERMSOFSERVICE,
      page: () => const TermsOfServicePage(),
      binding: TermsOfServiceBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: AppRoutes.PDPA,
      page: () => const PDPAPage(),
      binding: PDPABinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: AppRoutes.REGISTERPAGEVIEW,
      page: () => const RegisterPageView(),
      binding: RegisterPageViewBinding(),
      transition: Transition.fadeIn,
    ),
  ];
}
