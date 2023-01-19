import 'package:get/get.dart';
import 'package:lachule/bases/base_controller.dart';
import 'package:lachule/models/best_sell_goods_model.dart';
import 'package:lachule/models/promotion_model.dart';
import 'package:lachule/models/recommend_goods_medel.dart';

class HomeController extends BaseController {
  @override
  void onInit() {
    // TODO: implement onInit

    Future.delayed(const Duration(milliseconds: 2500), () {
      stopLoad();
    });
    super.onInit();
  }

  RxInt currentCarousel = 0.obs;
  String userFirstName = 'ดวงเดือน';
  String userLastName = 'ลัทธิพงศ์';

  // List

  List<String> imageCarousel = [
    'https://s3-alpha-sig.figma.com/img/04eb/1d0f/d9a28b59aa5b89ff2f7a59130c33015c?Expires=1674432000&Signature=EQLfhoaPxmArn5hAKAwv9utiA7RH4daqq6eQ7fWD4AKJ7RVSKZ078GWlOMKUaQu22eoztD4sB8or0uMWYVqQ40ZMNTZAkbSs1KC8Q6YV32hJuo6jNAH94r~B82e4mwutiS8sPOa0ZaEcflyWwTFqlKMb1Ai1Y~TNpju48yBPNlMWbeXps2qYTAa5SIMYt7rI2cOgYs5frnXhTPq4seBX-x0f-I1MqfaeZa4PtOTRVs5YLiNVcTAibvejDPYyfCgg2aEfAbaXlhhb4-NyOenMqECZTlpLgUOx5l1YPk8tfeZeazBue6Y08fzrQ0ya9mhooibZw6R8v8r3xsOYxzxC-A__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
    'https://docs.flutter.dev/assets/images/shared/brand/flutter/logo/flutter-lockup.png',
    'https://s3-alpha-sig.figma.com/img/04eb/1d0f/d9a28b59aa5b89ff2f7a59130c33015c?Expires=1674432000&Signature=EQLfhoaPxmArn5hAKAwv9utiA7RH4daqq6eQ7fWD4AKJ7RVSKZ078GWlOMKUaQu22eoztD4sB8or0uMWYVqQ40ZMNTZAkbSs1KC8Q6YV32hJuo6jNAH94r~B82e4mwutiS8sPOa0ZaEcflyWwTFqlKMb1Ai1Y~TNpju48yBPNlMWbeXps2qYTAa5SIMYt7rI2cOgYs5frnXhTPq4seBX-x0f-I1MqfaeZa4PtOTRVs5YLiNVcTAibvejDPYyfCgg2aEfAbaXlhhb4-NyOenMqECZTlpLgUOx5l1YPk8tfeZeazBue6Y08fzrQ0ya9mhooibZw6R8v8r3xsOYxzxC-A__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
    'https://s3-alpha-sig.figma.com/img/04eb/1d0f/d9a28b59aa5b89ff2f7a59130c33015c?Expires=1674432000&Signature=EQLfhoaPxmArn5hAKAwv9utiA7RH4daqq6eQ7fWD4AKJ7RVSKZ078GWlOMKUaQu22eoztD4sB8or0uMWYVqQ40ZMNTZAkbSs1KC8Q6YV32hJuo6jNAH94r~B82e4mwutiS8sPOa0ZaEcflyWwTFqlKMb1Ai1Y~TNpju48yBPNlMWbeXps2qYTAa5SIMYt7rI2cOgYs5frnXhTPq4seBX-x0f-I1MqfaeZa4PtOTRVs5YLiNVcTAibvejDPYyfCgg2aEfAbaXlhhb4-NyOenMqECZTlpLgUOx5l1YPk8tfeZeazBue6Y08fzrQ0ya9mhooibZw6R8v8r3xsOYxzxC-A__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
    'https://s3-alpha-sig.figma.com/img/04eb/1d0f/d9a28b59aa5b89ff2f7a59130c33015c?Expires=1674432000&Signature=EQLfhoaPxmArn5hAKAwv9utiA7RH4daqq6eQ7fWD4AKJ7RVSKZ078GWlOMKUaQu22eoztD4sB8or0uMWYVqQ40ZMNTZAkbSs1KC8Q6YV32hJuo6jNAH94r~B82e4mwutiS8sPOa0ZaEcflyWwTFqlKMb1Ai1Y~TNpju48yBPNlMWbeXps2qYTAa5SIMYt7rI2cOgYs5frnXhTPq4seBX-x0f-I1MqfaeZa4PtOTRVs5YLiNVcTAibvejDPYyfCgg2aEfAbaXlhhb4-NyOenMqECZTlpLgUOx5l1YPk8tfeZeazBue6Y08fzrQ0ya9mhooibZw6R8v8r3xsOYxzxC-A__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
  ];
  final List<PromotionModel> _promotionList = [
    PromotionModel(
      id: '1',
      image:
          'https://s3-alpha-sig.figma.com/img/f183/300a/727e94c90c923dfc3091ac83d14723e0?Expires=1674432000&Signature=SKKuhn-hNsb5fgAd3fI8y3vPRHrSbvgtSjocBrXV3TK-llkfmi1gJgkFM~HHwYLtEr5ju1fbg6twAtfPHi30w0oJDOiPPNgIodAXTgFOCwdNaQ85rQVOwozfS2CA8jsNmjWZ3zjgBqK9MwyAGJhIFXkUEWNLNuSl-nPM7vS31oJ0iUhHFjIfx0lkpnRLNm5FWIX12eJf6H25OHKMTlp9HLakIEYts58rl1EMgXLlT~CROvqwbxecdhkjJ4-SGgti7OkoQunVARjHtrD2gvipBr02GKOghC5yrGP5GKn0csEAOPUWsXkHUMDSRQxKr-~tHonGYvZulISqAbQZPfCbyA__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
      title: 'โปรโมชั่นเดือนพฤศจิกายน 2565',
    ),
    PromotionModel(
      id: '2',
      image:
          'https://s3-alpha-sig.figma.com/img/ec0f/785c/f52ccf76baa8ed2aad2586c5383e2ccb?Expires=1674432000&Signature=PNnu1r8A-1GpOOAba7xPgGRHNld9NzeZYKL-smXibLn6FTE00zSI4N-rYiC6f7nasEqlemcuVKdeboqmwFl2XOngci18V~9ZYtxkRXTMwl6VgdeIR4TUkd8VbJRul0FxRyQ2Q2gwsvYmqzvzB5AUd4ycIiCBJp013XoSiVp10XkBzP4W8T4pEeRtFBwp6vxa6DAKif12YtB~qz0FbwZNN5IxZSVahpcsSuvMOWZ0FFIMbcZD4WLfurpaDLEn4RJ3Migq6DrCTjkINDASdoUzVD4q3DKhaaDy5dFoCbgda09XaraZQ7s55yWukuvSxfeQm2BzJb60UbI~~8yMZb8ttg__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
      title: 'โปรโมชั่นเดือนตุลาคม 2565',
    ),
    PromotionModel(
      id: '3',
      image:
          'https://s3-alpha-sig.figma.com/img/2649/e380/687e8ba152d21a5a2222b4dba1bb29e7?Expires=1674432000&Signature=RcQPhXjkko7I~j67bOeY-PdpctyxgHWaKg5bvHrv2Rwzq2ZgpBrnImUvVstP3cOfA2BabWd94qyQy0FOktDHpJ6Ov2cXpIe4ZDfIQxO81Ya3yUcVWWagWCXX-Zu7EUKW~Ya1XHhIkpege9qH2OW0sOB1h4CHV9XjqX7uAe~RZ6uxUhBykSnKO8SCzwE50aVqVZ3z2EY3LV9IgH0Sbkw-BmwnRSQT0HAwg116MnR2y-OSrILk5XOIaOHp6x145PkyzV6Jzy~ibGd8Alpwd7RjRoYDfYZ9KANKYatI49gN2f7~leON-Ekngw4l5bKEFwjUYVTCxtz4K9vSCvVp002GXw__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
      title: 'โปรโมชั่นเดือนตุลาคม 2565',
    ),
    PromotionModel(
      id: '4',
      image:
          'https://s3-alpha-sig.figma.com/img/f183/300a/727e94c90c923dfc3091ac83d14723e0?Expires=1674432000&Signature=SKKuhn-hNsb5fgAd3fI8y3vPRHrSbvgtSjocBrXV3TK-llkfmi1gJgkFM~HHwYLtEr5ju1fbg6twAtfPHi30w0oJDOiPPNgIodAXTgFOCwdNaQ85rQVOwozfS2CA8jsNmjWZ3zjgBqK9MwyAGJhIFXkUEWNLNuSl-nPM7vS31oJ0iUhHFjIfx0lkpnRLNm5FWIX12eJf6H25OHKMTlp9HLakIEYts58rl1EMgXLlT~CROvqwbxecdhkjJ4-SGgti7OkoQunVARjHtrD2gvipBr02GKOghC5yrGP5GKn0csEAOPUWsXkHUMDSRQxKr-~tHonGYvZulISqAbQZPfCbyA__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
      title: 'โปรโมชั่นเดือนพฤศจิกายน 2565',
    ),
    PromotionModel(
      id: '5',
      image:
          'https://s3-alpha-sig.figma.com/img/ec0f/785c/f52ccf76baa8ed2aad2586c5383e2ccb?Expires=1674432000&Signature=PNnu1r8A-1GpOOAba7xPgGRHNld9NzeZYKL-smXibLn6FTE00zSI4N-rYiC6f7nasEqlemcuVKdeboqmwFl2XOngci18V~9ZYtxkRXTMwl6VgdeIR4TUkd8VbJRul0FxRyQ2Q2gwsvYmqzvzB5AUd4ycIiCBJp013XoSiVp10XkBzP4W8T4pEeRtFBwp6vxa6DAKif12YtB~qz0FbwZNN5IxZSVahpcsSuvMOWZ0FFIMbcZD4WLfurpaDLEn4RJ3Migq6DrCTjkINDASdoUzVD4q3DKhaaDy5dFoCbgda09XaraZQ7s55yWukuvSxfeQm2BzJb60UbI~~8yMZb8ttg__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
      title: 'โปรโมชั่นเดือนตุลาคม 2565',
    ),
  ];

