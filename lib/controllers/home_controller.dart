import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lachule/bases/base_assets.dart';
import 'package:lachule/bases/base_colors.dart';
import 'package:lachule/bases/base_controller.dart';
import 'package:lachule/bases/base_sizes.dart';
import 'package:lachule/models/best_sell_goods_model.dart';
import 'package:lachule/models/promotion_model.dart';
import 'package:lachule/models/recommend_goods_medel.dart';
import 'package:lachule/routes/app_pages.dart';
import 'package:lachule/storage/app_prefs.dart';
import 'package:lachule/widgets/app_check_box.dart';
import 'package:lachule/widgets/button/primary_button.dart';

class HomeController extends BaseController {
  @override
  void onInit() {
    // TODO: implement onInit
    _userRole.value = _appPrefs.userRole.value!;

    super.onInit();
  }

  @override
  void onReady() async {
    // TODO: implement onReady
    await Future.delayed(const Duration(milliseconds: 100), () {
      stopLoad();
    });
    if (_userRole.value == 'guest') {
      showPopup();
    }
    print(_userRole.value);
    super.onReady();
  }

  final AppPrefs _appPrefs = Get.find();

  RxInt currentCarousel = 0.obs;
  String userFirstName = 'ดวงเดือน';
  String userLastName = 'ลัทธิพงศ์';
  final RxString _userRole = ''.obs;
  final _isCheckBox = false.obs;

  // List

