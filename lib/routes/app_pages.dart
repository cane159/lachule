import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lachule/binding/cart_binding.dart';
import 'package:lachule/binding/detail_privilege_binding.dart';
import 'package:lachule/binding/first_menu_binding.dart';
import 'package:lachule/binding/forget_password_binding.dart';
import 'package:lachule/binding/home_binding.dart';
import 'package:lachule/binding/home_page_view_binding.dart';
import 'package:lachule/binding/login_binding.dart';
import 'package:lachule/binding/notification_binding.dart';
import 'package:lachule/binding/register_otp_binding.dart';
import 'package:lachule/binding/payment_binding.dart';
import 'package:lachule/binding/payment_gateway_binding.dart';
import 'package:lachule/binding/pdpa_binding.dart';
import 'package:lachule/binding/product_detail_binding.dart';
import 'package:lachule/binding/profile_binding.dart';
import 'package:lachule/binding/promotion_detail_binding.dart';
import 'package:lachule/binding/register_page_view_biinding.dart';
import 'package:lachule/binding/setting/address_setting_binding.dart';
import 'package:lachule/binding/setting/benefit_setting_binding.dart';
import 'package:lachule/binding/setting/delete_user_binding.dart';
import 'package:lachule/binding/setting/language_setting_binding.dart';
import 'package:lachule/binding/setting/noti_setting_binding.dart';
import 'package:lachule/binding/setting/personal_information_setting_binding.dart';
import 'package:lachule/binding/setting/setting_terms_of_service_binding.dart';
import 'package:lachule/binding/setting/user_address_edit_binding.dart';
import 'package:lachule/binding/setting/user_setting_binding.dart';
import 'package:lachule/binding/splash_binding.dart';
import 'package:lachule/binding/success_binding.dart';
import 'package:lachule/binding/terms_of_service_binding.dart';
import 'package:lachule/binding/transport_detail_binding.dart';
import 'package:lachule/binding/webview_binding.dart';
import 'package:lachule/views/cart_page.dart';
import 'package:lachule/views/first_menu_page.dart';
import 'package:lachule/views/forget_password_page.dart';
import 'package:lachule/views/home_page.dart';
import 'package:lachule/views/home_page_view.dart';
import 'package:lachule/views/login_page.dart';
import 'package:lachule/views/notification_page.dart';
import 'package:lachule/views/product_detail_page.dart';
import 'package:lachule/views/profile_page.dart';
import 'package:lachule/views/promotion_detail_page.dart';
import 'package:lachule/views/register/detail_privilege_page.dart';
import 'package:lachule/views/register/register_otp_page.dart';
import 'package:lachule/views/register/payment_gateway_page.dart';
import 'package:lachule/views/register/payment_page.dart';
import 'package:lachule/views/register/pdpa_page.dart';
import 'package:lachule/views/register/register_page_view.dart';
import 'package:lachule/views/register/success.dart';
import 'package:lachule/views/register/terms_of_service_page.dart';
import 'package:lachule/views/setting/address_setting_page.dart';
import 'package:lachule/views/setting/benefit_setting_page.dart';
import 'package:lachule/views/setting/delete_user_page.dart';
import 'package:lachule/views/setting/language_setting_page.dart';
import 'package:lachule/views/setting/noti_setting_page.dart';
import 'package:lachule/views/setting/personal_information_setting_page.dart';
import 'package:lachule/views/setting/setting_terms_of_service_page.dart';
import 'package:lachule/views/setting/user_address_edit_page.dart';
import 'package:lachule/views/setting/user_setting_page.dart';
import 'package:lachule/views/splash_page.dart';
import 'package:lachule/views/transport_detail_page.dart';
import 'package:lachule/views/webwview_page.dart';
import 'package:lachule/widgets/otp/otp_binding.dart';
import 'package:lachule/widgets/otp/otp_page.dart';
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
      page: () => LoginPage(),
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
    GetPage(
      name: AppRoutes.REGISTEROTP,
      page: () => RegisterOtpPage(),
      binding: RegisterOtpBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: AppRoutes.REGISTERPAYMENT,
      page: () => const PaymentPage(),
      binding: PaymentBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: AppRoutes.REGISTERPAYMENTGATEWAY,
      page: () => const PaymentGatewayPage(),
      binding: PaymentGatewayBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: AppRoutes.REGISTERSUCCESS,
      page: () => const SuccessPage(),
      binding: SuccessBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: AppRoutes.LANGUAGESETTING,
      page: () => const LanguageSettingPage(),
      binding: LanguageSettingBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: AppRoutes.PERSONALINFORMATIONSETTING,
      page: () => const PersonalInformationSettingPage(),
      binding: PersonalInformationSettingBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: AppRoutes.USERSETTING,
      page: () => const UserSettingPage(),
      binding: UserSettingBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: AppRoutes.ADDRESSSETTING,
      page: () => const AddressSettingPage(),
      binding: AddressSettingBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: AppRoutes.USERADDRESSEDIT,
      page: () => const UserAddressEditPage(),
      binding: UserAddressEditBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: AppRoutes.BENEFITSETTING,
      page: () => const BenefitSettingPage(),
      binding: BenefitSettingBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: AppRoutes.DELETEUSER,
      page: () => const DeleteUserPage(),
      binding: DeleteUserBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: AppRoutes.NOTISETTING,
      page: () => const NotiSettingPage(),
      binding: NotiSettingBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: AppRoutes.TRANSPORTDETAIL,
      page: () => const TransportDetailPage(),
      binding: TransportDetailBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: AppRoutes.WEBVIEW,
      page: () => const WebviewPae(),
      binding: WebviewBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: AppRoutes.PROFILE,
      page: () => const ProfilePage(),
      binding: ProfileBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: AppRoutes.OTP,
      page: () => OtpPage(),
      binding: OtpBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: AppRoutes.FORGETPASSWORD,
      page: () => ForgetPasswordPage(),
      binding: ForgetPasswordBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: AppRoutes.SETTINGTERMSOFSERVICE,
      page: () => const SettingTermsOfServicePage(),
      binding: SettingTermsOfServiceBinding(),
      transition: Transition.fadeIn,
    ),
  ];
}