  final List<BestSellGoodsModel> _bestSellGoodsList = [
    BestSellGoodsModel(
      id: '1',
      image:
          'https://s3-alpha-sig.figma.com/img/3882/55bc/dafa8fbfd8ac49059021da6fe48915a5?Expires=1674432000&Signature=psRgkwlmJd9jsqnI3ozvK820Frd-sAnrwnxZiDa-zBMyZBmpjIoukz7z8k3nDH7qnB~pwm2mZudo5fHdAUgRosDTlI6cISsGogEMODKBrMdeYkPJC~-yJ8KmWp~cgoMywa1AUbcj3MK7G8myEdLOgsH7ICdBiKekkLwm3K8aMqASSI0OskYioQvXWBpYRSBD6Ugd5Emygpx186QycvvmFWp0JtAskRW3kHRKkMxZ8h1fVZcnUVzadZjiNDTuppmT3imiuSVgprK4I1DOwRAPzHMiL96ZohMsk5HgS7hRyEWvr2o05IgRydH~bOIYFACbWwRaZLEZfAiJf4bTTB~DiA__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
      title: 'นาโน แอคเน่ ครีม จีพีโฟร์จี',
    ),
    BestSellGoodsModel(
      id: '2',
      image:
          'https://s3-alpha-sig.figma.com/img/b1ba/e3e3/34e6da74237e9f02d71af77e00c00aa6?Expires=1674432000&Signature=N1AuNnAVvPekN5z9EJjn~0E96dWzlSXHEqPttbbO8g9jZIwJtzfyRxMSsSGOq~pYaf9e1ka65Alr7Kf9ZUOroYYSf-cmw4P4AYcBlvbHL0xYEm5CxTI02xU72BbQdxgRsSFG31hxN76hLU3C05xrHTPcKM5mAua9tEczJWoNNBFE8nWlKKQbKD-BJVBJ5zohNb6537guFsqisLf6A7IYd2uoXtWTVCiSkHFwI4uKKE4uqTD6HsMPElT9V2FEHEP~yYo3weCrV0vbE~Ekfs-V1Ce2bSkNEj95s9fzdRx7QjhRVIE3pbdZkDevTpdcBR3yys2XHXjeCqvstYeO3FnZTw__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
      title: 'นาโน ซันสกรีน ครีม จีพีโฟร์จี SPF50 PA+++',
    ),
    BestSellGoodsModel(
      id: '3',
      image:
          'https://s3-alpha-sig.figma.com/img/c6bd/6576/b231e24ca192573b43b8b94eac4590db?Expires=1674432000&Signature=VAXZl398yU2ySxQDfIYCyNQ1YUCum4NNIF4bjztfANPd2HSJhgwhqK9taLprsrKpKULucb6qOCDy0zRnPSBjJdMEtZkzTztLnYbVD2EzCNehPUzBMtR6wnxJE-F2sV2lB2-OHiowK9QNHsdHRaBcyj6mni5k7aA3w9T9ZBjRQ~zAo95bf4VCjtD7gQpJiQMltHmd~8YSlyX7z1hnXPUMfzdDm6-IkYh9aeeJ9cd79rxHLtwh41S8VzbFzkxv--kb6C8OiZzvbjqQihSWR68bcGS-EplfnK7B6fkVd6N9vhY1kQY7w8rS6x7CCm32d2E673jOPlni9gXbKhqGTD35AQ__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
      title: 'นาโน มอยส์เจอร์ไรเซอร์ ครีม จีพีโฟร์จี',
    ),
    BestSellGoodsModel(
      id: '4',
      image:
          'https://s3-alpha-sig.figma.com/img/3882/55bc/dafa8fbfd8ac49059021da6fe48915a5?Expires=1674432000&Signature=psRgkwlmJd9jsqnI3ozvK820Frd-sAnrwnxZiDa-zBMyZBmpjIoukz7z8k3nDH7qnB~pwm2mZudo5fHdAUgRosDTlI6cISsGogEMODKBrMdeYkPJC~-yJ8KmWp~cgoMywa1AUbcj3MK7G8myEdLOgsH7ICdBiKekkLwm3K8aMqASSI0OskYioQvXWBpYRSBD6Ugd5Emygpx186QycvvmFWp0JtAskRW3kHRKkMxZ8h1fVZcnUVzadZjiNDTuppmT3imiuSVgprK4I1DOwRAPzHMiL96ZohMsk5HgS7hRyEWvr2o05IgRydH~bOIYFACbWwRaZLEZfAiJf4bTTB~DiA__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
      title: 'นาโน แอคเน่ ครีม จีพีโฟร์จี',
    ),
    BestSellGoodsModel(
      id: '5',
      image:
          'https://s3-alpha-sig.figma.com/img/b1ba/e3e3/34e6da74237e9f02d71af77e00c00aa6?Expires=1674432000&Signature=N1AuNnAVvPekN5z9EJjn~0E96dWzlSXHEqPttbbO8g9jZIwJtzfyRxMSsSGOq~pYaf9e1ka65Alr7Kf9ZUOroYYSf-cmw4P4AYcBlvbHL0xYEm5CxTI02xU72BbQdxgRsSFG31hxN76hLU3C05xrHTPcKM5mAua9tEczJWoNNBFE8nWlKKQbKD-BJVBJ5zohNb6537guFsqisLf6A7IYd2uoXtWTVCiSkHFwI4uKKE4uqTD6HsMPElT9V2FEHEP~yYo3weCrV0vbE~Ekfs-V1Ce2bSkNEj95s9fzdRx7QjhRVIE3pbdZkDevTpdcBR3yys2XHXjeCqvstYeO3FnZTw__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
      title: 'นาโน ซันสกรีน ครีม จีพีโฟร์จี SPF50 PA+++',
    ),
    BestSellGoodsModel(
      id: '6',
      image:
          'https://s3-alpha-sig.figma.com/img/c6bd/6576/b231e24ca192573b43b8b94eac4590db?Expires=1674432000&Signature=VAXZl398yU2ySxQDfIYCyNQ1YUCum4NNIF4bjztfANPd2HSJhgwhqK9taLprsrKpKULucb6qOCDy0zRnPSBjJdMEtZkzTztLnYbVD2EzCNehPUzBMtR6wnxJE-F2sV2lB2-OHiowK9QNHsdHRaBcyj6mni5k7aA3w9T9ZBjRQ~zAo95bf4VCjtD7gQpJiQMltHmd~8YSlyX7z1hnXPUMfzdDm6-IkYh9aeeJ9cd79rxHLtwh41S8VzbFzkxv--kb6C8OiZzvbjqQihSWR68bcGS-EplfnK7B6fkVd6N9vhY1kQY7w8rS6x7CCm32d2E673jOPlni9gXbKhqGTD35AQ__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
      title: 'นาโน มอยส์เจอร์ไรเซอร์ ครีม จีพีโฟร์จี',
    ),
    BestSellGoodsModel(
      id: '7',
      image:
          'https://s3-alpha-sig.figma.com/img/3882/55bc/dafa8fbfd8ac49059021da6fe48915a5?Expires=1674432000&Signature=psRgkwlmJd9jsqnI3ozvK820Frd-sAnrwnxZiDa-zBMyZBmpjIoukz7z8k3nDH7qnB~pwm2mZudo5fHdAUgRosDTlI6cISsGogEMODKBrMdeYkPJC~-yJ8KmWp~cgoMywa1AUbcj3MK7G8myEdLOgsH7ICdBiKekkLwm3K8aMqASSI0OskYioQvXWBpYRSBD6Ugd5Emygpx186QycvvmFWp0JtAskRW3kHRKkMxZ8h1fVZcnUVzadZjiNDTuppmT3imiuSVgprK4I1DOwRAPzHMiL96ZohMsk5HgS7hRyEWvr2o05IgRydH~bOIYFACbWwRaZLEZfAiJf4bTTB~DiA__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
      title: 'นาโน แอคเน่ ครีม จีพีโฟร์จี',
    ),
    BestSellGoodsModel(
      id: '8',
      image:
          'https://s3-alpha-sig.figma.com/img/b1ba/e3e3/34e6da74237e9f02d71af77e00c00aa6?Expires=1674432000&Signature=N1AuNnAVvPekN5z9EJjn~0E96dWzlSXHEqPttbbO8g9jZIwJtzfyRxMSsSGOq~pYaf9e1ka65Alr7Kf9ZUOroYYSf-cmw4P4AYcBlvbHL0xYEm5CxTI02xU72BbQdxgRsSFG31hxN76hLU3C05xrHTPcKM5mAua9tEczJWoNNBFE8nWlKKQbKD-BJVBJ5zohNb6537guFsqisLf6A7IYd2uoXtWTVCiSkHFwI4uKKE4uqTD6HsMPElT9V2FEHEP~yYo3weCrV0vbE~Ekfs-V1Ce2bSkNEj95s9fzdRx7QjhRVIE3pbdZkDevTpdcBR3yys2XHXjeCqvstYeO3FnZTw__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
      title: 'นาโน ซันสกรีน ครีม จีพีโฟร์จี SPF50 PA+++',
    ),
    BestSellGoodsModel(
      id: '9',
      image:
          'https://s3-alpha-sig.figma.com/img/c6bd/6576/b231e24ca192573b43b8b94eac4590db?Expires=1674432000&Signature=VAXZl398yU2ySxQDfIYCyNQ1YUCum4NNIF4bjztfANPd2HSJhgwhqK9taLprsrKpKULucb6qOCDy0zRnPSBjJdMEtZkzTztLnYbVD2EzCNehPUzBMtR6wnxJE-F2sV2lB2-OHiowK9QNHsdHRaBcyj6mni5k7aA3w9T9ZBjRQ~zAo95bf4VCjtD7gQpJiQMltHmd~8YSlyX7z1hnXPUMfzdDm6-IkYh9aeeJ9cd79rxHLtwh41S8VzbFzkxv--kb6C8OiZzvbjqQihSWR68bcGS-EplfnK7B6fkVd6N9vhY1kQY7w8rS6x7CCm32d2E673jOPlni9gXbKhqGTD35AQ__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
      title: 'นาโน มอยส์เจอร์ไรเซอร์ ครีม จีพีโฟร์จี',
    ),
    BestSellGoodsModel(
      id: '10',
      image:
          'https://s3-alpha-sig.figma.com/img/3882/55bc/dafa8fbfd8ac49059021da6fe48915a5?Expires=1674432000&Signature=psRgkwlmJd9jsqnI3ozvK820Frd-sAnrwnxZiDa-zBMyZBmpjIoukz7z8k3nDH7qnB~pwm2mZudo5fHdAUgRosDTlI6cISsGogEMODKBrMdeYkPJC~-yJ8KmWp~cgoMywa1AUbcj3MK7G8myEdLOgsH7ICdBiKekkLwm3K8aMqASSI0OskYioQvXWBpYRSBD6Ugd5Emygpx186QycvvmFWp0JtAskRW3kHRKkMxZ8h1fVZcnUVzadZjiNDTuppmT3imiuSVgprK4I1DOwRAPzHMiL96ZohMsk5HgS7hRyEWvr2o05IgRydH~bOIYFACbWwRaZLEZfAiJf4bTTB~DiA__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
      title: 'นาโน แอคเน่ ครีม จีพีโฟร์จี',
    ),
  ];