  List<String> imageCarousel = [
    'https://s3-alpha-sig.figma.com/img/04eb/1d0f/d9a28b59aa5b89ff2f7a59130c33015c?Expires=1679270400&Signature=HnLVg8noa0bLV1koIGM8bu8dfVE2E8S35GPZeBj0wuxgWpTaT6vRsyu8pd1uBfHbh4A6YEbO7uVQfIEbReNcXkQw5Dl~Kj3Dcm8wox64OTYTU4B5Uu5N387-5MN3X04W0vTn0O6reo7JeSMafXf11P-tyueJxAxB0dMPw7I59z4IHWxR9sSCtmk6IbBfMU9bxzvhrzf61-TLWIteVrYCTftmbMaYM~JsIsex9-7Yj-B0xiGR6ViNZfNaH~EO6kEN-bt~5fNRu4VRBcJ51fAjzigY0CYlMT5upD3zJn~BlRIXlH2o~asBiWWaKXQYs3CN9hDvfckXuiXqRLkW2qY~qg__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
    'https://s3-alpha-sig.figma.com/img/04eb/1d0f/d9a28b59aa5b89ff2f7a59130c33015c?Expires=1679270400&Signature=HnLVg8noa0bLV1koIGM8bu8dfVE2E8S35GPZeBj0wuxgWpTaT6vRsyu8pd1uBfHbh4A6YEbO7uVQfIEbReNcXkQw5Dl~Kj3Dcm8wox64OTYTU4B5Uu5N387-5MN3X04W0vTn0O6reo7JeSMafXf11P-tyueJxAxB0dMPw7I59z4IHWxR9sSCtmk6IbBfMU9bxzvhrzf61-TLWIteVrYCTftmbMaYM~JsIsex9-7Yj-B0xiGR6ViNZfNaH~EO6kEN-bt~5fNRu4VRBcJ51fAjzigY0CYlMT5upD3zJn~BlRIXlH2o~asBiWWaKXQYs3CN9hDvfckXuiXqRLkW2qY~qg__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
    'https://s3-alpha-sig.figma.com/img/04eb/1d0f/d9a28b59aa5b89ff2f7a59130c33015c?Expires=1679270400&Signature=HnLVg8noa0bLV1koIGM8bu8dfVE2E8S35GPZeBj0wuxgWpTaT6vRsyu8pd1uBfHbh4A6YEbO7uVQfIEbReNcXkQw5Dl~Kj3Dcm8wox64OTYTU4B5Uu5N387-5MN3X04W0vTn0O6reo7JeSMafXf11P-tyueJxAxB0dMPw7I59z4IHWxR9sSCtmk6IbBfMU9bxzvhrzf61-TLWIteVrYCTftmbMaYM~JsIsex9-7Yj-B0xiGR6ViNZfNaH~EO6kEN-bt~5fNRu4VRBcJ51fAjzigY0CYlMT5upD3zJn~BlRIXlH2o~asBiWWaKXQYs3CN9hDvfckXuiXqRLkW2qY~qg__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
    'https://s3-alpha-sig.figma.com/img/04eb/1d0f/d9a28b59aa5b89ff2f7a59130c33015c?Expires=1679270400&Signature=HnLVg8noa0bLV1koIGM8bu8dfVE2E8S35GPZeBj0wuxgWpTaT6vRsyu8pd1uBfHbh4A6YEbO7uVQfIEbReNcXkQw5Dl~Kj3Dcm8wox64OTYTU4B5Uu5N387-5MN3X04W0vTn0O6reo7JeSMafXf11P-tyueJxAxB0dMPw7I59z4IHWxR9sSCtmk6IbBfMU9bxzvhrzf61-TLWIteVrYCTftmbMaYM~JsIsex9-7Yj-B0xiGR6ViNZfNaH~EO6kEN-bt~5fNRu4VRBcJ51fAjzigY0CYlMT5upD3zJn~BlRIXlH2o~asBiWWaKXQYs3CN9hDvfckXuiXqRLkW2qY~qg__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
    'https://s3-alpha-sig.figma.com/img/04eb/1d0f/d9a28b59aa5b89ff2f7a59130c33015c?Expires=1679270400&Signature=HnLVg8noa0bLV1koIGM8bu8dfVE2E8S35GPZeBj0wuxgWpTaT6vRsyu8pd1uBfHbh4A6YEbO7uVQfIEbReNcXkQw5Dl~Kj3Dcm8wox64OTYTU4B5Uu5N387-5MN3X04W0vTn0O6reo7JeSMafXf11P-tyueJxAxB0dMPw7I59z4IHWxR9sSCtmk6IbBfMU9bxzvhrzf61-TLWIteVrYCTftmbMaYM~JsIsex9-7Yj-B0xiGR6ViNZfNaH~EO6kEN-bt~5fNRu4VRBcJ51fAjzigY0CYlMT5upD3zJn~BlRIXlH2o~asBiWWaKXQYs3CN9hDvfckXuiXqRLkW2qY~qg__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
  ];
  final List<PromotionModel> _promotionList = [
    PromotionModel(
      id: '1',
      image:
          'https://s3-alpha-sig.figma.com/img/f183/300a/727e94c90c923dfc3091ac83d14723e0?Expires=1679270400&Signature=OBzrj-cMIJVmNyOjGBqKlyUZq9G4AVDMwKGRbFIQd3qj2BBIVlZFHw7pMvjCOtpOHgAtGdDeChu0w8UJKwRXChq9lj1fA3Z8cPUmdacZJ21265k1ZcyagibFKepzghWcqelGNIgFHMXQZHWaK9KJAsebgmxj4jYkUrjVL4kIYRpm2y5Vr3T9XKqznCluthdoZklOmnzsKosumnBgl7tZErpMs3Wjmrq76gkbW1x7d8n1VvcBIY2XmGu-be8SGL8q6IrYhLF~SFbHp9PbsZAl3znQxFkOkMQCYd-3dazCwn9jgCjUviWjaWuX4g7a5KgRyWDtT8edHe5RV3M9JtRMVw__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
      title: 'โปรโมชั่นเดือนพฤศจิกายน 2565',
    ),
    PromotionModel(
      id: '2',
      image:
          'https://s3-alpha-sig.figma.com/img/f183/300a/727e94c90c923dfc3091ac83d14723e0?Expires=1679270400&Signature=OBzrj-cMIJVmNyOjGBqKlyUZq9G4AVDMwKGRbFIQd3qj2BBIVlZFHw7pMvjCOtpOHgAtGdDeChu0w8UJKwRXChq9lj1fA3Z8cPUmdacZJ21265k1ZcyagibFKepzghWcqelGNIgFHMXQZHWaK9KJAsebgmxj4jYkUrjVL4kIYRpm2y5Vr3T9XKqznCluthdoZklOmnzsKosumnBgl7tZErpMs3Wjmrq76gkbW1x7d8n1VvcBIY2XmGu-be8SGL8q6IrYhLF~SFbHp9PbsZAl3znQxFkOkMQCYd-3dazCwn9jgCjUviWjaWuX4g7a5KgRyWDtT8edHe5RV3M9JtRMVw__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
      title: 'โปรโมชั่นเดือนตุลาคม 2565',
    ),
    PromotionModel(
      id: '3',
      image:
          'https://s3-alpha-sig.figma.com/img/f183/300a/727e94c90c923dfc3091ac83d14723e0?Expires=1679270400&Signature=OBzrj-cMIJVmNyOjGBqKlyUZq9G4AVDMwKGRbFIQd3qj2BBIVlZFHw7pMvjCOtpOHgAtGdDeChu0w8UJKwRXChq9lj1fA3Z8cPUmdacZJ21265k1ZcyagibFKepzghWcqelGNIgFHMXQZHWaK9KJAsebgmxj4jYkUrjVL4kIYRpm2y5Vr3T9XKqznCluthdoZklOmnzsKosumnBgl7tZErpMs3Wjmrq76gkbW1x7d8n1VvcBIY2XmGu-be8SGL8q6IrYhLF~SFbHp9PbsZAl3znQxFkOkMQCYd-3dazCwn9jgCjUviWjaWuX4g7a5KgRyWDtT8edHe5RV3M9JtRMVw__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
      title: 'โปรโมชั่นเดือนตุลาคม 2565',
    ),
    PromotionModel(
      id: '4',
      image:
          'https://s3-alpha-sig.figma.com/img/f183/300a/727e94c90c923dfc3091ac83d14723e0?Expires=1679270400&Signature=OBzrj-cMIJVmNyOjGBqKlyUZq9G4AVDMwKGRbFIQd3qj2BBIVlZFHw7pMvjCOtpOHgAtGdDeChu0w8UJKwRXChq9lj1fA3Z8cPUmdacZJ21265k1ZcyagibFKepzghWcqelGNIgFHMXQZHWaK9KJAsebgmxj4jYkUrjVL4kIYRpm2y5Vr3T9XKqznCluthdoZklOmnzsKosumnBgl7tZErpMs3Wjmrq76gkbW1x7d8n1VvcBIY2XmGu-be8SGL8q6IrYhLF~SFbHp9PbsZAl3znQxFkOkMQCYd-3dazCwn9jgCjUviWjaWuX4g7a5KgRyWDtT8edHe5RV3M9JtRMVw__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
      title: 'โปรโมชั่นเดือนพฤศจิกายน 2565',
    ),
    PromotionModel(
      id: '5',
      image:
          'https://s3-alpha-sig.figma.com/img/f183/300a/727e94c90c923dfc3091ac83d14723e0?Expires=1679270400&Signature=OBzrj-cMIJVmNyOjGBqKlyUZq9G4AVDMwKGRbFIQd3qj2BBIVlZFHw7pMvjCOtpOHgAtGdDeChu0w8UJKwRXChq9lj1fA3Z8cPUmdacZJ21265k1ZcyagibFKepzghWcqelGNIgFHMXQZHWaK9KJAsebgmxj4jYkUrjVL4kIYRpm2y5Vr3T9XKqznCluthdoZklOmnzsKosumnBgl7tZErpMs3Wjmrq76gkbW1x7d8n1VvcBIY2XmGu-be8SGL8q6IrYhLF~SFbHp9PbsZAl3znQxFkOkMQCYd-3dazCwn9jgCjUviWjaWuX4g7a5KgRyWDtT8edHe5RV3M9JtRMVw__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
      title: 'โปรโมชั่นเดือนตุลาคม 2565',
    ),
  ];

  final List<BestSellGoodsModel> _bestSellGoodsList = [
    BestSellGoodsModel(
      id: '1',
      image:
          'https://s3-alpha-sig.figma.com/img/3882/55bc/dafa8fbfd8ac49059021da6fe48915a5?Expires=1679270400&Signature=Glch7f2gAHzWoGXouDXpZIfSBDMH6Ygk1dR5gv8SaIv3CcvO3d-6cJCrljofzIo5ng3MjTbwrKWuJruT1eu1AhlNs8tX5B6alg5N1Jdt~zgDeKq5SPg-3nJIQW66cshHrs1HDvmieqkNzPhhhm-EPInxX3fGGJ-DRXNI3IL6XGsolagJ7WbOmpszgfdG0M8ldA6aT3TsYklkWizjZMkON-Ji3Ku9HtoaxLc9smr~xLLTMhwwU0GdypJ97x1BYzIdR-W6LwVww87seXIdZeep2EpEgBUeg3oSx2Sm~UHoaQEXmOfpRGNwpQiE5ApH8HrdIhnXYTHpDiKKZfUIG4VcOA__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
      title: 'นาโน แอคเน่ ครีม จีพีโฟร์จี',
    ),
    BestSellGoodsModel(
      id: '2',
      image:
          'https://s3-alpha-sig.figma.com/img/3882/55bc/dafa8fbfd8ac49059021da6fe48915a5?Expires=1679270400&Signature=Glch7f2gAHzWoGXouDXpZIfSBDMH6Ygk1dR5gv8SaIv3CcvO3d-6cJCrljofzIo5ng3MjTbwrKWuJruT1eu1AhlNs8tX5B6alg5N1Jdt~zgDeKq5SPg-3nJIQW66cshHrs1HDvmieqkNzPhhhm-EPInxX3fGGJ-DRXNI3IL6XGsolagJ7WbOmpszgfdG0M8ldA6aT3TsYklkWizjZMkON-Ji3Ku9HtoaxLc9smr~xLLTMhwwU0GdypJ97x1BYzIdR-W6LwVww87seXIdZeep2EpEgBUeg3oSx2Sm~UHoaQEXmOfpRGNwpQiE5ApH8HrdIhnXYTHpDiKKZfUIG4VcOA__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
      title: 'นาโน ซันสกรีน ครีม จีพีโฟร์จี SPF50 PA+++',
    ),
    BestSellGoodsModel(
      id: '3',
      image:
          'https://s3-alpha-sig.figma.com/img/3882/55bc/dafa8fbfd8ac49059021da6fe48915a5?Expires=1679270400&Signature=Glch7f2gAHzWoGXouDXpZIfSBDMH6Ygk1dR5gv8SaIv3CcvO3d-6cJCrljofzIo5ng3MjTbwrKWuJruT1eu1AhlNs8tX5B6alg5N1Jdt~zgDeKq5SPg-3nJIQW66cshHrs1HDvmieqkNzPhhhm-EPInxX3fGGJ-DRXNI3IL6XGsolagJ7WbOmpszgfdG0M8ldA6aT3TsYklkWizjZMkON-Ji3Ku9HtoaxLc9smr~xLLTMhwwU0GdypJ97x1BYzIdR-W6LwVww87seXIdZeep2EpEgBUeg3oSx2Sm~UHoaQEXmOfpRGNwpQiE5ApH8HrdIhnXYTHpDiKKZfUIG4VcOA__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
      title: 'นาโน มอยส์เจอร์ไรเซอร์ ครีม จีพีโฟร์จี',
    ),
    BestSellGoodsModel(
      id: '4',
      image:
          'https://s3-alpha-sig.figma.com/img/3882/55bc/dafa8fbfd8ac49059021da6fe48915a5?Expires=1679270400&Signature=Glch7f2gAHzWoGXouDXpZIfSBDMH6Ygk1dR5gv8SaIv3CcvO3d-6cJCrljofzIo5ng3MjTbwrKWuJruT1eu1AhlNs8tX5B6alg5N1Jdt~zgDeKq5SPg-3nJIQW66cshHrs1HDvmieqkNzPhhhm-EPInxX3fGGJ-DRXNI3IL6XGsolagJ7WbOmpszgfdG0M8ldA6aT3TsYklkWizjZMkON-Ji3Ku9HtoaxLc9smr~xLLTMhwwU0GdypJ97x1BYzIdR-W6LwVww87seXIdZeep2EpEgBUeg3oSx2Sm~UHoaQEXmOfpRGNwpQiE5ApH8HrdIhnXYTHpDiKKZfUIG4VcOA__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
      title: 'นาโน แอคเน่ ครีม จีพีโฟร์จี',
    ),
    BestSellGoodsModel(
      id: '5',
      image:
          'https://s3-alpha-sig.figma.com/img/3882/55bc/dafa8fbfd8ac49059021da6fe48915a5?Expires=1679270400&Signature=Glch7f2gAHzWoGXouDXpZIfSBDMH6Ygk1dR5gv8SaIv3CcvO3d-6cJCrljofzIo5ng3MjTbwrKWuJruT1eu1AhlNs8tX5B6alg5N1Jdt~zgDeKq5SPg-3nJIQW66cshHrs1HDvmieqkNzPhhhm-EPInxX3fGGJ-DRXNI3IL6XGsolagJ7WbOmpszgfdG0M8ldA6aT3TsYklkWizjZMkON-Ji3Ku9HtoaxLc9smr~xLLTMhwwU0GdypJ97x1BYzIdR-W6LwVww87seXIdZeep2EpEgBUeg3oSx2Sm~UHoaQEXmOfpRGNwpQiE5ApH8HrdIhnXYTHpDiKKZfUIG4VcOA__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
      title: 'นาโน ซันสกรีน ครีม จีพีโฟร์จี SPF50 PA+++',
    ),
    BestSellGoodsModel(
      id: '6',
      image:
          'https://s3-alpha-sig.figma.com/img/3882/55bc/dafa8fbfd8ac49059021da6fe48915a5?Expires=1679270400&Signature=Glch7f2gAHzWoGXouDXpZIfSBDMH6Ygk1dR5gv8SaIv3CcvO3d-6cJCrljofzIo5ng3MjTbwrKWuJruT1eu1AhlNs8tX5B6alg5N1Jdt~zgDeKq5SPg-3nJIQW66cshHrs1HDvmieqkNzPhhhm-EPInxX3fGGJ-DRXNI3IL6XGsolagJ7WbOmpszgfdG0M8ldA6aT3TsYklkWizjZMkON-Ji3Ku9HtoaxLc9smr~xLLTMhwwU0GdypJ97x1BYzIdR-W6LwVww87seXIdZeep2EpEgBUeg3oSx2Sm~UHoaQEXmOfpRGNwpQiE5ApH8HrdIhnXYTHpDiKKZfUIG4VcOA__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
      title: 'นาโน มอยส์เจอร์ไรเซอร์ ครีม จีพีโฟร์จี',
    ),
    BestSellGoodsModel(
      id: '7',
      image:
          'https://s3-alpha-sig.figma.com/img/3882/55bc/dafa8fbfd8ac49059021da6fe48915a5?Expires=1679270400&Signature=Glch7f2gAHzWoGXouDXpZIfSBDMH6Ygk1dR5gv8SaIv3CcvO3d-6cJCrljofzIo5ng3MjTbwrKWuJruT1eu1AhlNs8tX5B6alg5N1Jdt~zgDeKq5SPg-3nJIQW66cshHrs1HDvmieqkNzPhhhm-EPInxX3fGGJ-DRXNI3IL6XGsolagJ7WbOmpszgfdG0M8ldA6aT3TsYklkWizjZMkON-Ji3Ku9HtoaxLc9smr~xLLTMhwwU0GdypJ97x1BYzIdR-W6LwVww87seXIdZeep2EpEgBUeg3oSx2Sm~UHoaQEXmOfpRGNwpQiE5ApH8HrdIhnXYTHpDiKKZfUIG4VcOA__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
      title: 'นาโน แอคเน่ ครีม จีพีโฟร์จี',
    ),
    BestSellGoodsModel(
      id: '8',
      image:
          'https://s3-alpha-sig.figma.com/img/3882/55bc/dafa8fbfd8ac49059021da6fe48915a5?Expires=1679270400&Signature=Glch7f2gAHzWoGXouDXpZIfSBDMH6Ygk1dR5gv8SaIv3CcvO3d-6cJCrljofzIo5ng3MjTbwrKWuJruT1eu1AhlNs8tX5B6alg5N1Jdt~zgDeKq5SPg-3nJIQW66cshHrs1HDvmieqkNzPhhhm-EPInxX3fGGJ-DRXNI3IL6XGsolagJ7WbOmpszgfdG0M8ldA6aT3TsYklkWizjZMkON-Ji3Ku9HtoaxLc9smr~xLLTMhwwU0GdypJ97x1BYzIdR-W6LwVww87seXIdZeep2EpEgBUeg3oSx2Sm~UHoaQEXmOfpRGNwpQiE5ApH8HrdIhnXYTHpDiKKZfUIG4VcOA__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
      title: 'นาโน ซันสกรีน ครีม จีพีโฟร์จี SPF50 PA+++',
    ),
    BestSellGoodsModel(
      id: '9',
      image:
          'https://s3-alpha-sig.figma.com/img/3882/55bc/dafa8fbfd8ac49059021da6fe48915a5?Expires=1679270400&Signature=Glch7f2gAHzWoGXouDXpZIfSBDMH6Ygk1dR5gv8SaIv3CcvO3d-6cJCrljofzIo5ng3MjTbwrKWuJruT1eu1AhlNs8tX5B6alg5N1Jdt~zgDeKq5SPg-3nJIQW66cshHrs1HDvmieqkNzPhhhm-EPInxX3fGGJ-DRXNI3IL6XGsolagJ7WbOmpszgfdG0M8ldA6aT3TsYklkWizjZMkON-Ji3Ku9HtoaxLc9smr~xLLTMhwwU0GdypJ97x1BYzIdR-W6LwVww87seXIdZeep2EpEgBUeg3oSx2Sm~UHoaQEXmOfpRGNwpQiE5ApH8HrdIhnXYTHpDiKKZfUIG4VcOA__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
      title: 'นาโน มอยส์เจอร์ไรเซอร์ ครีม จีพีโฟร์จี',
    ),
    BestSellGoodsModel(
      id: '10',
      image:
          'https://s3-alpha-sig.figma.com/img/3882/55bc/dafa8fbfd8ac49059021da6fe48915a5?Expires=1679270400&Signature=Glch7f2gAHzWoGXouDXpZIfSBDMH6Ygk1dR5gv8SaIv3CcvO3d-6cJCrljofzIo5ng3MjTbwrKWuJruT1eu1AhlNs8tX5B6alg5N1Jdt~zgDeKq5SPg-3nJIQW66cshHrs1HDvmieqkNzPhhhm-EPInxX3fGGJ-DRXNI3IL6XGsolagJ7WbOmpszgfdG0M8ldA6aT3TsYklkWizjZMkON-Ji3Ku9HtoaxLc9smr~xLLTMhwwU0GdypJ97x1BYzIdR-W6LwVww87seXIdZeep2EpEgBUeg3oSx2Sm~UHoaQEXmOfpRGNwpQiE5ApH8HrdIhnXYTHpDiKKZfUIG4VcOA__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
      title: 'นาโน แอคเน่ ครีม จีพีโฟร์จี',
    ),
  ];