  final List<RecommendGoodsModel> _recommendGoodsList = [
    RecommendGoodsModel(
      id: '1',
      image:
          'https://s3-alpha-sig.figma.com/img/a17a/46a0/b61f2b377247d188d42ad343ccddb317?Expires=1674432000&Signature=i2jBQBhnTVhml3Pxtv14FVT1lCZP1BRysAtcjRSErGU4SFEkuKqRifR7T~STRSig~QLpYe7DFm6iRYAblPQQUzUAWLmllzc8xR-jHGwkrUqP9cuSmG8cU~UlYgKFq~RcXPnDXCaOVq4beE0CVtYF0VfCIFXWOfgstTaurJxTNvGLnFD9V120Q98WMbDW6ovgDb5MoZ68-MYPGn74atkrT4uTQ9Ezu1MoXD4Q9qzywRM~Oqa8-59E4iAYeAFP5Lj1LvWlPnbpRTzd1afMiQTbOfx7q0timK5hEVxezqCSLDNUGw0kNiDPhrPyPy1xciXl1qQdzFnujwF0hJ21EZ8yvw__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
      title: 'นาโน ไวท์เทนนิ่ง โซฟ จีพีโฟร์จี',
    ),
    RecommendGoodsModel(
      id: '2',
      image:
          'https://s3-alpha-sig.figma.com/img/08e8/7fe3/8ba2c1655c9d9cea10697c6e58862f7b?Expires=1674432000&Signature=mVpU0bYmiqc6yOd2UOuouAdG97W8Voa77nXT-xBD80qJ3m90JQZoWQ2VogexPFY3WQajzzv-i8QDr41sVDO2vQQpFWEdM9Bi0TLtyU4KhUrqIUa8bIsBX3iW1XgQaW9agAk12tW2L6Vcsd71ULG2wNUxVpGHq5aFR9xaKAwbIO6slZXyYm36BR~PX3VnnPFbG8HEwjeePXQroTw2jyV60ci3jzoUGfMu3ZUpLKwpDSyaF9JShe-C8jNbbR6DZyL3rI9EZECtl2F~muja8QsQbT5wVz2DmQviI-v~t1eWFDomKSUBN2loBZqukEdr0kCMZFRgJJvKO6ZlXJI6RVdLJg__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
      title: 'คอมแพค พาวเดอร์',
    ),
    RecommendGoodsModel(
      id: '3',
      image:
          'https://s3-alpha-sig.figma.com/img/25b4/a6a3/3534ecc797a82bba2a7bc30315dc5dca?Expires=1674432000&Signature=cy8NllJ4p9WABYEgQhQVTwRdn7o5-hp~7gTFLYZNRQWyeWDd24uTTFmHgIVQ724KJ-EtVHo1uo38JRxVWUFigvBDdwcqxU0ib0YhLOJXopxGpdhX6hWlSGALH8Ho~CsAZZqTHMsYxBzedxvVB77BOd7fNchVd7~8APg0EPOjB0vZszymPLOv4Uqs7joZf0D3lWId7kGr2ruIoaKtusLf4nx21yasePAqCHj82YPPX1JVZSHPWbJJR0B1MEf5XnQF5rOO30-KWTaJygRhNnWNBwZ-~oIf1IFLagBuRd832XxUI9mV-J3nLJYQk0oJSNBcVPi5Lx2UH8-UYd0lPHjI1w__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
      title: 'บูสเตอร์ มาส์ก',
    ),
    RecommendGoodsModel(
      id: '4',
      image:
          'https://s3-alpha-sig.figma.com/img/a17a/46a0/b61f2b377247d188d42ad343ccddb317?Expires=1674432000&Signature=i2jBQBhnTVhml3Pxtv14FVT1lCZP1BRysAtcjRSErGU4SFEkuKqRifR7T~STRSig~QLpYe7DFm6iRYAblPQQUzUAWLmllzc8xR-jHGwkrUqP9cuSmG8cU~UlYgKFq~RcXPnDXCaOVq4beE0CVtYF0VfCIFXWOfgstTaurJxTNvGLnFD9V120Q98WMbDW6ovgDb5MoZ68-MYPGn74atkrT4uTQ9Ezu1MoXD4Q9qzywRM~Oqa8-59E4iAYeAFP5Lj1LvWlPnbpRTzd1afMiQTbOfx7q0timK5hEVxezqCSLDNUGw0kNiDPhrPyPy1xciXl1qQdzFnujwF0hJ21EZ8yvw__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
      title: 'นาโน ไวท์เทนนิ่ง โซฟ จีพีโฟร์จี',
    ),
    RecommendGoodsModel(
      id: '5',
      image:
          'https://s3-alpha-sig.figma.com/img/08e8/7fe3/8ba2c1655c9d9cea10697c6e58862f7b?Expires=1674432000&Signature=mVpU0bYmiqc6yOd2UOuouAdG97W8Voa77nXT-xBD80qJ3m90JQZoWQ2VogexPFY3WQajzzv-i8QDr41sVDO2vQQpFWEdM9Bi0TLtyU4KhUrqIUa8bIsBX3iW1XgQaW9agAk12tW2L6Vcsd71ULG2wNUxVpGHq5aFR9xaKAwbIO6slZXyYm36BR~PX3VnnPFbG8HEwjeePXQroTw2jyV60ci3jzoUGfMu3ZUpLKwpDSyaF9JShe-C8jNbbR6DZyL3rI9EZECtl2F~muja8QsQbT5wVz2DmQviI-v~t1eWFDomKSUBN2loBZqukEdr0kCMZFRgJJvKO6ZlXJI6RVdLJg__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
      title: 'คอมแพค พาวเดอร์',
    ),
    RecommendGoodsModel(
      id: '6',
      image:
          'https://s3-alpha-sig.figma.com/img/25b4/a6a3/3534ecc797a82bba2a7bc30315dc5dca?Expires=1674432000&Signature=cy8NllJ4p9WABYEgQhQVTwRdn7o5-hp~7gTFLYZNRQWyeWDd24uTTFmHgIVQ724KJ-EtVHo1uo38JRxVWUFigvBDdwcqxU0ib0YhLOJXopxGpdhX6hWlSGALH8Ho~CsAZZqTHMsYxBzedxvVB77BOd7fNchVd7~8APg0EPOjB0vZszymPLOv4Uqs7joZf0D3lWId7kGr2ruIoaKtusLf4nx21yasePAqCHj82YPPX1JVZSHPWbJJR0B1MEf5XnQF5rOO30-KWTaJygRhNnWNBwZ-~oIf1IFLagBuRd832XxUI9mV-J3nLJYQk0oJSNBcVPi5Lx2UH8-UYd0lPHjI1w__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
      title: 'บูสเตอร์ มาส์ก',
    ),
    RecommendGoodsModel(
      id: '7',
      image:
          'https://s3-alpha-sig.figma.com/img/a17a/46a0/b61f2b377247d188d42ad343ccddb317?Expires=1674432000&Signature=i2jBQBhnTVhml3Pxtv14FVT1lCZP1BRysAtcjRSErGU4SFEkuKqRifR7T~STRSig~QLpYe7DFm6iRYAblPQQUzUAWLmllzc8xR-jHGwkrUqP9cuSmG8cU~UlYgKFq~RcXPnDXCaOVq4beE0CVtYF0VfCIFXWOfgstTaurJxTNvGLnFD9V120Q98WMbDW6ovgDb5MoZ68-MYPGn74atkrT4uTQ9Ezu1MoXD4Q9qzywRM~Oqa8-59E4iAYeAFP5Lj1LvWlPnbpRTzd1afMiQTbOfx7q0timK5hEVxezqCSLDNUGw0kNiDPhrPyPy1xciXl1qQdzFnujwF0hJ21EZ8yvw__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
      title: 'นาโน ไวท์เทนนิ่ง โซฟ จีพีโฟร์จี',
    ),
    RecommendGoodsModel(
      id: '8',
      image:
          'https://s3-alpha-sig.figma.com/img/08e8/7fe3/8ba2c1655c9d9cea10697c6e58862f7b?Expires=1674432000&Signature=mVpU0bYmiqc6yOd2UOuouAdG97W8Voa77nXT-xBD80qJ3m90JQZoWQ2VogexPFY3WQajzzv-i8QDr41sVDO2vQQpFWEdM9Bi0TLtyU4KhUrqIUa8bIsBX3iW1XgQaW9agAk12tW2L6Vcsd71ULG2wNUxVpGHq5aFR9xaKAwbIO6slZXyYm36BR~PX3VnnPFbG8HEwjeePXQroTw2jyV60ci3jzoUGfMu3ZUpLKwpDSyaF9JShe-C8jNbbR6DZyL3rI9EZECtl2F~muja8QsQbT5wVz2DmQviI-v~t1eWFDomKSUBN2loBZqukEdr0kCMZFRgJJvKO6ZlXJI6RVdLJg__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
      title: 'คอมแพค พาวเดอร์',
    ),
    RecommendGoodsModel(
      id: '9',
      image:
          'https://s3-alpha-sig.figma.com/img/25b4/a6a3/3534ecc797a82bba2a7bc30315dc5dca?Expires=1674432000&Signature=cy8NllJ4p9WABYEgQhQVTwRdn7o5-hp~7gTFLYZNRQWyeWDd24uTTFmHgIVQ724KJ-EtVHo1uo38JRxVWUFigvBDdwcqxU0ib0YhLOJXopxGpdhX6hWlSGALH8Ho~CsAZZqTHMsYxBzedxvVB77BOd7fNchVd7~8APg0EPOjB0vZszymPLOv4Uqs7joZf0D3lWId7kGr2ruIoaKtusLf4nx21yasePAqCHj82YPPX1JVZSHPWbJJR0B1MEf5XnQF5rOO30-KWTaJygRhNnWNBwZ-~oIf1IFLagBuRd832XxUI9mV-J3nLJYQk0oJSNBcVPi5Lx2UH8-UYd0lPHjI1w__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
      title: 'บูสเตอร์ มาส์ก',
    ),
    RecommendGoodsModel(
      id: '10',
      image:
          'https://s3-alpha-sig.figma.com/img/a17a/46a0/b61f2b377247d188d42ad343ccddb317?Expires=1674432000&Signature=i2jBQBhnTVhml3Pxtv14FVT1lCZP1BRysAtcjRSErGU4SFEkuKqRifR7T~STRSig~QLpYe7DFm6iRYAblPQQUzUAWLmllzc8xR-jHGwkrUqP9cuSmG8cU~UlYgKFq~RcXPnDXCaOVq4beE0CVtYF0VfCIFXWOfgstTaurJxTNvGLnFD9V120Q98WMbDW6ovgDb5MoZ68-MYPGn74atkrT4uTQ9Ezu1MoXD4Q9qzywRM~Oqa8-59E4iAYeAFP5Lj1LvWlPnbpRTzd1afMiQTbOfx7q0timK5hEVxezqCSLDNUGw0kNiDPhrPyPy1xciXl1qQdzFnujwF0hJ21EZ8yvw__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
      title: 'นาโน ไวท์เทนนิ่ง โซฟ จีพีโฟร์จี',
    ),
    RecommendGoodsModel(
      id: '11',
      image:
          'https://s3-alpha-sig.figma.com/img/08e8/7fe3/8ba2c1655c9d9cea10697c6e58862f7b?Expires=1674432000&Signature=mVpU0bYmiqc6yOd2UOuouAdG97W8Voa77nXT-xBD80qJ3m90JQZoWQ2VogexPFY3WQajzzv-i8QDr41sVDO2vQQpFWEdM9Bi0TLtyU4KhUrqIUa8bIsBX3iW1XgQaW9agAk12tW2L6Vcsd71ULG2wNUxVpGHq5aFR9xaKAwbIO6slZXyYm36BR~PX3VnnPFbG8HEwjeePXQroTw2jyV60ci3jzoUGfMu3ZUpLKwpDSyaF9JShe-C8jNbbR6DZyL3rI9EZECtl2F~muja8QsQbT5wVz2DmQviI-v~t1eWFDomKSUBN2loBZqukEdr0kCMZFRgJJvKO6ZlXJI6RVdLJg__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
      title: 'คอมแพค พาวเดอร์',
    ),
    RecommendGoodsModel(
      id: '12',
      image:
          'https://s3-alpha-sig.figma.com/img/25b4/a6a3/3534ecc797a82bba2a7bc30315dc5dca?Expires=1674432000&Signature=cy8NllJ4p9WABYEgQhQVTwRdn7o5-hp~7gTFLYZNRQWyeWDd24uTTFmHgIVQ724KJ-EtVHo1uo38JRxVWUFigvBDdwcqxU0ib0YhLOJXopxGpdhX6hWlSGALH8Ho~CsAZZqTHMsYxBzedxvVB77BOd7fNchVd7~8APg0EPOjB0vZszymPLOv4Uqs7joZf0D3lWId7kGr2ruIoaKtusLf4nx21yasePAqCHj82YPPX1JVZSHPWbJJR0B1MEf5XnQF5rOO30-KWTaJygRhNnWNBwZ-~oIf1IFLagBuRd832XxUI9mV-J3nLJYQk0oJSNBcVPi5Lx2UH8-UYd0lPHjI1w__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
      title: 'บูสเตอร์ มาส์ก',
    ),
    RecommendGoodsModel(
      id: '13',
      image:
          'https://s3-alpha-sig.figma.com/img/a17a/46a0/b61f2b377247d188d42ad343ccddb317?Expires=1674432000&Signature=i2jBQBhnTVhml3Pxtv14FVT1lCZP1BRysAtcjRSErGU4SFEkuKqRifR7T~STRSig~QLpYe7DFm6iRYAblPQQUzUAWLmllzc8xR-jHGwkrUqP9cuSmG8cU~UlYgKFq~RcXPnDXCaOVq4beE0CVtYF0VfCIFXWOfgstTaurJxTNvGLnFD9V120Q98WMbDW6ovgDb5MoZ68-MYPGn74atkrT4uTQ9Ezu1MoXD4Q9qzywRM~Oqa8-59E4iAYeAFP5Lj1LvWlPnbpRTzd1afMiQTbOfx7q0timK5hEVxezqCSLDNUGw0kNiDPhrPyPy1xciXl1qQdzFnujwF0hJ21EZ8yvw__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
      title: 'นาโน ไวท์เทนนิ่ง โซฟ จีพีโฟร์จี',
    ),
    RecommendGoodsModel(
      id: '14',
      image:
          'https://s3-alpha-sig.figma.com/img/08e8/7fe3/8ba2c1655c9d9cea10697c6e58862f7b?Expires=1674432000&Signature=mVpU0bYmiqc6yOd2UOuouAdG97W8Voa77nXT-xBD80qJ3m90JQZoWQ2VogexPFY3WQajzzv-i8QDr41sVDO2vQQpFWEdM9Bi0TLtyU4KhUrqIUa8bIsBX3iW1XgQaW9agAk12tW2L6Vcsd71ULG2wNUxVpGHq5aFR9xaKAwbIO6slZXyYm36BR~PX3VnnPFbG8HEwjeePXQroTw2jyV60ci3jzoUGfMu3ZUpLKwpDSyaF9JShe-C8jNbbR6DZyL3rI9EZECtl2F~muja8QsQbT5wVz2DmQviI-v~t1eWFDomKSUBN2loBZqukEdr0kCMZFRgJJvKO6ZlXJI6RVdLJg__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
      title: 'คอมแพค พาวเดอร์',
    ),
    RecommendGoodsModel(
      id: '15',
      image:
          'https://s3-alpha-sig.figma.com/img/25b4/a6a3/3534ecc797a82bba2a7bc30315dc5dca?Expires=1674432000&Signature=cy8NllJ4p9WABYEgQhQVTwRdn7o5-hp~7gTFLYZNRQWyeWDd24uTTFmHgIVQ724KJ-EtVHo1uo38JRxVWUFigvBDdwcqxU0ib0YhLOJXopxGpdhX6hWlSGALH8Ho~CsAZZqTHMsYxBzedxvVB77BOd7fNchVd7~8APg0EPOjB0vZszymPLOv4Uqs7joZf0D3lWId7kGr2ruIoaKtusLf4nx21yasePAqCHj82YPPX1JVZSHPWbJJR0B1MEf5XnQF5rOO30-KWTaJygRhNnWNBwZ-~oIf1IFLagBuRd832XxUI9mV-J3nLJYQk0oJSNBcVPi5Lx2UH8-UYd0lPHjI1w__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
      title: 'บูสเตอร์ มาส์ก',
    ),
    RecommendGoodsModel(
      id: '16',
      image:
          'https://s3-alpha-sig.figma.com/img/a17a/46a0/b61f2b377247d188d42ad343ccddb317?Expires=1674432000&Signature=i2jBQBhnTVhml3Pxtv14FVT1lCZP1BRysAtcjRSErGU4SFEkuKqRifR7T~STRSig~QLpYe7DFm6iRYAblPQQUzUAWLmllzc8xR-jHGwkrUqP9cuSmG8cU~UlYgKFq~RcXPnDXCaOVq4beE0CVtYF0VfCIFXWOfgstTaurJxTNvGLnFD9V120Q98WMbDW6ovgDb5MoZ68-MYPGn74atkrT4uTQ9Ezu1MoXD4Q9qzywRM~Oqa8-59E4iAYeAFP5Lj1LvWlPnbpRTzd1afMiQTbOfx7q0timK5hEVxezqCSLDNUGw0kNiDPhrPyPy1xciXl1qQdzFnujwF0hJ21EZ8yvw__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
      title: 'นาโน ไวท์เทนนิ่ง โซฟ จีพีโฟร์จี',
    ),
    RecommendGoodsModel(
      id: '17',
      image:
          'https://s3-alpha-sig.figma.com/img/08e8/7fe3/8ba2c1655c9d9cea10697c6e58862f7b?Expires=1674432000&Signature=mVpU0bYmiqc6yOd2UOuouAdG97W8Voa77nXT-xBD80qJ3m90JQZoWQ2VogexPFY3WQajzzv-i8QDr41sVDO2vQQpFWEdM9Bi0TLtyU4KhUrqIUa8bIsBX3iW1XgQaW9agAk12tW2L6Vcsd71ULG2wNUxVpGHq5aFR9xaKAwbIO6slZXyYm36BR~PX3VnnPFbG8HEwjeePXQroTw2jyV60ci3jzoUGfMu3ZUpLKwpDSyaF9JShe-C8jNbbR6DZyL3rI9EZECtl2F~muja8QsQbT5wVz2DmQviI-v~t1eWFDomKSUBN2loBZqukEdr0kCMZFRgJJvKO6ZlXJI6RVdLJg__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
      title: 'คอมแพค พาวเดอร์',
    ),
    RecommendGoodsModel(
      id: '18',
      image:
          'https://s3-alpha-sig.figma.com/img/25b4/a6a3/3534ecc797a82bba2a7bc30315dc5dca?Expires=1674432000&Signature=cy8NllJ4p9WABYEgQhQVTwRdn7o5-hp~7gTFLYZNRQWyeWDd24uTTFmHgIVQ724KJ-EtVHo1uo38JRxVWUFigvBDdwcqxU0ib0YhLOJXopxGpdhX6hWlSGALH8Ho~CsAZZqTHMsYxBzedxvVB77BOd7fNchVd7~8APg0EPOjB0vZszymPLOv4Uqs7joZf0D3lWId7kGr2ruIoaKtusLf4nx21yasePAqCHj82YPPX1JVZSHPWbJJR0B1MEf5XnQF5rOO30-KWTaJygRhNnWNBwZ-~oIf1IFLagBuRd832XxUI9mV-J3nLJYQk0oJSNBcVPi5Lx2UH8-UYd0lPHjI1w__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
      title: 'บูสเตอร์ มาส์ก',
    ),
    RecommendGoodsModel(
      id: '19',
      image:
          'https://s3-alpha-sig.figma.com/img/a17a/46a0/b61f2b377247d188d42ad343ccddb317?Expires=1674432000&Signature=i2jBQBhnTVhml3Pxtv14FVT1lCZP1BRysAtcjRSErGU4SFEkuKqRifR7T~STRSig~QLpYe7DFm6iRYAblPQQUzUAWLmllzc8xR-jHGwkrUqP9cuSmG8cU~UlYgKFq~RcXPnDXCaOVq4beE0CVtYF0VfCIFXWOfgstTaurJxTNvGLnFD9V120Q98WMbDW6ovgDb5MoZ68-MYPGn74atkrT4uTQ9Ezu1MoXD4Q9qzywRM~Oqa8-59E4iAYeAFP5Lj1LvWlPnbpRTzd1afMiQTbOfx7q0timK5hEVxezqCSLDNUGw0kNiDPhrPyPy1xciXl1qQdzFnujwF0hJ21EZ8yvw__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
      title: 'นาโน ไวท์เทนนิ่ง โซฟ จีพีโฟร์จี',
    ),
    RecommendGoodsModel(
      id: '20',
      image:
          'https://s3-alpha-sig.figma.com/img/08e8/7fe3/8ba2c1655c9d9cea10697c6e58862f7b?Expires=1674432000&Signature=mVpU0bYmiqc6yOd2UOuouAdG97W8Voa77nXT-xBD80qJ3m90JQZoWQ2VogexPFY3WQajzzv-i8QDr41sVDO2vQQpFWEdM9Bi0TLtyU4KhUrqIUa8bIsBX3iW1XgQaW9agAk12tW2L6Vcsd71ULG2wNUxVpGHq5aFR9xaKAwbIO6slZXyYm36BR~PX3VnnPFbG8HEwjeePXQroTw2jyV60ci3jzoUGfMu3ZUpLKwpDSyaF9JShe-C8jNbbR6DZyL3rI9EZECtl2F~muja8QsQbT5wVz2DmQviI-v~t1eWFDomKSUBN2loBZqukEdr0kCMZFRgJJvKO6ZlXJI6RVdLJg__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
      title: 'คอมแพค พาวเดอร์',
    ),
    RecommendGoodsModel(
      id: '21',
      image:
          'https://s3-alpha-sig.figma.com/img/25b4/a6a3/3534ecc797a82bba2a7bc30315dc5dca?Expires=1674432000&Signature=cy8NllJ4p9WABYEgQhQVTwRdn7o5-hp~7gTFLYZNRQWyeWDd24uTTFmHgIVQ724KJ-EtVHo1uo38JRxVWUFigvBDdwcqxU0ib0YhLOJXopxGpdhX6hWlSGALH8Ho~CsAZZqTHMsYxBzedxvVB77BOd7fNchVd7~8APg0EPOjB0vZszymPLOv4Uqs7joZf0D3lWId7kGr2ruIoaKtusLf4nx21yasePAqCHj82YPPX1JVZSHPWbJJR0B1MEf5XnQF5rOO30-KWTaJygRhNnWNBwZ-~oIf1IFLagBuRd832XxUI9mV-J3nLJYQk0oJSNBcVPi5Lx2UH8-UYd0lPHjI1w__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
      title: 'บูสเตอร์ มาส์ก',
    ),
    RecommendGoodsModel(
      id: '22',
      image:
          'https://s3-alpha-sig.figma.com/img/a17a/46a0/b61f2b377247d188d42ad343ccddb317?Expires=1674432000&Signature=i2jBQBhnTVhml3Pxtv14FVT1lCZP1BRysAtcjRSErGU4SFEkuKqRifR7T~STRSig~QLpYe7DFm6iRYAblPQQUzUAWLmllzc8xR-jHGwkrUqP9cuSmG8cU~UlYgKFq~RcXPnDXCaOVq4beE0CVtYF0VfCIFXWOfgstTaurJxTNvGLnFD9V120Q98WMbDW6ovgDb5MoZ68-MYPGn74atkrT4uTQ9Ezu1MoXD4Q9qzywRM~Oqa8-59E4iAYeAFP5Lj1LvWlPnbpRTzd1afMiQTbOfx7q0timK5hEVxezqCSLDNUGw0kNiDPhrPyPy1xciXl1qQdzFnujwF0hJ21EZ8yvw__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
      title: 'นาโน ไวท์เทนนิ่ง โซฟ จีพีโฟร์จี',
    ),
    RecommendGoodsModel(
      id: '23',
      image:
          'https://s3-alpha-sig.figma.com/img/08e8/7fe3/8ba2c1655c9d9cea10697c6e58862f7b?Expires=1674432000&Signature=mVpU0bYmiqc6yOd2UOuouAdG97W8Voa77nXT-xBD80qJ3m90JQZoWQ2VogexPFY3WQajzzv-i8QDr41sVDO2vQQpFWEdM9Bi0TLtyU4KhUrqIUa8bIsBX3iW1XgQaW9agAk12tW2L6Vcsd71ULG2wNUxVpGHq5aFR9xaKAwbIO6slZXyYm36BR~PX3VnnPFbG8HEwjeePXQroTw2jyV60ci3jzoUGfMu3ZUpLKwpDSyaF9JShe-C8jNbbR6DZyL3rI9EZECtl2F~muja8QsQbT5wVz2DmQviI-v~t1eWFDomKSUBN2loBZqukEdr0kCMZFRgJJvKO6ZlXJI6RVdLJg__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
      title: 'คอมแพค พาวเดอร์',
    ),
    RecommendGoodsModel(
      id: '24',
      image:
          'https://s3-alpha-sig.figma.com/img/25b4/a6a3/3534ecc797a82bba2a7bc30315dc5dca?Expires=1674432000&Signature=cy8NllJ4p9WABYEgQhQVTwRdn7o5-hp~7gTFLYZNRQWyeWDd24uTTFmHgIVQ724KJ-EtVHo1uo38JRxVWUFigvBDdwcqxU0ib0YhLOJXopxGpdhX6hWlSGALH8Ho~CsAZZqTHMsYxBzedxvVB77BOd7fNchVd7~8APg0EPOjB0vZszymPLOv4Uqs7joZf0D3lWId7kGr2ruIoaKtusLf4nx21yasePAqCHj82YPPX1JVZSHPWbJJR0B1MEf5XnQF5rOO30-KWTaJygRhNnWNBwZ-~oIf1IFLagBuRd832XxUI9mV-J3nLJYQk0oJSNBcVPi5Lx2UH8-UYd0lPHjI1w__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
      title: 'บูสเตอร์ มาส์ก',
    ),
    RecommendGoodsModel(
      id: '25',
      image:
          'https://s3-alpha-sig.figma.com/img/a17a/46a0/b61f2b377247d188d42ad343ccddb317?Expires=1674432000&Signature=i2jBQBhnTVhml3Pxtv14FVT1lCZP1BRysAtcjRSErGU4SFEkuKqRifR7T~STRSig~QLpYe7DFm6iRYAblPQQUzUAWLmllzc8xR-jHGwkrUqP9cuSmG8cU~UlYgKFq~RcXPnDXCaOVq4beE0CVtYF0VfCIFXWOfgstTaurJxTNvGLnFD9V120Q98WMbDW6ovgDb5MoZ68-MYPGn74atkrT4uTQ9Ezu1MoXD4Q9qzywRM~Oqa8-59E4iAYeAFP5Lj1LvWlPnbpRTzd1afMiQTbOfx7q0timK5hEVxezqCSLDNUGw0kNiDPhrPyPy1xciXl1qQdzFnujwF0hJ21EZ8yvw__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
      title: 'นาโน ไวท์เทนนิ่ง โซฟ จีพีโฟร์จี',
    ),
    RecommendGoodsModel(
      id: '26',
      image:
          'https://s3-alpha-sig.figma.com/img/08e8/7fe3/8ba2c1655c9d9cea10697c6e58862f7b?Expires=1674432000&Signature=mVpU0bYmiqc6yOd2UOuouAdG97W8Voa77nXT-xBD80qJ3m90JQZoWQ2VogexPFY3WQajzzv-i8QDr41sVDO2vQQpFWEdM9Bi0TLtyU4KhUrqIUa8bIsBX3iW1XgQaW9agAk12tW2L6Vcsd71ULG2wNUxVpGHq5aFR9xaKAwbIO6slZXyYm36BR~PX3VnnPFbG8HEwjeePXQroTw2jyV60ci3jzoUGfMu3ZUpLKwpDSyaF9JShe-C8jNbbR6DZyL3rI9EZECtl2F~muja8QsQbT5wVz2DmQviI-v~t1eWFDomKSUBN2loBZqukEdr0kCMZFRgJJvKO6ZlXJI6RVdLJg__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
      title: 'คอมแพค พาวเดอร์',
    ),
    RecommendGoodsModel(
      id: '27',
      image:
          'https://s3-alpha-sig.figma.com/img/25b4/a6a3/3534ecc797a82bba2a7bc30315dc5dca?Expires=1674432000&Signature=cy8NllJ4p9WABYEgQhQVTwRdn7o5-hp~7gTFLYZNRQWyeWDd24uTTFmHgIVQ724KJ-EtVHo1uo38JRxVWUFigvBDdwcqxU0ib0YhLOJXopxGpdhX6hWlSGALH8Ho~CsAZZqTHMsYxBzedxvVB77BOd7fNchVd7~8APg0EPOjB0vZszymPLOv4Uqs7joZf0D3lWId7kGr2ruIoaKtusLf4nx21yasePAqCHj82YPPX1JVZSHPWbJJR0B1MEf5XnQF5rOO30-KWTaJygRhNnWNBwZ-~oIf1IFLagBuRd832XxUI9mV-J3nLJYQk0oJSNBcVPi5Lx2UH8-UYd0lPHjI1w__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
      title: 'บูสเตอร์ มาส์ก',
    ),
    RecommendGoodsModel(
      id: '28',
      image:
          'https://s3-alpha-sig.figma.com/img/a17a/46a0/b61f2b377247d188d42ad343ccddb317?Expires=1674432000&Signature=i2jBQBhnTVhml3Pxtv14FVT1lCZP1BRysAtcjRSErGU4SFEkuKqRifR7T~STRSig~QLpYe7DFm6iRYAblPQQUzUAWLmllzc8xR-jHGwkrUqP9cuSmG8cU~UlYgKFq~RcXPnDXCaOVq4beE0CVtYF0VfCIFXWOfgstTaurJxTNvGLnFD9V120Q98WMbDW6ovgDb5MoZ68-MYPGn74atkrT4uTQ9Ezu1MoXD4Q9qzywRM~Oqa8-59E4iAYeAFP5Lj1LvWlPnbpRTzd1afMiQTbOfx7q0timK5hEVxezqCSLDNUGw0kNiDPhrPyPy1xciXl1qQdzFnujwF0hJ21EZ8yvw__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
      title: 'นาโน ไวท์เทนนิ่ง โซฟ จีพีโฟร์จี',
    ),
    RecommendGoodsModel(
      id: '29',
      image:
          'https://s3-alpha-sig.figma.com/img/08e8/7fe3/8ba2c1655c9d9cea10697c6e58862f7b?Expires=1674432000&Signature=mVpU0bYmiqc6yOd2UOuouAdG97W8Voa77nXT-xBD80qJ3m90JQZoWQ2VogexPFY3WQajzzv-i8QDr41sVDO2vQQpFWEdM9Bi0TLtyU4KhUrqIUa8bIsBX3iW1XgQaW9agAk12tW2L6Vcsd71ULG2wNUxVpGHq5aFR9xaKAwbIO6slZXyYm36BR~PX3VnnPFbG8HEwjeePXQroTw2jyV60ci3jzoUGfMu3ZUpLKwpDSyaF9JShe-C8jNbbR6DZyL3rI9EZECtl2F~muja8QsQbT5wVz2DmQviI-v~t1eWFDomKSUBN2loBZqukEdr0kCMZFRgJJvKO6ZlXJI6RVdLJg__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
      title: 'คอมแพค พาวเดอร์',
    ),
    RecommendGoodsModel(
      id: '30',
      image:
          'https://s3-alpha-sig.figma.com/img/25b4/a6a3/3534ecc797a82bba2a7bc30315dc5dca?Expires=1674432000&Signature=cy8NllJ4p9WABYEgQhQVTwRdn7o5-hp~7gTFLYZNRQWyeWDd24uTTFmHgIVQ724KJ-EtVHo1uo38JRxVWUFigvBDdwcqxU0ib0YhLOJXopxGpdhX6hWlSGALH8Ho~CsAZZqTHMsYxBzedxvVB77BOd7fNchVd7~8APg0EPOjB0vZszymPLOv4Uqs7joZf0D3lWId7kGr2ruIoaKtusLf4nx21yasePAqCHj82YPPX1JVZSHPWbJJR0B1MEf5XnQF5rOO30-KWTaJygRhNnWNBwZ-~oIf1IFLagBuRd832XxUI9mV-J3nLJYQk0oJSNBcVPi5Lx2UH8-UYd0lPHjI1w__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
      title: 'บูสเตอร์ มาส์ก',
    ),
    RecommendGoodsModel(
      id: '31',
      image:
          'https://s3-alpha-sig.figma.com/img/a17a/46a0/b61f2b377247d188d42ad343ccddb317?Expires=1674432000&Signature=i2jBQBhnTVhml3Pxtv14FVT1lCZP1BRysAtcjRSErGU4SFEkuKqRifR7T~STRSig~QLpYe7DFm6iRYAblPQQUzUAWLmllzc8xR-jHGwkrUqP9cuSmG8cU~UlYgKFq~RcXPnDXCaOVq4beE0CVtYF0VfCIFXWOfgstTaurJxTNvGLnFD9V120Q98WMbDW6ovgDb5MoZ68-MYPGn74atkrT4uTQ9Ezu1MoXD4Q9qzywRM~Oqa8-59E4iAYeAFP5Lj1LvWlPnbpRTzd1afMiQTbOfx7q0timK5hEVxezqCSLDNUGw0kNiDPhrPyPy1xciXl1qQdzFnujwF0hJ21EZ8yvw__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
      title: 'นาโน ไวท์เทนนิ่ง โซฟ จีพีโฟร์จี',
    ),
    RecommendGoodsModel(
      id: '32',
      image:
          'https://s3-alpha-sig.figma.com/img/08e8/7fe3/8ba2c1655c9d9cea10697c6e58862f7b?Expires=1674432000&Signature=mVpU0bYmiqc6yOd2UOuouAdG97W8Voa77nXT-xBD80qJ3m90JQZoWQ2VogexPFY3WQajzzv-i8QDr41sVDO2vQQpFWEdM9Bi0TLtyU4KhUrqIUa8bIsBX3iW1XgQaW9agAk12tW2L6Vcsd71ULG2wNUxVpGHq5aFR9xaKAwbIO6slZXyYm36BR~PX3VnnPFbG8HEwjeePXQroTw2jyV60ci3jzoUGfMu3ZUpLKwpDSyaF9JShe-C8jNbbR6DZyL3rI9EZECtl2F~muja8QsQbT5wVz2DmQviI-v~t1eWFDomKSUBN2loBZqukEdr0kCMZFRgJJvKO6ZlXJI6RVdLJg__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
      title: 'คอมแพค พาวเดอร์',
    ),
    RecommendGoodsModel(
      id: '33',
      image:
          'https://s3-alpha-sig.figma.com/img/25b4/a6a3/3534ecc797a82bba2a7bc30315dc5dca?Expires=1674432000&Signature=cy8NllJ4p9WABYEgQhQVTwRdn7o5-hp~7gTFLYZNRQWyeWDd24uTTFmHgIVQ724KJ-EtVHo1uo38JRxVWUFigvBDdwcqxU0ib0YhLOJXopxGpdhX6hWlSGALH8Ho~CsAZZqTHMsYxBzedxvVB77BOd7fNchVd7~8APg0EPOjB0vZszymPLOv4Uqs7joZf0D3lWId7kGr2ruIoaKtusLf4nx21yasePAqCHj82YPPX1JVZSHPWbJJR0B1MEf5XnQF5rOO30-KWTaJygRhNnWNBwZ-~oIf1IFLagBuRd832XxUI9mV-J3nLJYQk0oJSNBcVPi5Lx2UH8-UYd0lPHjI1w__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
      title: 'บูสเตอร์ มาส์ก',
    ),
    RecommendGoodsModel(
      id: '34',
      image:
          'https://s3-alpha-sig.figma.com/img/a17a/46a0/b61f2b377247d188d42ad343ccddb317?Expires=1674432000&Signature=i2jBQBhnTVhml3Pxtv14FVT1lCZP1BRysAtcjRSErGU4SFEkuKqRifR7T~STRSig~QLpYe7DFm6iRYAblPQQUzUAWLmllzc8xR-jHGwkrUqP9cuSmG8cU~UlYgKFq~RcXPnDXCaOVq4beE0CVtYF0VfCIFXWOfgstTaurJxTNvGLnFD9V120Q98WMbDW6ovgDb5MoZ68-MYPGn74atkrT4uTQ9Ezu1MoXD4Q9qzywRM~Oqa8-59E4iAYeAFP5Lj1LvWlPnbpRTzd1afMiQTbOfx7q0timK5hEVxezqCSLDNUGw0kNiDPhrPyPy1xciXl1qQdzFnujwF0hJ21EZ8yvw__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
      title: 'นาโน ไวท์เทนนิ่ง โซฟ จีพีโฟร์จี',
    ),
    RecommendGoodsModel(
      id: '35',
      image:
          'https://s3-alpha-sig.figma.com/img/08e8/7fe3/8ba2c1655c9d9cea10697c6e58862f7b?Expires=1674432000&Signature=mVpU0bYmiqc6yOd2UOuouAdG97W8Voa77nXT-xBD80qJ3m90JQZoWQ2VogexPFY3WQajzzv-i8QDr41sVDO2vQQpFWEdM9Bi0TLtyU4KhUrqIUa8bIsBX3iW1XgQaW9agAk12tW2L6Vcsd71ULG2wNUxVpGHq5aFR9xaKAwbIO6slZXyYm36BR~PX3VnnPFbG8HEwjeePXQroTw2jyV60ci3jzoUGfMu3ZUpLKwpDSyaF9JShe-C8jNbbR6DZyL3rI9EZECtl2F~muja8QsQbT5wVz2DmQviI-v~t1eWFDomKSUBN2loBZqukEdr0kCMZFRgJJvKO6ZlXJI6RVdLJg__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
      title: 'คอมแพค พาวเดอร์',
    ),
    RecommendGoodsModel(
      id: '36',
      image:
          'https://s3-alpha-sig.figma.com/img/25b4/a6a3/3534ecc797a82bba2a7bc30315dc5dca?Expires=1674432000&Signature=cy8NllJ4p9WABYEgQhQVTwRdn7o5-hp~7gTFLYZNRQWyeWDd24uTTFmHgIVQ724KJ-EtVHo1uo38JRxVWUFigvBDdwcqxU0ib0YhLOJXopxGpdhX6hWlSGALH8Ho~CsAZZqTHMsYxBzedxvVB77BOd7fNchVd7~8APg0EPOjB0vZszymPLOv4Uqs7joZf0D3lWId7kGr2ruIoaKtusLf4nx21yasePAqCHj82YPPX1JVZSHPWbJJR0B1MEf5XnQF5rOO30-KWTaJygRhNnWNBwZ-~oIf1IFLagBuRd832XxUI9mV-J3nLJYQk0oJSNBcVPi5Lx2UH8-UYd0lPHjI1w__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
      title: 'บูสเตอร์ มาส์ก',
    ),
    RecommendGoodsModel(
      id: '37',
      image:
          'https://s3-alpha-sig.figma.com/img/a17a/46a0/b61f2b377247d188d42ad343ccddb317?Expires=1674432000&Signature=i2jBQBhnTVhml3Pxtv14FVT1lCZP1BRysAtcjRSErGU4SFEkuKqRifR7T~STRSig~QLpYe7DFm6iRYAblPQQUzUAWLmllzc8xR-jHGwkrUqP9cuSmG8cU~UlYgKFq~RcXPnDXCaOVq4beE0CVtYF0VfCIFXWOfgstTaurJxTNvGLnFD9V120Q98WMbDW6ovgDb5MoZ68-MYPGn74atkrT4uTQ9Ezu1MoXD4Q9qzywRM~Oqa8-59E4iAYeAFP5Lj1LvWlPnbpRTzd1afMiQTbOfx7q0timK5hEVxezqCSLDNUGw0kNiDPhrPyPy1xciXl1qQdzFnujwF0hJ21EZ8yvw__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
      title: 'นาโน ไวท์เทนนิ่ง โซฟ จีพีโฟร์จี',
    ),
    RecommendGoodsModel(
      id: '38',
      image:
          'https://s3-alpha-sig.figma.com/img/08e8/7fe3/8ba2c1655c9d9cea10697c6e58862f7b?Expires=1674432000&Signature=mVpU0bYmiqc6yOd2UOuouAdG97W8Voa77nXT-xBD80qJ3m90JQZoWQ2VogexPFY3WQajzzv-i8QDr41sVDO2vQQpFWEdM9Bi0TLtyU4KhUrqIUa8bIsBX3iW1XgQaW9agAk12tW2L6Vcsd71ULG2wNUxVpGHq5aFR9xaKAwbIO6slZXyYm36BR~PX3VnnPFbG8HEwjeePXQroTw2jyV60ci3jzoUGfMu3ZUpLKwpDSyaF9JShe-C8jNbbR6DZyL3rI9EZECtl2F~muja8QsQbT5wVz2DmQviI-v~t1eWFDomKSUBN2loBZqukEdr0kCMZFRgJJvKO6ZlXJI6RVdLJg__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
      title: 'คอมแพค พาวเดอร์',
    ),
    RecommendGoodsModel(
      id: '39',
      image:
          'https://s3-alpha-sig.figma.com/img/25b4/a6a3/3534ecc797a82bba2a7bc30315dc5dca?Expires=1674432000&Signature=cy8NllJ4p9WABYEgQhQVTwRdn7o5-hp~7gTFLYZNRQWyeWDd24uTTFmHgIVQ724KJ-EtVHo1uo38JRxVWUFigvBDdwcqxU0ib0YhLOJXopxGpdhX6hWlSGALH8Ho~CsAZZqTHMsYxBzedxvVB77BOd7fNchVd7~8APg0EPOjB0vZszymPLOv4Uqs7joZf0D3lWId7kGr2ruIoaKtusLf4nx21yasePAqCHj82YPPX1JVZSHPWbJJR0B1MEf5XnQF5rOO30-KWTaJygRhNnWNBwZ-~oIf1IFLagBuRd832XxUI9mV-J3nLJYQk0oJSNBcVPi5Lx2UH8-UYd0lPHjI1w__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
      title: 'บูสเตอร์ มาส์ก',
    ),
    RecommendGoodsModel(
      id: '40',
      image:
          'https://s3-alpha-sig.figma.com/img/a17a/46a0/b61f2b377247d188d42ad343ccddb317?Expires=1674432000&Signature=i2jBQBhnTVhml3Pxtv14FVT1lCZP1BRysAtcjRSErGU4SFEkuKqRifR7T~STRSig~QLpYe7DFm6iRYAblPQQUzUAWLmllzc8xR-jHGwkrUqP9cuSmG8cU~UlYgKFq~RcXPnDXCaOVq4beE0CVtYF0VfCIFXWOfgstTaurJxTNvGLnFD9V120Q98WMbDW6ovgDb5MoZ68-MYPGn74atkrT4uTQ9Ezu1MoXD4Q9qzywRM~Oqa8-59E4iAYeAFP5Lj1LvWlPnbpRTzd1afMiQTbOfx7q0timK5hEVxezqCSLDNUGw0kNiDPhrPyPy1xciXl1qQdzFnujwF0hJ21EZ8yvw__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
      title: 'นาโน ไวท์เทนนิ่ง โซฟ จีพีโฟร์จี',
    ),
    RecommendGoodsModel(
      id: '41',
      image:
          'https://s3-alpha-sig.figma.com/img/08e8/7fe3/8ba2c1655c9d9cea10697c6e58862f7b?Expires=1674432000&Signature=mVpU0bYmiqc6yOd2UOuouAdG97W8Voa77nXT-xBD80qJ3m90JQZoWQ2VogexPFY3WQajzzv-i8QDr41sVDO2vQQpFWEdM9Bi0TLtyU4KhUrqIUa8bIsBX3iW1XgQaW9agAk12tW2L6Vcsd71ULG2wNUxVpGHq5aFR9xaKAwbIO6slZXyYm36BR~PX3VnnPFbG8HEwjeePXQroTw2jyV60ci3jzoUGfMu3ZUpLKwpDSyaF9JShe-C8jNbbR6DZyL3rI9EZECtl2F~muja8QsQbT5wVz2DmQviI-v~t1eWFDomKSUBN2loBZqukEdr0kCMZFRgJJvKO6ZlXJI6RVdLJg__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
      title: 'คอมแพค พาวเดอร์',
    ),
    RecommendGoodsModel(
      id: '42',
      image:
          'https://s3-alpha-sig.figma.com/img/25b4/a6a3/3534ecc797a82bba2a7bc30315dc5dca?Expires=1674432000&Signature=cy8NllJ4p9WABYEgQhQVTwRdn7o5-hp~7gTFLYZNRQWyeWDd24uTTFmHgIVQ724KJ-EtVHo1uo38JRxVWUFigvBDdwcqxU0ib0YhLOJXopxGpdhX6hWlSGALH8Ho~CsAZZqTHMsYxBzedxvVB77BOd7fNchVd7~8APg0EPOjB0vZszymPLOv4Uqs7joZf0D3lWId7kGr2ruIoaKtusLf4nx21yasePAqCHj82YPPX1JVZSHPWbJJR0B1MEf5XnQF5rOO30-KWTaJygRhNnWNBwZ-~oIf1IFLagBuRd832XxUI9mV-J3nLJYQk0oJSNBcVPi5Lx2UH8-UYd0lPHjI1w__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
      title: 'บูสเตอร์ มาส์ก',
    ),
    RecommendGoodsModel(
      id: '43',
      image:
          'https://s3-alpha-sig.figma.com/img/a17a/46a0/b61f2b377247d188d42ad343ccddb317?Expires=1674432000&Signature=i2jBQBhnTVhml3Pxtv14FVT1lCZP1BRysAtcjRSErGU4SFEkuKqRifR7T~STRSig~QLpYe7DFm6iRYAblPQQUzUAWLmllzc8xR-jHGwkrUqP9cuSmG8cU~UlYgKFq~RcXPnDXCaOVq4beE0CVtYF0VfCIFXWOfgstTaurJxTNvGLnFD9V120Q98WMbDW6ovgDb5MoZ68-MYPGn74atkrT4uTQ9Ezu1MoXD4Q9qzywRM~Oqa8-59E4iAYeAFP5Lj1LvWlPnbpRTzd1afMiQTbOfx7q0timK5hEVxezqCSLDNUGw0kNiDPhrPyPy1xciXl1qQdzFnujwF0hJ21EZ8yvw__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
      title: 'นาโน ไวท์เทนนิ่ง โซฟ จีพีโฟร์จี',
    ),
    RecommendGoodsModel(
      id: '44',
      image:
          'https://s3-alpha-sig.figma.com/img/08e8/7fe3/8ba2c1655c9d9cea10697c6e58862f7b?Expires=1674432000&Signature=mVpU0bYmiqc6yOd2UOuouAdG97W8Voa77nXT-xBD80qJ3m90JQZoWQ2VogexPFY3WQajzzv-i8QDr41sVDO2vQQpFWEdM9Bi0TLtyU4KhUrqIUa8bIsBX3iW1XgQaW9agAk12tW2L6Vcsd71ULG2wNUxVpGHq5aFR9xaKAwbIO6slZXyYm36BR~PX3VnnPFbG8HEwjeePXQroTw2jyV60ci3jzoUGfMu3ZUpLKwpDSyaF9JShe-C8jNbbR6DZyL3rI9EZECtl2F~muja8QsQbT5wVz2DmQviI-v~t1eWFDomKSUBN2loBZqukEdr0kCMZFRgJJvKO6ZlXJI6RVdLJg__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
      title: 'คอมแพค พาวเดอร์',
    ),
    RecommendGoodsModel(
      id: '45',
      image:
          'https://s3-alpha-sig.figma.com/img/25b4/a6a3/3534ecc797a82bba2a7bc30315dc5dca?Expires=1674432000&Signature=cy8NllJ4p9WABYEgQhQVTwRdn7o5-hp~7gTFLYZNRQWyeWDd24uTTFmHgIVQ724KJ-EtVHo1uo38JRxVWUFigvBDdwcqxU0ib0YhLOJXopxGpdhX6hWlSGALH8Ho~CsAZZqTHMsYxBzedxvVB77BOd7fNchVd7~8APg0EPOjB0vZszymPLOv4Uqs7joZf0D3lWId7kGr2ruIoaKtusLf4nx21yasePAqCHj82YPPX1JVZSHPWbJJR0B1MEf5XnQF5rOO30-KWTaJygRhNnWNBwZ-~oIf1IFLagBuRd832XxUI9mV-J3nLJYQk0oJSNBcVPi5Lx2UH8-UYd0lPHjI1w__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
      title: 'บูสเตอร์ มาส์ก',
    ),
    RecommendGoodsModel(
      id: '46',
      image:
          'https://s3-alpha-sig.figma.com/img/a17a/46a0/b61f2b377247d188d42ad343ccddb317?Expires=1674432000&Signature=i2jBQBhnTVhml3Pxtv14FVT1lCZP1BRysAtcjRSErGU4SFEkuKqRifR7T~STRSig~QLpYe7DFm6iRYAblPQQUzUAWLmllzc8xR-jHGwkrUqP9cuSmG8cU~UlYgKFq~RcXPnDXCaOVq4beE0CVtYF0VfCIFXWOfgstTaurJxTNvGLnFD9V120Q98WMbDW6ovgDb5MoZ68-MYPGn74atkrT4uTQ9Ezu1MoXD4Q9qzywRM~Oqa8-59E4iAYeAFP5Lj1LvWlPnbpRTzd1afMiQTbOfx7q0timK5hEVxezqCSLDNUGw0kNiDPhrPyPy1xciXl1qQdzFnujwF0hJ21EZ8yvw__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
      title: 'นาโน ไวท์เทนนิ่ง โซฟ จีพีโฟร์จี',
    ),
    RecommendGoodsModel(
      id: '47',
      image:
          'https://s3-alpha-sig.figma.com/img/08e8/7fe3/8ba2c1655c9d9cea10697c6e58862f7b?Expires=1674432000&Signature=mVpU0bYmiqc6yOd2UOuouAdG97W8Voa77nXT-xBD80qJ3m90JQZoWQ2VogexPFY3WQajzzv-i8QDr41sVDO2vQQpFWEdM9Bi0TLtyU4KhUrqIUa8bIsBX3iW1XgQaW9agAk12tW2L6Vcsd71ULG2wNUxVpGHq5aFR9xaKAwbIO6slZXyYm36BR~PX3VnnPFbG8HEwjeePXQroTw2jyV60ci3jzoUGfMu3ZUpLKwpDSyaF9JShe-C8jNbbR6DZyL3rI9EZECtl2F~muja8QsQbT5wVz2DmQviI-v~t1eWFDomKSUBN2loBZqukEdr0kCMZFRgJJvKO6ZlXJI6RVdLJg__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
      title: 'คอมแพค พาวเดอร์',
    ),
    RecommendGoodsModel(
      id: '48',
      image:
          'https://s3-alpha-sig.figma.com/img/25b4/a6a3/3534ecc797a82bba2a7bc30315dc5dca?Expires=1674432000&Signature=cy8NllJ4p9WABYEgQhQVTwRdn7o5-hp~7gTFLYZNRQWyeWDd24uTTFmHgIVQ724KJ-EtVHo1uo38JRxVWUFigvBDdwcqxU0ib0YhLOJXopxGpdhX6hWlSGALH8Ho~CsAZZqTHMsYxBzedxvVB77BOd7fNchVd7~8APg0EPOjB0vZszymPLOv4Uqs7joZf0D3lWId7kGr2ruIoaKtusLf4nx21yasePAqCHj82YPPX1JVZSHPWbJJR0B1MEf5XnQF5rOO30-KWTaJygRhNnWNBwZ-~oIf1IFLagBuRd832XxUI9mV-J3nLJYQk0oJSNBcVPi5Lx2UH8-UYd0lPHjI1w__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
      title: 'บูสเตอร์ มาส์ก',
    ),
    RecommendGoodsModel(
      id: '49',
      image:
          'https://s3-alpha-sig.figma.com/img/08e8/7fe3/8ba2c1655c9d9cea10697c6e58862f7b?Expires=1674432000&Signature=mVpU0bYmiqc6yOd2UOuouAdG97W8Voa77nXT-xBD80qJ3m90JQZoWQ2VogexPFY3WQajzzv-i8QDr41sVDO2vQQpFWEdM9Bi0TLtyU4KhUrqIUa8bIsBX3iW1XgQaW9agAk12tW2L6Vcsd71ULG2wNUxVpGHq5aFR9xaKAwbIO6slZXyYm36BR~PX3VnnPFbG8HEwjeePXQroTw2jyV60ci3jzoUGfMu3ZUpLKwpDSyaF9JShe-C8jNbbR6DZyL3rI9EZECtl2F~muja8QsQbT5wVz2DmQviI-v~t1eWFDomKSUBN2loBZqukEdr0kCMZFRgJJvKO6ZlXJI6RVdLJg__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
      title: 'คอมแพค พาวเดอร์',
    ),
    RecommendGoodsModel(
      id: '50',
      image:
          'https://s3-alpha-sig.figma.com/img/25b4/a6a3/3534ecc797a82bba2a7bc30315dc5dca?Expires=1674432000&Signature=cy8NllJ4p9WABYEgQhQVTwRdn7o5-hp~7gTFLYZNRQWyeWDd24uTTFmHgIVQ724KJ-EtVHo1uo38JRxVWUFigvBDdwcqxU0ib0YhLOJXopxGpdhX6hWlSGALH8Ho~CsAZZqTHMsYxBzedxvVB77BOd7fNchVd7~8APg0EPOjB0vZszymPLOv4Uqs7joZf0D3lWId7kGr2ruIoaKtusLf4nx21yasePAqCHj82YPPX1JVZSHPWbJJR0B1MEf5XnQF5rOO30-KWTaJygRhNnWNBwZ-~oIf1IFLagBuRd832XxUI9mV-J3nLJYQk0oJSNBcVPi5Lx2UH8-UYd0lPHjI1w__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
      title: 'บูสเตอร์ มาส์ก',
    ),
  ];

  // Getter

  List<PromotionModel> get promotionList => _promotionList;
  List<BestSellGoodsModel> get bestSellGoodsList => _bestSellGoodsList;
  List<RecommendGoodsModel> get recommendGoodsList => _recommendGoodsList;
}