  final List<RecommendGoodsModel> _recommendGoodsList = [
    RecommendGoodsModel(
      id: '1',
      image:
          'https://s3-alpha-sig.figma.com/img/25b4/a6a3/3534ecc797a82bba2a7bc30315dc5dca?Expires=1679270400&Signature=UNNSHI7NyrqUvC3iod~IsdnASfPFmRlpTJh8zxILowmFDcKopmOypcP9EciEeZnjamQOUVwvmjm6~RkGhYuolMmLZMDnX9v46Wv7n14RpM6BXu1zfaR2hmFbQWe2TFvJ2WchuQKGPw681zPLA-nFY46dpUOpEp7cNwTGY17m9aboLPzPYGOhlnihjsPVRkSApQkuwMlcSj0TzblSVJr0xvcPl6benVV8djY6Rk5MPE6fYgdRqxK7dt5D0V~tQFAUTpjg2fio~6XOygeIRwQs9L-augDvpJPFGycdHUQ-AGfHKWPvm5mDwDUi5WzPIPXxwuUXHwgmdCq0w49SoGduOA__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
      title: 'นาโน ไวท์เทนนิ่ง โซฟ จีพีโฟร์จี',
    ),
    RecommendGoodsModel(
      id: '2',
      image:
          'https://s3-alpha-sig.figma.com/img/25b4/a6a3/3534ecc797a82bba2a7bc30315dc5dca?Expires=1679270400&Signature=UNNSHI7NyrqUvC3iod~IsdnASfPFmRlpTJh8zxILowmFDcKopmOypcP9EciEeZnjamQOUVwvmjm6~RkGhYuolMmLZMDnX9v46Wv7n14RpM6BXu1zfaR2hmFbQWe2TFvJ2WchuQKGPw681zPLA-nFY46dpUOpEp7cNwTGY17m9aboLPzPYGOhlnihjsPVRkSApQkuwMlcSj0TzblSVJr0xvcPl6benVV8djY6Rk5MPE6fYgdRqxK7dt5D0V~tQFAUTpjg2fio~6XOygeIRwQs9L-augDvpJPFGycdHUQ-AGfHKWPvm5mDwDUi5WzPIPXxwuUXHwgmdCq0w49SoGduOA__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
      title: 'คอมแพค พาวเดอร์',
    ),
    RecommendGoodsModel(
      id: '3',
      image:
          'https://s3-alpha-sig.figma.com/img/25b4/a6a3/3534ecc797a82bba2a7bc30315dc5dca?Expires=1679270400&Signature=UNNSHI7NyrqUvC3iod~IsdnASfPFmRlpTJh8zxILowmFDcKopmOypcP9EciEeZnjamQOUVwvmjm6~RkGhYuolMmLZMDnX9v46Wv7n14RpM6BXu1zfaR2hmFbQWe2TFvJ2WchuQKGPw681zPLA-nFY46dpUOpEp7cNwTGY17m9aboLPzPYGOhlnihjsPVRkSApQkuwMlcSj0TzblSVJr0xvcPl6benVV8djY6Rk5MPE6fYgdRqxK7dt5D0V~tQFAUTpjg2fio~6XOygeIRwQs9L-augDvpJPFGycdHUQ-AGfHKWPvm5mDwDUi5WzPIPXxwuUXHwgmdCq0w49SoGduOA__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
      title: 'บูสเตอร์ มาส์ก',
    ),
    RecommendGoodsModel(
      id: '4',
      image:
          'https://s3-alpha-sig.figma.com/img/25b4/a6a3/3534ecc797a82bba2a7bc30315dc5dca?Expires=1679270400&Signature=UNNSHI7NyrqUvC3iod~IsdnASfPFmRlpTJh8zxILowmFDcKopmOypcP9EciEeZnjamQOUVwvmjm6~RkGhYuolMmLZMDnX9v46Wv7n14RpM6BXu1zfaR2hmFbQWe2TFvJ2WchuQKGPw681zPLA-nFY46dpUOpEp7cNwTGY17m9aboLPzPYGOhlnihjsPVRkSApQkuwMlcSj0TzblSVJr0xvcPl6benVV8djY6Rk5MPE6fYgdRqxK7dt5D0V~tQFAUTpjg2fio~6XOygeIRwQs9L-augDvpJPFGycdHUQ-AGfHKWPvm5mDwDUi5WzPIPXxwuUXHwgmdCq0w49SoGduOA__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
      title: 'นาโน ไวท์เทนนิ่ง โซฟ จีพีโฟร์จี',
    ),
    RecommendGoodsModel(
      id: '5',
      image:
          'https://s3-alpha-sig.figma.com/img/25b4/a6a3/3534ecc797a82bba2a7bc30315dc5dca?Expires=1679270400&Signature=UNNSHI7NyrqUvC3iod~IsdnASfPFmRlpTJh8zxILowmFDcKopmOypcP9EciEeZnjamQOUVwvmjm6~RkGhYuolMmLZMDnX9v46Wv7n14RpM6BXu1zfaR2hmFbQWe2TFvJ2WchuQKGPw681zPLA-nFY46dpUOpEp7cNwTGY17m9aboLPzPYGOhlnihjsPVRkSApQkuwMlcSj0TzblSVJr0xvcPl6benVV8djY6Rk5MPE6fYgdRqxK7dt5D0V~tQFAUTpjg2fio~6XOygeIRwQs9L-augDvpJPFGycdHUQ-AGfHKWPvm5mDwDUi5WzPIPXxwuUXHwgmdCq0w49SoGduOA__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
      title: 'คอมแพค พาวเดอร์',
    ),
    RecommendGoodsModel(
      id: '6',
      image:
          'https://s3-alpha-sig.figma.com/img/25b4/a6a3/3534ecc797a82bba2a7bc30315dc5dca?Expires=1679270400&Signature=UNNSHI7NyrqUvC3iod~IsdnASfPFmRlpTJh8zxILowmFDcKopmOypcP9EciEeZnjamQOUVwvmjm6~RkGhYuolMmLZMDnX9v46Wv7n14RpM6BXu1zfaR2hmFbQWe2TFvJ2WchuQKGPw681zPLA-nFY46dpUOpEp7cNwTGY17m9aboLPzPYGOhlnihjsPVRkSApQkuwMlcSj0TzblSVJr0xvcPl6benVV8djY6Rk5MPE6fYgdRqxK7dt5D0V~tQFAUTpjg2fio~6XOygeIRwQs9L-augDvpJPFGycdHUQ-AGfHKWPvm5mDwDUi5WzPIPXxwuUXHwgmdCq0w49SoGduOA__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
      title: 'บูสเตอร์ มาส์ก',
    ),
    RecommendGoodsModel(
      id: '7',
      image:
          'https://s3-alpha-sig.figma.com/img/25b4/a6a3/3534ecc797a82bba2a7bc30315dc5dca?Expires=1679270400&Signature=UNNSHI7NyrqUvC3iod~IsdnASfPFmRlpTJh8zxILowmFDcKopmOypcP9EciEeZnjamQOUVwvmjm6~RkGhYuolMmLZMDnX9v46Wv7n14RpM6BXu1zfaR2hmFbQWe2TFvJ2WchuQKGPw681zPLA-nFY46dpUOpEp7cNwTGY17m9aboLPzPYGOhlnihjsPVRkSApQkuwMlcSj0TzblSVJr0xvcPl6benVV8djY6Rk5MPE6fYgdRqxK7dt5D0V~tQFAUTpjg2fio~6XOygeIRwQs9L-augDvpJPFGycdHUQ-AGfHKWPvm5mDwDUi5WzPIPXxwuUXHwgmdCq0w49SoGduOA__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
      title: 'นาโน ไวท์เทนนิ่ง โซฟ จีพีโฟร์จี',
    ),
    RecommendGoodsModel(
      id: '8',
      image:
          'https://s3-alpha-sig.figma.com/img/25b4/a6a3/3534ecc797a82bba2a7bc30315dc5dca?Expires=1679270400&Signature=UNNSHI7NyrqUvC3iod~IsdnASfPFmRlpTJh8zxILowmFDcKopmOypcP9EciEeZnjamQOUVwvmjm6~RkGhYuolMmLZMDnX9v46Wv7n14RpM6BXu1zfaR2hmFbQWe2TFvJ2WchuQKGPw681zPLA-nFY46dpUOpEp7cNwTGY17m9aboLPzPYGOhlnihjsPVRkSApQkuwMlcSj0TzblSVJr0xvcPl6benVV8djY6Rk5MPE6fYgdRqxK7dt5D0V~tQFAUTpjg2fio~6XOygeIRwQs9L-augDvpJPFGycdHUQ-AGfHKWPvm5mDwDUi5WzPIPXxwuUXHwgmdCq0w49SoGduOA__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
      title: 'คอมแพค พาวเดอร์',
    ),
    RecommendGoodsModel(
      id: '9',
      image:
          'https://s3-alpha-sig.figma.com/img/25b4/a6a3/3534ecc797a82bba2a7bc30315dc5dca?Expires=1679270400&Signature=UNNSHI7NyrqUvC3iod~IsdnASfPFmRlpTJh8zxILowmFDcKopmOypcP9EciEeZnjamQOUVwvmjm6~RkGhYuolMmLZMDnX9v46Wv7n14RpM6BXu1zfaR2hmFbQWe2TFvJ2WchuQKGPw681zPLA-nFY46dpUOpEp7cNwTGY17m9aboLPzPYGOhlnihjsPVRkSApQkuwMlcSj0TzblSVJr0xvcPl6benVV8djY6Rk5MPE6fYgdRqxK7dt5D0V~tQFAUTpjg2fio~6XOygeIRwQs9L-augDvpJPFGycdHUQ-AGfHKWPvm5mDwDUi5WzPIPXxwuUXHwgmdCq0w49SoGduOA__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
      title: 'บูสเตอร์ มาส์ก',
    ),
    RecommendGoodsModel(
      id: '10',
      image:
          'https://s3-alpha-sig.figma.com/img/25b4/a6a3/3534ecc797a82bba2a7bc30315dc5dca?Expires=1679270400&Signature=UNNSHI7NyrqUvC3iod~IsdnASfPFmRlpTJh8zxILowmFDcKopmOypcP9EciEeZnjamQOUVwvmjm6~RkGhYuolMmLZMDnX9v46Wv7n14RpM6BXu1zfaR2hmFbQWe2TFvJ2WchuQKGPw681zPLA-nFY46dpUOpEp7cNwTGY17m9aboLPzPYGOhlnihjsPVRkSApQkuwMlcSj0TzblSVJr0xvcPl6benVV8djY6Rk5MPE6fYgdRqxK7dt5D0V~tQFAUTpjg2fio~6XOygeIRwQs9L-augDvpJPFGycdHUQ-AGfHKWPvm5mDwDUi5WzPIPXxwuUXHwgmdCq0w49SoGduOA__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
      title: 'นาโน ไวท์เทนนิ่ง โซฟ จีพีโฟร์จี',
    ),
    RecommendGoodsModel(
      id: '11',
      image:
          'https://s3-alpha-sig.figma.com/img/25b4/a6a3/3534ecc797a82bba2a7bc30315dc5dca?Expires=1679270400&Signature=UNNSHI7NyrqUvC3iod~IsdnASfPFmRlpTJh8zxILowmFDcKopmOypcP9EciEeZnjamQOUVwvmjm6~RkGhYuolMmLZMDnX9v46Wv7n14RpM6BXu1zfaR2hmFbQWe2TFvJ2WchuQKGPw681zPLA-nFY46dpUOpEp7cNwTGY17m9aboLPzPYGOhlnihjsPVRkSApQkuwMlcSj0TzblSVJr0xvcPl6benVV8djY6Rk5MPE6fYgdRqxK7dt5D0V~tQFAUTpjg2fio~6XOygeIRwQs9L-augDvpJPFGycdHUQ-AGfHKWPvm5mDwDUi5WzPIPXxwuUXHwgmdCq0w49SoGduOA__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
      title: 'คอมแพค พาวเดอร์',
    ),
    RecommendGoodsModel(
      id: '12',
      image:
          'https://s3-alpha-sig.figma.com/img/25b4/a6a3/3534ecc797a82bba2a7bc30315dc5dca?Expires=1679270400&Signature=UNNSHI7NyrqUvC3iod~IsdnASfPFmRlpTJh8zxILowmFDcKopmOypcP9EciEeZnjamQOUVwvmjm6~RkGhYuolMmLZMDnX9v46Wv7n14RpM6BXu1zfaR2hmFbQWe2TFvJ2WchuQKGPw681zPLA-nFY46dpUOpEp7cNwTGY17m9aboLPzPYGOhlnihjsPVRkSApQkuwMlcSj0TzblSVJr0xvcPl6benVV8djY6Rk5MPE6fYgdRqxK7dt5D0V~tQFAUTpjg2fio~6XOygeIRwQs9L-augDvpJPFGycdHUQ-AGfHKWPvm5mDwDUi5WzPIPXxwuUXHwgmdCq0w49SoGduOA__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
      title: 'บูสเตอร์ มาส์ก',
    ),
    RecommendGoodsModel(
      id: '13',
      image:
          'https://s3-alpha-sig.figma.com/img/25b4/a6a3/3534ecc797a82bba2a7bc30315dc5dca?Expires=1679270400&Signature=UNNSHI7NyrqUvC3iod~IsdnASfPFmRlpTJh8zxILowmFDcKopmOypcP9EciEeZnjamQOUVwvmjm6~RkGhYuolMmLZMDnX9v46Wv7n14RpM6BXu1zfaR2hmFbQWe2TFvJ2WchuQKGPw681zPLA-nFY46dpUOpEp7cNwTGY17m9aboLPzPYGOhlnihjsPVRkSApQkuwMlcSj0TzblSVJr0xvcPl6benVV8djY6Rk5MPE6fYgdRqxK7dt5D0V~tQFAUTpjg2fio~6XOygeIRwQs9L-augDvpJPFGycdHUQ-AGfHKWPvm5mDwDUi5WzPIPXxwuUXHwgmdCq0w49SoGduOA__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
      title: 'นาโน ไวท์เทนนิ่ง โซฟ จีพีโฟร์จี',
    ),
    RecommendGoodsModel(
      id: '14',
      image:
          'https://s3-alpha-sig.figma.com/img/25b4/a6a3/3534ecc797a82bba2a7bc30315dc5dca?Expires=1679270400&Signature=UNNSHI7NyrqUvC3iod~IsdnASfPFmRlpTJh8zxILowmFDcKopmOypcP9EciEeZnjamQOUVwvmjm6~RkGhYuolMmLZMDnX9v46Wv7n14RpM6BXu1zfaR2hmFbQWe2TFvJ2WchuQKGPw681zPLA-nFY46dpUOpEp7cNwTGY17m9aboLPzPYGOhlnihjsPVRkSApQkuwMlcSj0TzblSVJr0xvcPl6benVV8djY6Rk5MPE6fYgdRqxK7dt5D0V~tQFAUTpjg2fio~6XOygeIRwQs9L-augDvpJPFGycdHUQ-AGfHKWPvm5mDwDUi5WzPIPXxwuUXHwgmdCq0w49SoGduOA__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
      title: 'คอมแพค พาวเดอร์',
    ),
    RecommendGoodsModel(
      id: '15',
      image:
          'https://s3-alpha-sig.figma.com/img/25b4/a6a3/3534ecc797a82bba2a7bc30315dc5dca?Expires=1679270400&Signature=UNNSHI7NyrqUvC3iod~IsdnASfPFmRlpTJh8zxILowmFDcKopmOypcP9EciEeZnjamQOUVwvmjm6~RkGhYuolMmLZMDnX9v46Wv7n14RpM6BXu1zfaR2hmFbQWe2TFvJ2WchuQKGPw681zPLA-nFY46dpUOpEp7cNwTGY17m9aboLPzPYGOhlnihjsPVRkSApQkuwMlcSj0TzblSVJr0xvcPl6benVV8djY6Rk5MPE6fYgdRqxK7dt5D0V~tQFAUTpjg2fio~6XOygeIRwQs9L-augDvpJPFGycdHUQ-AGfHKWPvm5mDwDUi5WzPIPXxwuUXHwgmdCq0w49SoGduOA__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
      title: 'บูสเตอร์ มาส์ก',
    ),
    RecommendGoodsModel(
      id: '16',
      image:
          'https://s3-alpha-sig.figma.com/img/25b4/a6a3/3534ecc797a82bba2a7bc30315dc5dca?Expires=1679270400&Signature=UNNSHI7NyrqUvC3iod~IsdnASfPFmRlpTJh8zxILowmFDcKopmOypcP9EciEeZnjamQOUVwvmjm6~RkGhYuolMmLZMDnX9v46Wv7n14RpM6BXu1zfaR2hmFbQWe2TFvJ2WchuQKGPw681zPLA-nFY46dpUOpEp7cNwTGY17m9aboLPzPYGOhlnihjsPVRkSApQkuwMlcSj0TzblSVJr0xvcPl6benVV8djY6Rk5MPE6fYgdRqxK7dt5D0V~tQFAUTpjg2fio~6XOygeIRwQs9L-augDvpJPFGycdHUQ-AGfHKWPvm5mDwDUi5WzPIPXxwuUXHwgmdCq0w49SoGduOA__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
      title: 'นาโน ไวท์เทนนิ่ง โซฟ จีพีโฟร์จี',
    ),
    RecommendGoodsModel(
      id: '17',
      image:
          'https://s3-alpha-sig.figma.com/img/25b4/a6a3/3534ecc797a82bba2a7bc30315dc5dca?Expires=1679270400&Signature=UNNSHI7NyrqUvC3iod~IsdnASfPFmRlpTJh8zxILowmFDcKopmOypcP9EciEeZnjamQOUVwvmjm6~RkGhYuolMmLZMDnX9v46Wv7n14RpM6BXu1zfaR2hmFbQWe2TFvJ2WchuQKGPw681zPLA-nFY46dpUOpEp7cNwTGY17m9aboLPzPYGOhlnihjsPVRkSApQkuwMlcSj0TzblSVJr0xvcPl6benVV8djY6Rk5MPE6fYgdRqxK7dt5D0V~tQFAUTpjg2fio~6XOygeIRwQs9L-augDvpJPFGycdHUQ-AGfHKWPvm5mDwDUi5WzPIPXxwuUXHwgmdCq0w49SoGduOA__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
      title: 'คอมแพค พาวเดอร์',
    ),
    RecommendGoodsModel(
      id: '18',
      image:
          'https://s3-alpha-sig.figma.com/img/25b4/a6a3/3534ecc797a82bba2a7bc30315dc5dca?Expires=1679270400&Signature=UNNSHI7NyrqUvC3iod~IsdnASfPFmRlpTJh8zxILowmFDcKopmOypcP9EciEeZnjamQOUVwvmjm6~RkGhYuolMmLZMDnX9v46Wv7n14RpM6BXu1zfaR2hmFbQWe2TFvJ2WchuQKGPw681zPLA-nFY46dpUOpEp7cNwTGY17m9aboLPzPYGOhlnihjsPVRkSApQkuwMlcSj0TzblSVJr0xvcPl6benVV8djY6Rk5MPE6fYgdRqxK7dt5D0V~tQFAUTpjg2fio~6XOygeIRwQs9L-augDvpJPFGycdHUQ-AGfHKWPvm5mDwDUi5WzPIPXxwuUXHwgmdCq0w49SoGduOA__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
      title: 'บูสเตอร์ มาส์ก',
    ),
    RecommendGoodsModel(
      id: '19',
      image:
          'https://s3-alpha-sig.figma.com/img/25b4/a6a3/3534ecc797a82bba2a7bc30315dc5dca?Expires=1679270400&Signature=UNNSHI7NyrqUvC3iod~IsdnASfPFmRlpTJh8zxILowmFDcKopmOypcP9EciEeZnjamQOUVwvmjm6~RkGhYuolMmLZMDnX9v46Wv7n14RpM6BXu1zfaR2hmFbQWe2TFvJ2WchuQKGPw681zPLA-nFY46dpUOpEp7cNwTGY17m9aboLPzPYGOhlnihjsPVRkSApQkuwMlcSj0TzblSVJr0xvcPl6benVV8djY6Rk5MPE6fYgdRqxK7dt5D0V~tQFAUTpjg2fio~6XOygeIRwQs9L-augDvpJPFGycdHUQ-AGfHKWPvm5mDwDUi5WzPIPXxwuUXHwgmdCq0w49SoGduOA__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
      title: 'นาโน ไวท์เทนนิ่ง โซฟ จีพีโฟร์จี',
    ),
    RecommendGoodsModel(
      id: '20',
      image:
          'https://s3-alpha-sig.figma.com/img/25b4/a6a3/3534ecc797a82bba2a7bc30315dc5dca?Expires=1679270400&Signature=UNNSHI7NyrqUvC3iod~IsdnASfPFmRlpTJh8zxILowmFDcKopmOypcP9EciEeZnjamQOUVwvmjm6~RkGhYuolMmLZMDnX9v46Wv7n14RpM6BXu1zfaR2hmFbQWe2TFvJ2WchuQKGPw681zPLA-nFY46dpUOpEp7cNwTGY17m9aboLPzPYGOhlnihjsPVRkSApQkuwMlcSj0TzblSVJr0xvcPl6benVV8djY6Rk5MPE6fYgdRqxK7dt5D0V~tQFAUTpjg2fio~6XOygeIRwQs9L-augDvpJPFGycdHUQ-AGfHKWPvm5mDwDUi5WzPIPXxwuUXHwgmdCq0w49SoGduOA__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
      title: 'คอมแพค พาวเดอร์',
    ),
  ];

  // Getter

  List<PromotionModel> get promotionList => _promotionList;
  List<BestSellGoodsModel> get bestSellGoodsList => _bestSellGoodsList;
  List<RecommendGoodsModel> get recommendGoodsList => _recommendGoodsList;
  String get userRole => _userRole.value;

  void pressProduct() {
    Get.toNamed(AppRoutes.PRODUCTDETAIL);
  }

  void pressPromotion() {
    Get.toNamed(AppRoutes.PROMOTIONDETAIL);
  }

  Future<void> showPopup() {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return Obx(
          () => AlertDialog(
            insetPadding:
                const EdgeInsets.symmetric(horizontal: 22.0, vertical: 24.0),
            titlePadding: EdgeInsets.zero,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  onPressed: () => Get.back(),
                  icon: Image.asset(
                    IconAssets.close,
                    width: 24,
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ],
            ),
            contentPadding: EdgeInsets.zero,
            contentTextStyle: const TextStyle(
              color: BaseColors.textPrimary,
              fontSize: 21,
              fontWeight: FontWeight.bold,
            ),
            content: Stack(
              alignment: Alignment.center,
              children: [
                Image.asset(
                  ImageAssets.splashBg,
                  fit: BoxFit.fitWidth,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(
                      ImageAssets.vipCard,
                      width: 170,
                      fit: BoxFit.fitWidth,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: const TextSpan(
                          text: 'รับส่วนลดสินค้าของเราทันที ',
                          style: TextStyle(
                            color: BaseColors.textPrimary,
                            fontSize: 21,
                            fontFamily: 'NotoSansThai',
                          ),
                          children: <TextSpan>[
                            TextSpan(
                              text: '20%',
                              style: TextStyle(
                                color: BaseColors.primaryRed,
                                fontSize: 21,
                                fontFamily: 'NotoSansThai',
                              ),
                            ),
                            TextSpan(
                              text: ' เพียงแค่สมัครสมาชิก',
                              style: TextStyle(
                                color: BaseColors.textPrimary,
                                fontSize: 21,
                                fontFamily: 'NotoSansThai',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(20),
                      child: PrimaryButtonView(
                        onPressed: () => {},
                        title: 'สมัครสมาชิก',
                      ),
                    ),
                  ],
                ),
              ],
            ),
            actionsAlignment: MainAxisAlignment.start,
            actionsPadding: const EdgeInsets.all(20),
            actions: [
              AppCheckBox(
                value: _isCheckBox.value,
                onChanged: (value) => onTapCheckBox(value ?? false),
                fillColor: _isCheckBox.value == false
                    ? MaterialStateProperty.all(BaseColors.textContent)
                    : MaterialStateProperty.all(BaseColors.actived),
              ),
              const Text(
                'ไม่ต้องแสดงกล่องข้อความนี้อีก',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: BaseSizes.fontBody1,
                  fontFamily: 'NotoSansThai',
                ),
              )
            ],
          ),
        );
      },
    );
  }

  void onTapCheckBox(bool value) {
    _isCheckBox.value = value;
  }
}
