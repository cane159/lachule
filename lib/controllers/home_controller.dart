import 'package:get/get.dart';
import 'package:lachule/bases/base_controller.dart';
import 'package:lachule/models/best_sell_goods_model.dart';
import 'package:lachule/models/promotion_model.dart';
import 'package:lachule/models/recommend_goods_medel.dart';
import 'package:lachule/routes/app_pages.dart';

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
    'https://s3-alpha-sig.figma.com/img/04eb/1d0f/d9a28b59aa5b89ff2f7a59130c33015c?Expires=1675641600&Signature=CqRUqWjALeY0IpDKUHoPDbOHVA-GrRmd-KfCnVEx-g51aZQlrhLpO47u4eje0NluEnPBmhVizJ3F6W1~oafM9JuEB6eXekAYTLADewmdZAhVUBfq0WA9R-n2BfF88q2Tm9OY9xgHV8BcUOflNqHMGxAnzZ~ZDtHoJGB2tIVvtDWys68AUQeAky~kg6w12351NJLV1863O11-gybqZf1uqZX-QuICuMyl~V1F2PgyhceN5FNSZKxx2hqZutH3DKQngspLitUH6-ZQoNJO85hH83qRTEvcI3HaKTAepQMBXuqHKFXZ8oUMO6aVvcKorjtBwrZmMMr0DnnKQumzHkbYww__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
    'https://docs.flutter.dev/assets/images/shared/brand/flutter/logo/flutter-lockup.png',
    'https://s3-alpha-sig.figma.com/img/04eb/1d0f/d9a28b59aa5b89ff2f7a59130c33015c?Expires=1675641600&Signature=CqRUqWjALeY0IpDKUHoPDbOHVA-GrRmd-KfCnVEx-g51aZQlrhLpO47u4eje0NluEnPBmhVizJ3F6W1~oafM9JuEB6eXekAYTLADewmdZAhVUBfq0WA9R-n2BfF88q2Tm9OY9xgHV8BcUOflNqHMGxAnzZ~ZDtHoJGB2tIVvtDWys68AUQeAky~kg6w12351NJLV1863O11-gybqZf1uqZX-QuICuMyl~V1F2PgyhceN5FNSZKxx2hqZutH3DKQngspLitUH6-ZQoNJO85hH83qRTEvcI3HaKTAepQMBXuqHKFXZ8oUMO6aVvcKorjtBwrZmMMr0DnnKQumzHkbYww__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
    'https://s3-alpha-sig.figma.com/img/04eb/1d0f/d9a28b59aa5b89ff2f7a59130c33015c?Expires=1675641600&Signature=CqRUqWjALeY0IpDKUHoPDbOHVA-GrRmd-KfCnVEx-g51aZQlrhLpO47u4eje0NluEnPBmhVizJ3F6W1~oafM9JuEB6eXekAYTLADewmdZAhVUBfq0WA9R-n2BfF88q2Tm9OY9xgHV8BcUOflNqHMGxAnzZ~ZDtHoJGB2tIVvtDWys68AUQeAky~kg6w12351NJLV1863O11-gybqZf1uqZX-QuICuMyl~V1F2PgyhceN5FNSZKxx2hqZutH3DKQngspLitUH6-ZQoNJO85hH83qRTEvcI3HaKTAepQMBXuqHKFXZ8oUMO6aVvcKorjtBwrZmMMr0DnnKQumzHkbYww__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
    'https://s3-alpha-sig.figma.com/img/04eb/1d0f/d9a28b59aa5b89ff2f7a59130c33015c?Expires=1675641600&Signature=CqRUqWjALeY0IpDKUHoPDbOHVA-GrRmd-KfCnVEx-g51aZQlrhLpO47u4eje0NluEnPBmhVizJ3F6W1~oafM9JuEB6eXekAYTLADewmdZAhVUBfq0WA9R-n2BfF88q2Tm9OY9xgHV8BcUOflNqHMGxAnzZ~ZDtHoJGB2tIVvtDWys68AUQeAky~kg6w12351NJLV1863O11-gybqZf1uqZX-QuICuMyl~V1F2PgyhceN5FNSZKxx2hqZutH3DKQngspLitUH6-ZQoNJO85hH83qRTEvcI3HaKTAepQMBXuqHKFXZ8oUMO6aVvcKorjtBwrZmMMr0DnnKQumzHkbYww__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
  ];
  final List<PromotionModel> _promotionList = [
    PromotionModel(
      id: '1',
      image:
          'https://s3-alpha-sig.figma.com/img/f183/300a/727e94c90c923dfc3091ac83d14723e0?Expires=1675641600&Signature=C7N7~6O9ZjMjOcmLklR2niaApdqtG5210ZuQwBq~pKQmSwPaEwG2ASv6mM-3b4ZnJL~JZUjeexp4msm~cfUNu01Ixi8t0laVBfJiOv~mTqeYt~Q8FD4Nt-sYNrotZtGcf5ndq6fm-YB02mLZKw78l1v~zRPwwFtV-nE1jIhTl3SeaIQbt8MNy3ONRKyNX8NvIqR8HwXJEFI~amEka4kABJD34P7WU7utgneLEKnj4qZe6ZJZbDiSf~dA1RIOFO4Px5B8y42wORwtSIenMAFIBcJWQHSzMB4e25gGSaWG1Lzpv7FKnYutNkEn1von1SwiFMr-KEkzBmkWLjmhcPHeug__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
      title: 'โปรโมชั่นเดือนพฤศจิกายน 2565',
    ),
    PromotionModel(
      id: '2',
      image:
          'https://s3-alpha-sig.figma.com/img/ec0f/785c/f52ccf76baa8ed2aad2586c5383e2ccb?Expires=1675641600&Signature=p-KVqoZw7gDhNbeDS8OV0Z6csSLKWKofELaTrvUgmW--CzuDh2L7cLaqNA0ycTOm5O6UNIpZ0FVS3lhQ6T89KDNBbNvpFz4P1XHMxHD5qqNNc1KQi5KEVQamfpe20-MZ-Yl146tVqtUa89zLwtIepGp41RBO6iSCvUhTEv1i6QasqrYfYwCG1WkT55gw7f1aNk1psa5y8bk1nSHNYxFtwAZWLSB8x4-gpD4Figo0IWXexFidG0mbkeOG2ytih3eMfUsKbgBVqJRgvLiilfTYr3ygK3YzmPauWWAVFJClGO4dW5X9StkCMcUH7yBM5ltKS5Uf11NV9tO4CS-MwuZApw__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
      title: 'โปรโมชั่นเดือนตุลาคม 2565',
    ),
    PromotionModel(
      id: '3',
      image:
          'https://s3-alpha-sig.figma.com/img/2649/e380/687e8ba152d21a5a2222b4dba1bb29e7?Expires=1675641600&Signature=aQfgT9ENdoF75daC7~YaeSvWWI43kp0CJH3g0qpcklQyw3CHoazpLmNLmxoikWJnaSe5Jp4OgS50AbEMphU7huctqu84prJ0MnTJwfQC334EZvTCNsejWXC1orAsTDav0RZBF2rtfji~p0NZT26wOj3sB8vZ4vTV3WzXtUyLaWp8qxJ0QXChTpIKfR89CkWYfcJzqH1FZhyyjnC7GNpNEFpRUj5S2RN30JuCQ-Dzw7IjNc3mFEYG3dOUDbew2ayFVAGFktU-rhAB6Y7IGrSQ4~hbyKtrWFOr6lWM~bSoxKQXkzRmO5yW7B5cKeC1PwV~f1Q9GMuuxoNCyQ2Qe1PaRw__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
      title: 'โปรโมชั่นเดือนตุลาคม 2565',
    ),
    PromotionModel(
      id: '4',
      image:
          'https://s3-alpha-sig.figma.com/img/f183/300a/727e94c90c923dfc3091ac83d14723e0?Expires=1675641600&Signature=C7N7~6O9ZjMjOcmLklR2niaApdqtG5210ZuQwBq~pKQmSwPaEwG2ASv6mM-3b4ZnJL~JZUjeexp4msm~cfUNu01Ixi8t0laVBfJiOv~mTqeYt~Q8FD4Nt-sYNrotZtGcf5ndq6fm-YB02mLZKw78l1v~zRPwwFtV-nE1jIhTl3SeaIQbt8MNy3ONRKyNX8NvIqR8HwXJEFI~amEka4kABJD34P7WU7utgneLEKnj4qZe6ZJZbDiSf~dA1RIOFO4Px5B8y42wORwtSIenMAFIBcJWQHSzMB4e25gGSaWG1Lzpv7FKnYutNkEn1von1SwiFMr-KEkzBmkWLjmhcPHeug__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
      title: 'โปรโมชั่นเดือนพฤศจิกายน 2565',
    ),
    PromotionModel(
      id: '5',
      image:
          'https://s3-alpha-sig.figma.com/img/ec0f/785c/f52ccf76baa8ed2aad2586c5383e2ccb?Expires=1675641600&Signature=p-KVqoZw7gDhNbeDS8OV0Z6csSLKWKofELaTrvUgmW--CzuDh2L7cLaqNA0ycTOm5O6UNIpZ0FVS3lhQ6T89KDNBbNvpFz4P1XHMxHD5qqNNc1KQi5KEVQamfpe20-MZ-Yl146tVqtUa89zLwtIepGp41RBO6iSCvUhTEv1i6QasqrYfYwCG1WkT55gw7f1aNk1psa5y8bk1nSHNYxFtwAZWLSB8x4-gpD4Figo0IWXexFidG0mbkeOG2ytih3eMfUsKbgBVqJRgvLiilfTYr3ygK3YzmPauWWAVFJClGO4dW5X9StkCMcUH7yBM5ltKS5Uf11NV9tO4CS-MwuZApw__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
      title: 'โปรโมชั่นเดือนตุลาคม 2565',
    ),
  ];

  final List<BestSellGoodsModel> _bestSellGoodsList = [
    BestSellGoodsModel(
      id: '1',
      image:
          'https://s3-alpha-sig.figma.com/img/3882/55bc/dafa8fbfd8ac49059021da6fe48915a5?Expires=1675641600&Signature=B1H9XxWD~9cGE7pWnU4LzTwnNodtVm4IPZfLXL~4~70LxfCScKcwjuQtbfv9hD9ZyXdy1mGdwAqVI7oajsBBYHlGfAHXg8KXX-5~VBO4XmJ8uqL0-uL1e3~zqhKLDGxsWA7lPNc~Z7V-nZO3zP6dVN31Sgij8~TfDGFwXC2TM0ifFsJUj15U13IcWCA-561zqbEC1RCYKXnfHmJf6jpyRFS5MxHYpD85D5Dv4T2U7PyYwTn8SC~DAC6BQm0Q0wSWaEDKiNXIgkUzTID9h0xfQDd7WjCSDybkvv7iU9S2oebvyN2751Hq1b1amN5rlCi05FXxY-I4GmKLKQDDbQseXw__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
      title: 'นาโน แอคเน่ ครีม จีพีโฟร์จี',
    ),
    BestSellGoodsModel(
      id: '2',
      image:
          'https://s3-alpha-sig.figma.com/img/b1ba/e3e3/34e6da74237e9f02d71af77e00c00aa6?Expires=1675641600&Signature=QrZvOWqejBfxjm4qei~phMooCfu8pZtI7O-UB10So3yGSjLtQXFIWC6TWgzKLZEhhbHb1-1R-uukf4gs5h12d7j8WujIgCr5i3DoNQpoKVy0uDiwhM73-CjOF2J5m95za-88qbmT1C8BdrYPUpjA7mqL3tuZTTpqnV22zMJC2wGfAhHrM2iKjnKACvseJnD9xxDg4jZy4BY~bPTu8I5ze2VbeuT5ZgQ4147VRK7Ye-rPg8GgsdS-qbu~TbyuoMtuONZ2YuR4~vzK6t~iwdf6PLrB1ijJRFPB2o6v2BRL0KeagM-HYQ9RNpd3rGg-~t3kdz-57a6El5VxMvbRw0cllQ__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
      title: 'นาโน ซันสกรีน ครีม จีพีโฟร์จี SPF50 PA+++',
    ),
    BestSellGoodsModel(
      id: '3',
      image:
          'https://s3-alpha-sig.figma.com/img/c6bd/6576/b231e24ca192573b43b8b94eac4590db?Expires=1675641600&Signature=qFozTW9v0ZiGZSvfYA3LTgJgyYeEP3wkOhK4qeys6uVHRg37oXD17uyFQIwZcQadMdhi7f4Y6ao5PEiQGnuWYJTW3Yl0LZqHNfnnY0xEbGpV7hfUITqL599FZVqE2JHexdZorfFd8-zHgdD-0J6rdFvBk0N8XaNCW8HsZwa0U9T9i5Nvp5GFPWbe9-fiREPG3J65~Qp9DWR8c8CsPKGlDSJ~TaNAmd9EEqHwEDS4Roo0bQ6KLPH72zOI21qM6ax0Qg7vUsa4wzy35Fska2b2VzWasgxAnVLZeFNQj2rjTqFInzA7sq6AFmkOwKx9k0yu35BM57tFxo0xeEishmF0vw__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
      title: 'นาโน มอยส์เจอร์ไรเซอร์ ครีม จีพีโฟร์จี',
    ),
    BestSellGoodsModel(
      id: '4',
      image:
          'https://s3-alpha-sig.figma.com/img/3882/55bc/dafa8fbfd8ac49059021da6fe48915a5?Expires=1675641600&Signature=B1H9XxWD~9cGE7pWnU4LzTwnNodtVm4IPZfLXL~4~70LxfCScKcwjuQtbfv9hD9ZyXdy1mGdwAqVI7oajsBBYHlGfAHXg8KXX-5~VBO4XmJ8uqL0-uL1e3~zqhKLDGxsWA7lPNc~Z7V-nZO3zP6dVN31Sgij8~TfDGFwXC2TM0ifFsJUj15U13IcWCA-561zqbEC1RCYKXnfHmJf6jpyRFS5MxHYpD85D5Dv4T2U7PyYwTn8SC~DAC6BQm0Q0wSWaEDKiNXIgkUzTID9h0xfQDd7WjCSDybkvv7iU9S2oebvyN2751Hq1b1amN5rlCi05FXxY-I4GmKLKQDDbQseXw__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
      title: 'นาโน แอคเน่ ครีม จีพีโฟร์จี',
    ),
    BestSellGoodsModel(
      id: '5',
      image:
          'https://s3-alpha-sig.figma.com/img/b1ba/e3e3/34e6da74237e9f02d71af77e00c00aa6?Expires=1675641600&Signature=QrZvOWqejBfxjm4qei~phMooCfu8pZtI7O-UB10So3yGSjLtQXFIWC6TWgzKLZEhhbHb1-1R-uukf4gs5h12d7j8WujIgCr5i3DoNQpoKVy0uDiwhM73-CjOF2J5m95za-88qbmT1C8BdrYPUpjA7mqL3tuZTTpqnV22zMJC2wGfAhHrM2iKjnKACvseJnD9xxDg4jZy4BY~bPTu8I5ze2VbeuT5ZgQ4147VRK7Ye-rPg8GgsdS-qbu~TbyuoMtuONZ2YuR4~vzK6t~iwdf6PLrB1ijJRFPB2o6v2BRL0KeagM-HYQ9RNpd3rGg-~t3kdz-57a6El5VxMvbRw0cllQ__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
      title: 'นาโน ซันสกรีน ครีม จีพีโฟร์จี SPF50 PA+++',
    ),
    BestSellGoodsModel(
      id: '6',
      image:
          'https://s3-alpha-sig.figma.com/img/c6bd/6576/b231e24ca192573b43b8b94eac4590db?Expires=1675641600&Signature=qFozTW9v0ZiGZSvfYA3LTgJgyYeEP3wkOhK4qeys6uVHRg37oXD17uyFQIwZcQadMdhi7f4Y6ao5PEiQGnuWYJTW3Yl0LZqHNfnnY0xEbGpV7hfUITqL599FZVqE2JHexdZorfFd8-zHgdD-0J6rdFvBk0N8XaNCW8HsZwa0U9T9i5Nvp5GFPWbe9-fiREPG3J65~Qp9DWR8c8CsPKGlDSJ~TaNAmd9EEqHwEDS4Roo0bQ6KLPH72zOI21qM6ax0Qg7vUsa4wzy35Fska2b2VzWasgxAnVLZeFNQj2rjTqFInzA7sq6AFmkOwKx9k0yu35BM57tFxo0xeEishmF0vw__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
      title: 'นาโน มอยส์เจอร์ไรเซอร์ ครีม จีพีโฟร์จี',
    ),
    BestSellGoodsModel(
      id: '7',
      image:
          'https://s3-alpha-sig.figma.com/img/3882/55bc/dafa8fbfd8ac49059021da6fe48915a5?Expires=1675641600&Signature=B1H9XxWD~9cGE7pWnU4LzTwnNodtVm4IPZfLXL~4~70LxfCScKcwjuQtbfv9hD9ZyXdy1mGdwAqVI7oajsBBYHlGfAHXg8KXX-5~VBO4XmJ8uqL0-uL1e3~zqhKLDGxsWA7lPNc~Z7V-nZO3zP6dVN31Sgij8~TfDGFwXC2TM0ifFsJUj15U13IcWCA-561zqbEC1RCYKXnfHmJf6jpyRFS5MxHYpD85D5Dv4T2U7PyYwTn8SC~DAC6BQm0Q0wSWaEDKiNXIgkUzTID9h0xfQDd7WjCSDybkvv7iU9S2oebvyN2751Hq1b1amN5rlCi05FXxY-I4GmKLKQDDbQseXw__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
      title: 'นาโน แอคเน่ ครีม จีพีโฟร์จี',
    ),
    BestSellGoodsModel(
      id: '8',
      image:
          'https://s3-alpha-sig.figma.com/img/b1ba/e3e3/34e6da74237e9f02d71af77e00c00aa6?Expires=1675641600&Signature=QrZvOWqejBfxjm4qei~phMooCfu8pZtI7O-UB10So3yGSjLtQXFIWC6TWgzKLZEhhbHb1-1R-uukf4gs5h12d7j8WujIgCr5i3DoNQpoKVy0uDiwhM73-CjOF2J5m95za-88qbmT1C8BdrYPUpjA7mqL3tuZTTpqnV22zMJC2wGfAhHrM2iKjnKACvseJnD9xxDg4jZy4BY~bPTu8I5ze2VbeuT5ZgQ4147VRK7Ye-rPg8GgsdS-qbu~TbyuoMtuONZ2YuR4~vzK6t~iwdf6PLrB1ijJRFPB2o6v2BRL0KeagM-HYQ9RNpd3rGg-~t3kdz-57a6El5VxMvbRw0cllQ__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
      title: 'นาโน ซันสกรีน ครีม จีพีโฟร์จี SPF50 PA+++',
    ),
    BestSellGoodsModel(
      id: '9',
      image:
          'https://s3-alpha-sig.figma.com/img/c6bd/6576/b231e24ca192573b43b8b94eac4590db?Expires=1675641600&Signature=qFozTW9v0ZiGZSvfYA3LTgJgyYeEP3wkOhK4qeys6uVHRg37oXD17uyFQIwZcQadMdhi7f4Y6ao5PEiQGnuWYJTW3Yl0LZqHNfnnY0xEbGpV7hfUITqL599FZVqE2JHexdZorfFd8-zHgdD-0J6rdFvBk0N8XaNCW8HsZwa0U9T9i5Nvp5GFPWbe9-fiREPG3J65~Qp9DWR8c8CsPKGlDSJ~TaNAmd9EEqHwEDS4Roo0bQ6KLPH72zOI21qM6ax0Qg7vUsa4wzy35Fska2b2VzWasgxAnVLZeFNQj2rjTqFInzA7sq6AFmkOwKx9k0yu35BM57tFxo0xeEishmF0vw__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
      title: 'นาโน มอยส์เจอร์ไรเซอร์ ครีม จีพีโฟร์จี',
    ),
    BestSellGoodsModel(
      id: '10',
      image:
          'https://s3-alpha-sig.figma.com/img/3882/55bc/dafa8fbfd8ac49059021da6fe48915a5?Expires=1675641600&Signature=B1H9XxWD~9cGE7pWnU4LzTwnNodtVm4IPZfLXL~4~70LxfCScKcwjuQtbfv9hD9ZyXdy1mGdwAqVI7oajsBBYHlGfAHXg8KXX-5~VBO4XmJ8uqL0-uL1e3~zqhKLDGxsWA7lPNc~Z7V-nZO3zP6dVN31Sgij8~TfDGFwXC2TM0ifFsJUj15U13IcWCA-561zqbEC1RCYKXnfHmJf6jpyRFS5MxHYpD85D5Dv4T2U7PyYwTn8SC~DAC6BQm0Q0wSWaEDKiNXIgkUzTID9h0xfQDd7WjCSDybkvv7iU9S2oebvyN2751Hq1b1amN5rlCi05FXxY-I4GmKLKQDDbQseXw__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
      title: 'นาโน แอคเน่ ครีม จีพีโฟร์จี',
    ),
  ];

  final List<RecommendGoodsModel> _recommendGoodsList = [
    RecommendGoodsModel(
      id: '1',
      image:
          'https://s3-alpha-sig.figma.com/img/25b4/a6a3/3534ecc797a82bba2a7bc30315dc5dca?Expires=1675641600&Signature=lP-FZfHOWlXtHAr7KncaYQ7NsPGec7w6Rq-NZ0jSpQVgWkKvfnH1Gk3ULq9~i4dcJGGRSwA9o1WJANV3~LDnoQ7n5zjNTc0YK6d-J8VKnRv5wVTrePNPSmcb3N-G7djSnWyVZvjbRcphWNXEztvkDzkZdsfwcKta5zTGjuI-tT5c-DuTzldFj0O-Bw7RVgezt25EknhaoEh6Te7xhZhhkL7nxTyyL8AhD8zbqwUD1uF0Cf23gQS1K-LvOfoU69vcXUhA0hakitr76qSwVTUSj-u1dqfWCC4hFUYPPw1J0~UwDRBjHhCus2KhmbI1IwzEUyvZPmXmvwLK3UOGWWFn6A__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
      title: 'นาโน ไวท์เทนนิ่ง โซฟ จีพีโฟร์จี',
    ),
    RecommendGoodsModel(
      id: '2',
      image:
          'https://s3-alpha-sig.figma.com/img/08e8/7fe3/8ba2c1655c9d9cea10697c6e58862f7b?Expires=1675641600&Signature=mLzN0NuPNlkwfpmhlgGQlrxp4-Q3LlQU4icflO6-4ZOcLzhbV64BR0O5Vv1H9YZ8Jm0QSI8CUsr~xk7x~UbECa~PEd3AyALUSfjqpiDGpnNdYgTD7Ob6FKJJmN9oiA3o0m-pi~V20JSmhaJPRX57LoEPQpeGegRv1r7URWciuryX50t23iVIVxAbJ7764m2varxfu8ksdIJOwKO54BU7YDVkcx~haDmpA9ivORoepplIvflORDDj2OXmTvWRkX61w9SNvg-ol4HuPdxWCb7QLPHMUPqHCZpAP3YuJUHcSnak7pVU7uvDhpszmnRIoeRwKFCODoqSlSw8~Wkj01g~Ng__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
      title: 'คอมแพค พาวเดอร์',
    ),
    RecommendGoodsModel(
      id: '3',
      image:
          'https://s3-alpha-sig.figma.com/img/a17a/46a0/b61f2b377247d188d42ad343ccddb317?Expires=1675641600&Signature=ntGiUIGFp3zDQjzt0cG4oYFNVq5Fb43MrwyGaM0yG~op41yl1Enq-s8y~GQN7pc6baymxaACPk8-ULXD6fWKL6RYFT3oY~ORj1r6CTpDIl5hzB4EXOajirMDF0H-DxLC5B0F0F68eAT64TBCoOCezuNWIpQoQ1iUq1OPxdDfkB96TMDJDDMFF5q55EDuZOOmQM2s1JdJt8yky087g8DLLb8xAuDC4Yq9L8TSw2uNxtwcT3huso2Y0dsXL9knqvMUXyC4yrduTlEsOqudx6hOjLbZavQ2mrWWf4v8aYOZYS6Kgx62xJ40oCI8Y5q0iUckGHZeg3JoYR5HlkXgrF9C2g__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
      title: 'บูสเตอร์ มาส์ก',
    ),
    RecommendGoodsModel(
      id: '4',
      image:
          'https://s3-alpha-sig.figma.com/img/25b4/a6a3/3534ecc797a82bba2a7bc30315dc5dca?Expires=1675641600&Signature=lP-FZfHOWlXtHAr7KncaYQ7NsPGec7w6Rq-NZ0jSpQVgWkKvfnH1Gk3ULq9~i4dcJGGRSwA9o1WJANV3~LDnoQ7n5zjNTc0YK6d-J8VKnRv5wVTrePNPSmcb3N-G7djSnWyVZvjbRcphWNXEztvkDzkZdsfwcKta5zTGjuI-tT5c-DuTzldFj0O-Bw7RVgezt25EknhaoEh6Te7xhZhhkL7nxTyyL8AhD8zbqwUD1uF0Cf23gQS1K-LvOfoU69vcXUhA0hakitr76qSwVTUSj-u1dqfWCC4hFUYPPw1J0~UwDRBjHhCus2KhmbI1IwzEUyvZPmXmvwLK3UOGWWFn6A__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
      title: 'นาโน ไวท์เทนนิ่ง โซฟ จีพีโฟร์จี',
    ),
    RecommendGoodsModel(
      id: '5',
      image:
          'https://s3-alpha-sig.figma.com/img/08e8/7fe3/8ba2c1655c9d9cea10697c6e58862f7b?Expires=1675641600&Signature=mLzN0NuPNlkwfpmhlgGQlrxp4-Q3LlQU4icflO6-4ZOcLzhbV64BR0O5Vv1H9YZ8Jm0QSI8CUsr~xk7x~UbECa~PEd3AyALUSfjqpiDGpnNdYgTD7Ob6FKJJmN9oiA3o0m-pi~V20JSmhaJPRX57LoEPQpeGegRv1r7URWciuryX50t23iVIVxAbJ7764m2varxfu8ksdIJOwKO54BU7YDVkcx~haDmpA9ivORoepplIvflORDDj2OXmTvWRkX61w9SNvg-ol4HuPdxWCb7QLPHMUPqHCZpAP3YuJUHcSnak7pVU7uvDhpszmnRIoeRwKFCODoqSlSw8~Wkj01g~Ng__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
      title: 'คอมแพค พาวเดอร์',
    ),
    RecommendGoodsModel(
      id: '6',
      image:
          'https://s3-alpha-sig.figma.com/img/a17a/46a0/b61f2b377247d188d42ad343ccddb317?Expires=1675641600&Signature=ntGiUIGFp3zDQjzt0cG4oYFNVq5Fb43MrwyGaM0yG~op41yl1Enq-s8y~GQN7pc6baymxaACPk8-ULXD6fWKL6RYFT3oY~ORj1r6CTpDIl5hzB4EXOajirMDF0H-DxLC5B0F0F68eAT64TBCoOCezuNWIpQoQ1iUq1OPxdDfkB96TMDJDDMFF5q55EDuZOOmQM2s1JdJt8yky087g8DLLb8xAuDC4Yq9L8TSw2uNxtwcT3huso2Y0dsXL9knqvMUXyC4yrduTlEsOqudx6hOjLbZavQ2mrWWf4v8aYOZYS6Kgx62xJ40oCI8Y5q0iUckGHZeg3JoYR5HlkXgrF9C2g__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
      title: 'บูสเตอร์ มาส์ก',
    ),
    RecommendGoodsModel(
      id: '7',
      image:
          'https://s3-alpha-sig.figma.com/img/25b4/a6a3/3534ecc797a82bba2a7bc30315dc5dca?Expires=1675641600&Signature=lP-FZfHOWlXtHAr7KncaYQ7NsPGec7w6Rq-NZ0jSpQVgWkKvfnH1Gk3ULq9~i4dcJGGRSwA9o1WJANV3~LDnoQ7n5zjNTc0YK6d-J8VKnRv5wVTrePNPSmcb3N-G7djSnWyVZvjbRcphWNXEztvkDzkZdsfwcKta5zTGjuI-tT5c-DuTzldFj0O-Bw7RVgezt25EknhaoEh6Te7xhZhhkL7nxTyyL8AhD8zbqwUD1uF0Cf23gQS1K-LvOfoU69vcXUhA0hakitr76qSwVTUSj-u1dqfWCC4hFUYPPw1J0~UwDRBjHhCus2KhmbI1IwzEUyvZPmXmvwLK3UOGWWFn6A__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
      title: 'นาโน ไวท์เทนนิ่ง โซฟ จีพีโฟร์จี',
    ),
    RecommendGoodsModel(
      id: '8',
      image:
          'https://s3-alpha-sig.figma.com/img/08e8/7fe3/8ba2c1655c9d9cea10697c6e58862f7b?Expires=1675641600&Signature=mLzN0NuPNlkwfpmhlgGQlrxp4-Q3LlQU4icflO6-4ZOcLzhbV64BR0O5Vv1H9YZ8Jm0QSI8CUsr~xk7x~UbECa~PEd3AyALUSfjqpiDGpnNdYgTD7Ob6FKJJmN9oiA3o0m-pi~V20JSmhaJPRX57LoEPQpeGegRv1r7URWciuryX50t23iVIVxAbJ7764m2varxfu8ksdIJOwKO54BU7YDVkcx~haDmpA9ivORoepplIvflORDDj2OXmTvWRkX61w9SNvg-ol4HuPdxWCb7QLPHMUPqHCZpAP3YuJUHcSnak7pVU7uvDhpszmnRIoeRwKFCODoqSlSw8~Wkj01g~Ng__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
      title: 'คอมแพค พาวเดอร์',
    ),
    RecommendGoodsModel(
      id: '9',
      image:
          'https://s3-alpha-sig.figma.com/img/a17a/46a0/b61f2b377247d188d42ad343ccddb317?Expires=1675641600&Signature=ntGiUIGFp3zDQjzt0cG4oYFNVq5Fb43MrwyGaM0yG~op41yl1Enq-s8y~GQN7pc6baymxaACPk8-ULXD6fWKL6RYFT3oY~ORj1r6CTpDIl5hzB4EXOajirMDF0H-DxLC5B0F0F68eAT64TBCoOCezuNWIpQoQ1iUq1OPxdDfkB96TMDJDDMFF5q55EDuZOOmQM2s1JdJt8yky087g8DLLb8xAuDC4Yq9L8TSw2uNxtwcT3huso2Y0dsXL9knqvMUXyC4yrduTlEsOqudx6hOjLbZavQ2mrWWf4v8aYOZYS6Kgx62xJ40oCI8Y5q0iUckGHZeg3JoYR5HlkXgrF9C2g__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
      title: 'บูสเตอร์ มาส์ก',
    ),
    RecommendGoodsModel(
      id: '10',
      image:
          'https://s3-alpha-sig.figma.com/img/25b4/a6a3/3534ecc797a82bba2a7bc30315dc5dca?Expires=1675641600&Signature=lP-FZfHOWlXtHAr7KncaYQ7NsPGec7w6Rq-NZ0jSpQVgWkKvfnH1Gk3ULq9~i4dcJGGRSwA9o1WJANV3~LDnoQ7n5zjNTc0YK6d-J8VKnRv5wVTrePNPSmcb3N-G7djSnWyVZvjbRcphWNXEztvkDzkZdsfwcKta5zTGjuI-tT5c-DuTzldFj0O-Bw7RVgezt25EknhaoEh6Te7xhZhhkL7nxTyyL8AhD8zbqwUD1uF0Cf23gQS1K-LvOfoU69vcXUhA0hakitr76qSwVTUSj-u1dqfWCC4hFUYPPw1J0~UwDRBjHhCus2KhmbI1IwzEUyvZPmXmvwLK3UOGWWFn6A__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
      title: 'นาโน ไวท์เทนนิ่ง โซฟ จีพีโฟร์จี',
    ),
    RecommendGoodsModel(
      id: '11',
      image:
          'https://s3-alpha-sig.figma.com/img/08e8/7fe3/8ba2c1655c9d9cea10697c6e58862f7b?Expires=1675641600&Signature=mLzN0NuPNlkwfpmhlgGQlrxp4-Q3LlQU4icflO6-4ZOcLzhbV64BR0O5Vv1H9YZ8Jm0QSI8CUsr~xk7x~UbECa~PEd3AyALUSfjqpiDGpnNdYgTD7Ob6FKJJmN9oiA3o0m-pi~V20JSmhaJPRX57LoEPQpeGegRv1r7URWciuryX50t23iVIVxAbJ7764m2varxfu8ksdIJOwKO54BU7YDVkcx~haDmpA9ivORoepplIvflORDDj2OXmTvWRkX61w9SNvg-ol4HuPdxWCb7QLPHMUPqHCZpAP3YuJUHcSnak7pVU7uvDhpszmnRIoeRwKFCODoqSlSw8~Wkj01g~Ng__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
      title: 'คอมแพค พาวเดอร์',
    ),
    RecommendGoodsModel(
      id: '12',
      image:
          'https://s3-alpha-sig.figma.com/img/a17a/46a0/b61f2b377247d188d42ad343ccddb317?Expires=1675641600&Signature=ntGiUIGFp3zDQjzt0cG4oYFNVq5Fb43MrwyGaM0yG~op41yl1Enq-s8y~GQN7pc6baymxaACPk8-ULXD6fWKL6RYFT3oY~ORj1r6CTpDIl5hzB4EXOajirMDF0H-DxLC5B0F0F68eAT64TBCoOCezuNWIpQoQ1iUq1OPxdDfkB96TMDJDDMFF5q55EDuZOOmQM2s1JdJt8yky087g8DLLb8xAuDC4Yq9L8TSw2uNxtwcT3huso2Y0dsXL9knqvMUXyC4yrduTlEsOqudx6hOjLbZavQ2mrWWf4v8aYOZYS6Kgx62xJ40oCI8Y5q0iUckGHZeg3JoYR5HlkXgrF9C2g__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
      title: 'บูสเตอร์ มาส์ก',
    ),
    RecommendGoodsModel(
      id: '13',
      image:
          'https://s3-alpha-sig.figma.com/img/25b4/a6a3/3534ecc797a82bba2a7bc30315dc5dca?Expires=1675641600&Signature=lP-FZfHOWlXtHAr7KncaYQ7NsPGec7w6Rq-NZ0jSpQVgWkKvfnH1Gk3ULq9~i4dcJGGRSwA9o1WJANV3~LDnoQ7n5zjNTc0YK6d-J8VKnRv5wVTrePNPSmcb3N-G7djSnWyVZvjbRcphWNXEztvkDzkZdsfwcKta5zTGjuI-tT5c-DuTzldFj0O-Bw7RVgezt25EknhaoEh6Te7xhZhhkL7nxTyyL8AhD8zbqwUD1uF0Cf23gQS1K-LvOfoU69vcXUhA0hakitr76qSwVTUSj-u1dqfWCC4hFUYPPw1J0~UwDRBjHhCus2KhmbI1IwzEUyvZPmXmvwLK3UOGWWFn6A__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
      title: 'นาโน ไวท์เทนนิ่ง โซฟ จีพีโฟร์จี',
    ),
    RecommendGoodsModel(
      id: '14',
      image:
          'https://s3-alpha-sig.figma.com/img/08e8/7fe3/8ba2c1655c9d9cea10697c6e58862f7b?Expires=1675641600&Signature=mLzN0NuPNlkwfpmhlgGQlrxp4-Q3LlQU4icflO6-4ZOcLzhbV64BR0O5Vv1H9YZ8Jm0QSI8CUsr~xk7x~UbECa~PEd3AyALUSfjqpiDGpnNdYgTD7Ob6FKJJmN9oiA3o0m-pi~V20JSmhaJPRX57LoEPQpeGegRv1r7URWciuryX50t23iVIVxAbJ7764m2varxfu8ksdIJOwKO54BU7YDVkcx~haDmpA9ivORoepplIvflORDDj2OXmTvWRkX61w9SNvg-ol4HuPdxWCb7QLPHMUPqHCZpAP3YuJUHcSnak7pVU7uvDhpszmnRIoeRwKFCODoqSlSw8~Wkj01g~Ng__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
      title: 'คอมแพค พาวเดอร์',
    ),
    RecommendGoodsModel(
      id: '15',
      image:
          'https://s3-alpha-sig.figma.com/img/a17a/46a0/b61f2b377247d188d42ad343ccddb317?Expires=1675641600&Signature=ntGiUIGFp3zDQjzt0cG4oYFNVq5Fb43MrwyGaM0yG~op41yl1Enq-s8y~GQN7pc6baymxaACPk8-ULXD6fWKL6RYFT3oY~ORj1r6CTpDIl5hzB4EXOajirMDF0H-DxLC5B0F0F68eAT64TBCoOCezuNWIpQoQ1iUq1OPxdDfkB96TMDJDDMFF5q55EDuZOOmQM2s1JdJt8yky087g8DLLb8xAuDC4Yq9L8TSw2uNxtwcT3huso2Y0dsXL9knqvMUXyC4yrduTlEsOqudx6hOjLbZavQ2mrWWf4v8aYOZYS6Kgx62xJ40oCI8Y5q0iUckGHZeg3JoYR5HlkXgrF9C2g__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
      title: 'บูสเตอร์ มาส์ก',
    ),
    RecommendGoodsModel(
      id: '16',
      image:
          'https://s3-alpha-sig.figma.com/img/25b4/a6a3/3534ecc797a82bba2a7bc30315dc5dca?Expires=1675641600&Signature=lP-FZfHOWlXtHAr7KncaYQ7NsPGec7w6Rq-NZ0jSpQVgWkKvfnH1Gk3ULq9~i4dcJGGRSwA9o1WJANV3~LDnoQ7n5zjNTc0YK6d-J8VKnRv5wVTrePNPSmcb3N-G7djSnWyVZvjbRcphWNXEztvkDzkZdsfwcKta5zTGjuI-tT5c-DuTzldFj0O-Bw7RVgezt25EknhaoEh6Te7xhZhhkL7nxTyyL8AhD8zbqwUD1uF0Cf23gQS1K-LvOfoU69vcXUhA0hakitr76qSwVTUSj-u1dqfWCC4hFUYPPw1J0~UwDRBjHhCus2KhmbI1IwzEUyvZPmXmvwLK3UOGWWFn6A__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
      title: 'นาโน ไวท์เทนนิ่ง โซฟ จีพีโฟร์จี',
    ),
    RecommendGoodsModel(
      id: '17',
      image:
          'https://s3-alpha-sig.figma.com/img/08e8/7fe3/8ba2c1655c9d9cea10697c6e58862f7b?Expires=1675641600&Signature=mLzN0NuPNlkwfpmhlgGQlrxp4-Q3LlQU4icflO6-4ZOcLzhbV64BR0O5Vv1H9YZ8Jm0QSI8CUsr~xk7x~UbECa~PEd3AyALUSfjqpiDGpnNdYgTD7Ob6FKJJmN9oiA3o0m-pi~V20JSmhaJPRX57LoEPQpeGegRv1r7URWciuryX50t23iVIVxAbJ7764m2varxfu8ksdIJOwKO54BU7YDVkcx~haDmpA9ivORoepplIvflORDDj2OXmTvWRkX61w9SNvg-ol4HuPdxWCb7QLPHMUPqHCZpAP3YuJUHcSnak7pVU7uvDhpszmnRIoeRwKFCODoqSlSw8~Wkj01g~Ng__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
      title: 'คอมแพค พาวเดอร์',
    ),
    RecommendGoodsModel(
      id: '18',
      image:
          'https://s3-alpha-sig.figma.com/img/a17a/46a0/b61f2b377247d188d42ad343ccddb317?Expires=1675641600&Signature=ntGiUIGFp3zDQjzt0cG4oYFNVq5Fb43MrwyGaM0yG~op41yl1Enq-s8y~GQN7pc6baymxaACPk8-ULXD6fWKL6RYFT3oY~ORj1r6CTpDIl5hzB4EXOajirMDF0H-DxLC5B0F0F68eAT64TBCoOCezuNWIpQoQ1iUq1OPxdDfkB96TMDJDDMFF5q55EDuZOOmQM2s1JdJt8yky087g8DLLb8xAuDC4Yq9L8TSw2uNxtwcT3huso2Y0dsXL9knqvMUXyC4yrduTlEsOqudx6hOjLbZavQ2mrWWf4v8aYOZYS6Kgx62xJ40oCI8Y5q0iUckGHZeg3JoYR5HlkXgrF9C2g__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
      title: 'บูสเตอร์ มาส์ก',
    ),
    RecommendGoodsModel(
      id: '19',
      image:
          'https://s3-alpha-sig.figma.com/img/25b4/a6a3/3534ecc797a82bba2a7bc30315dc5dca?Expires=1675641600&Signature=lP-FZfHOWlXtHAr7KncaYQ7NsPGec7w6Rq-NZ0jSpQVgWkKvfnH1Gk3ULq9~i4dcJGGRSwA9o1WJANV3~LDnoQ7n5zjNTc0YK6d-J8VKnRv5wVTrePNPSmcb3N-G7djSnWyVZvjbRcphWNXEztvkDzkZdsfwcKta5zTGjuI-tT5c-DuTzldFj0O-Bw7RVgezt25EknhaoEh6Te7xhZhhkL7nxTyyL8AhD8zbqwUD1uF0Cf23gQS1K-LvOfoU69vcXUhA0hakitr76qSwVTUSj-u1dqfWCC4hFUYPPw1J0~UwDRBjHhCus2KhmbI1IwzEUyvZPmXmvwLK3UOGWWFn6A__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
      title: 'นาโน ไวท์เทนนิ่ง โซฟ จีพีโฟร์จี',
    ),
    RecommendGoodsModel(
      id: '20',
      image:
          'https://s3-alpha-sig.figma.com/img/08e8/7fe3/8ba2c1655c9d9cea10697c6e58862f7b?Expires=1675641600&Signature=mLzN0NuPNlkwfpmhlgGQlrxp4-Q3LlQU4icflO6-4ZOcLzhbV64BR0O5Vv1H9YZ8Jm0QSI8CUsr~xk7x~UbECa~PEd3AyALUSfjqpiDGpnNdYgTD7Ob6FKJJmN9oiA3o0m-pi~V20JSmhaJPRX57LoEPQpeGegRv1r7URWciuryX50t23iVIVxAbJ7764m2varxfu8ksdIJOwKO54BU7YDVkcx~haDmpA9ivORoepplIvflORDDj2OXmTvWRkX61w9SNvg-ol4HuPdxWCb7QLPHMUPqHCZpAP3YuJUHcSnak7pVU7uvDhpszmnRIoeRwKFCODoqSlSw8~Wkj01g~Ng__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
      title: 'คอมแพค พาวเดอร์',
    ),
    RecommendGoodsModel(
      id: '21',
      image:
          'https://s3-alpha-sig.figma.com/img/a17a/46a0/b61f2b377247d188d42ad343ccddb317?Expires=1675641600&Signature=ntGiUIGFp3zDQjzt0cG4oYFNVq5Fb43MrwyGaM0yG~op41yl1Enq-s8y~GQN7pc6baymxaACPk8-ULXD6fWKL6RYFT3oY~ORj1r6CTpDIl5hzB4EXOajirMDF0H-DxLC5B0F0F68eAT64TBCoOCezuNWIpQoQ1iUq1OPxdDfkB96TMDJDDMFF5q55EDuZOOmQM2s1JdJt8yky087g8DLLb8xAuDC4Yq9L8TSw2uNxtwcT3huso2Y0dsXL9knqvMUXyC4yrduTlEsOqudx6hOjLbZavQ2mrWWf4v8aYOZYS6Kgx62xJ40oCI8Y5q0iUckGHZeg3JoYR5HlkXgrF9C2g__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
      title: 'บูสเตอร์ มาส์ก',
    ),
    RecommendGoodsModel(
      id: '22',
      image:
          'https://s3-alpha-sig.figma.com/img/25b4/a6a3/3534ecc797a82bba2a7bc30315dc5dca?Expires=1675641600&Signature=lP-FZfHOWlXtHAr7KncaYQ7NsPGec7w6Rq-NZ0jSpQVgWkKvfnH1Gk3ULq9~i4dcJGGRSwA9o1WJANV3~LDnoQ7n5zjNTc0YK6d-J8VKnRv5wVTrePNPSmcb3N-G7djSnWyVZvjbRcphWNXEztvkDzkZdsfwcKta5zTGjuI-tT5c-DuTzldFj0O-Bw7RVgezt25EknhaoEh6Te7xhZhhkL7nxTyyL8AhD8zbqwUD1uF0Cf23gQS1K-LvOfoU69vcXUhA0hakitr76qSwVTUSj-u1dqfWCC4hFUYPPw1J0~UwDRBjHhCus2KhmbI1IwzEUyvZPmXmvwLK3UOGWWFn6A__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
      title: 'นาโน ไวท์เทนนิ่ง โซฟ จีพีโฟร์จี',
    ),
    RecommendGoodsModel(
      id: '23',
      image:
          'https://s3-alpha-sig.figma.com/img/08e8/7fe3/8ba2c1655c9d9cea10697c6e58862f7b?Expires=1675641600&Signature=mLzN0NuPNlkwfpmhlgGQlrxp4-Q3LlQU4icflO6-4ZOcLzhbV64BR0O5Vv1H9YZ8Jm0QSI8CUsr~xk7x~UbECa~PEd3AyALUSfjqpiDGpnNdYgTD7Ob6FKJJmN9oiA3o0m-pi~V20JSmhaJPRX57LoEPQpeGegRv1r7URWciuryX50t23iVIVxAbJ7764m2varxfu8ksdIJOwKO54BU7YDVkcx~haDmpA9ivORoepplIvflORDDj2OXmTvWRkX61w9SNvg-ol4HuPdxWCb7QLPHMUPqHCZpAP3YuJUHcSnak7pVU7uvDhpszmnRIoeRwKFCODoqSlSw8~Wkj01g~Ng__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
      title: 'คอมแพค พาวเดอร์',
    ),
    RecommendGoodsModel(
      id: '24',
      image:
          'https://s3-alpha-sig.figma.com/img/a17a/46a0/b61f2b377247d188d42ad343ccddb317?Expires=1675641600&Signature=ntGiUIGFp3zDQjzt0cG4oYFNVq5Fb43MrwyGaM0yG~op41yl1Enq-s8y~GQN7pc6baymxaACPk8-ULXD6fWKL6RYFT3oY~ORj1r6CTpDIl5hzB4EXOajirMDF0H-DxLC5B0F0F68eAT64TBCoOCezuNWIpQoQ1iUq1OPxdDfkB96TMDJDDMFF5q55EDuZOOmQM2s1JdJt8yky087g8DLLb8xAuDC4Yq9L8TSw2uNxtwcT3huso2Y0dsXL9knqvMUXyC4yrduTlEsOqudx6hOjLbZavQ2mrWWf4v8aYOZYS6Kgx62xJ40oCI8Y5q0iUckGHZeg3JoYR5HlkXgrF9C2g__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
      title: 'บูสเตอร์ มาส์ก',
    ),
    RecommendGoodsModel(
      id: '25',
      image:
          'https://s3-alpha-sig.figma.com/img/25b4/a6a3/3534ecc797a82bba2a7bc30315dc5dca?Expires=1675641600&Signature=lP-FZfHOWlXtHAr7KncaYQ7NsPGec7w6Rq-NZ0jSpQVgWkKvfnH1Gk3ULq9~i4dcJGGRSwA9o1WJANV3~LDnoQ7n5zjNTc0YK6d-J8VKnRv5wVTrePNPSmcb3N-G7djSnWyVZvjbRcphWNXEztvkDzkZdsfwcKta5zTGjuI-tT5c-DuTzldFj0O-Bw7RVgezt25EknhaoEh6Te7xhZhhkL7nxTyyL8AhD8zbqwUD1uF0Cf23gQS1K-LvOfoU69vcXUhA0hakitr76qSwVTUSj-u1dqfWCC4hFUYPPw1J0~UwDRBjHhCus2KhmbI1IwzEUyvZPmXmvwLK3UOGWWFn6A__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
      title: 'นาโน ไวท์เทนนิ่ง โซฟ จีพีโฟร์จี',
    ),
    RecommendGoodsModel(
      id: '26',
      image:
          'https://s3-alpha-sig.figma.com/img/08e8/7fe3/8ba2c1655c9d9cea10697c6e58862f7b?Expires=1675641600&Signature=mLzN0NuPNlkwfpmhlgGQlrxp4-Q3LlQU4icflO6-4ZOcLzhbV64BR0O5Vv1H9YZ8Jm0QSI8CUsr~xk7x~UbECa~PEd3AyALUSfjqpiDGpnNdYgTD7Ob6FKJJmN9oiA3o0m-pi~V20JSmhaJPRX57LoEPQpeGegRv1r7URWciuryX50t23iVIVxAbJ7764m2varxfu8ksdIJOwKO54BU7YDVkcx~haDmpA9ivORoepplIvflORDDj2OXmTvWRkX61w9SNvg-ol4HuPdxWCb7QLPHMUPqHCZpAP3YuJUHcSnak7pVU7uvDhpszmnRIoeRwKFCODoqSlSw8~Wkj01g~Ng__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
      title: 'คอมแพค พาวเดอร์',
    ),
    RecommendGoodsModel(
      id: '27',
      image:
          'https://s3-alpha-sig.figma.com/img/a17a/46a0/b61f2b377247d188d42ad343ccddb317?Expires=1675641600&Signature=ntGiUIGFp3zDQjzt0cG4oYFNVq5Fb43MrwyGaM0yG~op41yl1Enq-s8y~GQN7pc6baymxaACPk8-ULXD6fWKL6RYFT3oY~ORj1r6CTpDIl5hzB4EXOajirMDF0H-DxLC5B0F0F68eAT64TBCoOCezuNWIpQoQ1iUq1OPxdDfkB96TMDJDDMFF5q55EDuZOOmQM2s1JdJt8yky087g8DLLb8xAuDC4Yq9L8TSw2uNxtwcT3huso2Y0dsXL9knqvMUXyC4yrduTlEsOqudx6hOjLbZavQ2mrWWf4v8aYOZYS6Kgx62xJ40oCI8Y5q0iUckGHZeg3JoYR5HlkXgrF9C2g__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
      title: 'บูสเตอร์ มาส์ก',
    ),
    RecommendGoodsModel(
      id: '28',
      image:
          'https://s3-alpha-sig.figma.com/img/25b4/a6a3/3534ecc797a82bba2a7bc30315dc5dca?Expires=1675641600&Signature=lP-FZfHOWlXtHAr7KncaYQ7NsPGec7w6Rq-NZ0jSpQVgWkKvfnH1Gk3ULq9~i4dcJGGRSwA9o1WJANV3~LDnoQ7n5zjNTc0YK6d-J8VKnRv5wVTrePNPSmcb3N-G7djSnWyVZvjbRcphWNXEztvkDzkZdsfwcKta5zTGjuI-tT5c-DuTzldFj0O-Bw7RVgezt25EknhaoEh6Te7xhZhhkL7nxTyyL8AhD8zbqwUD1uF0Cf23gQS1K-LvOfoU69vcXUhA0hakitr76qSwVTUSj-u1dqfWCC4hFUYPPw1J0~UwDRBjHhCus2KhmbI1IwzEUyvZPmXmvwLK3UOGWWFn6A__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
      title: 'นาโน ไวท์เทนนิ่ง โซฟ จีพีโฟร์จี',
    ),
    RecommendGoodsModel(
      id: '29',
      image:
          'https://s3-alpha-sig.figma.com/img/08e8/7fe3/8ba2c1655c9d9cea10697c6e58862f7b?Expires=1675641600&Signature=mLzN0NuPNlkwfpmhlgGQlrxp4-Q3LlQU4icflO6-4ZOcLzhbV64BR0O5Vv1H9YZ8Jm0QSI8CUsr~xk7x~UbECa~PEd3AyALUSfjqpiDGpnNdYgTD7Ob6FKJJmN9oiA3o0m-pi~V20JSmhaJPRX57LoEPQpeGegRv1r7URWciuryX50t23iVIVxAbJ7764m2varxfu8ksdIJOwKO54BU7YDVkcx~haDmpA9ivORoepplIvflORDDj2OXmTvWRkX61w9SNvg-ol4HuPdxWCb7QLPHMUPqHCZpAP3YuJUHcSnak7pVU7uvDhpszmnRIoeRwKFCODoqSlSw8~Wkj01g~Ng__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
      title: 'คอมแพค พาวเดอร์',
    ),
    RecommendGoodsModel(
      id: '30',
      image:
          'https://s3-alpha-sig.figma.com/img/a17a/46a0/b61f2b377247d188d42ad343ccddb317?Expires=1675641600&Signature=ntGiUIGFp3zDQjzt0cG4oYFNVq5Fb43MrwyGaM0yG~op41yl1Enq-s8y~GQN7pc6baymxaACPk8-ULXD6fWKL6RYFT3oY~ORj1r6CTpDIl5hzB4EXOajirMDF0H-DxLC5B0F0F68eAT64TBCoOCezuNWIpQoQ1iUq1OPxdDfkB96TMDJDDMFF5q55EDuZOOmQM2s1JdJt8yky087g8DLLb8xAuDC4Yq9L8TSw2uNxtwcT3huso2Y0dsXL9knqvMUXyC4yrduTlEsOqudx6hOjLbZavQ2mrWWf4v8aYOZYS6Kgx62xJ40oCI8Y5q0iUckGHZeg3JoYR5HlkXgrF9C2g__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
      title: 'บูสเตอร์ มาส์ก',
    ),
    RecommendGoodsModel(
      id: '31',
      image:
          'https://s3-alpha-sig.figma.com/img/25b4/a6a3/3534ecc797a82bba2a7bc30315dc5dca?Expires=1675641600&Signature=lP-FZfHOWlXtHAr7KncaYQ7NsPGec7w6Rq-NZ0jSpQVgWkKvfnH1Gk3ULq9~i4dcJGGRSwA9o1WJANV3~LDnoQ7n5zjNTc0YK6d-J8VKnRv5wVTrePNPSmcb3N-G7djSnWyVZvjbRcphWNXEztvkDzkZdsfwcKta5zTGjuI-tT5c-DuTzldFj0O-Bw7RVgezt25EknhaoEh6Te7xhZhhkL7nxTyyL8AhD8zbqwUD1uF0Cf23gQS1K-LvOfoU69vcXUhA0hakitr76qSwVTUSj-u1dqfWCC4hFUYPPw1J0~UwDRBjHhCus2KhmbI1IwzEUyvZPmXmvwLK3UOGWWFn6A__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
      title: 'นาโน ไวท์เทนนิ่ง โซฟ จีพีโฟร์จี',
    ),
    RecommendGoodsModel(
      id: '32',
      image:
          'https://s3-alpha-sig.figma.com/img/08e8/7fe3/8ba2c1655c9d9cea10697c6e58862f7b?Expires=1675641600&Signature=mLzN0NuPNlkwfpmhlgGQlrxp4-Q3LlQU4icflO6-4ZOcLzhbV64BR0O5Vv1H9YZ8Jm0QSI8CUsr~xk7x~UbECa~PEd3AyALUSfjqpiDGpnNdYgTD7Ob6FKJJmN9oiA3o0m-pi~V20JSmhaJPRX57LoEPQpeGegRv1r7URWciuryX50t23iVIVxAbJ7764m2varxfu8ksdIJOwKO54BU7YDVkcx~haDmpA9ivORoepplIvflORDDj2OXmTvWRkX61w9SNvg-ol4HuPdxWCb7QLPHMUPqHCZpAP3YuJUHcSnak7pVU7uvDhpszmnRIoeRwKFCODoqSlSw8~Wkj01g~Ng__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
      title: 'คอมแพค พาวเดอร์',
    ),
    RecommendGoodsModel(
      id: '33',
      image:
          'https://s3-alpha-sig.figma.com/img/a17a/46a0/b61f2b377247d188d42ad343ccddb317?Expires=1675641600&Signature=ntGiUIGFp3zDQjzt0cG4oYFNVq5Fb43MrwyGaM0yG~op41yl1Enq-s8y~GQN7pc6baymxaACPk8-ULXD6fWKL6RYFT3oY~ORj1r6CTpDIl5hzB4EXOajirMDF0H-DxLC5B0F0F68eAT64TBCoOCezuNWIpQoQ1iUq1OPxdDfkB96TMDJDDMFF5q55EDuZOOmQM2s1JdJt8yky087g8DLLb8xAuDC4Yq9L8TSw2uNxtwcT3huso2Y0dsXL9knqvMUXyC4yrduTlEsOqudx6hOjLbZavQ2mrWWf4v8aYOZYS6Kgx62xJ40oCI8Y5q0iUckGHZeg3JoYR5HlkXgrF9C2g__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
      title: 'บูสเตอร์ มาส์ก',
    ),
    RecommendGoodsModel(
      id: '34',
      image:
          'https://s3-alpha-sig.figma.com/img/25b4/a6a3/3534ecc797a82bba2a7bc30315dc5dca?Expires=1675641600&Signature=lP-FZfHOWlXtHAr7KncaYQ7NsPGec7w6Rq-NZ0jSpQVgWkKvfnH1Gk3ULq9~i4dcJGGRSwA9o1WJANV3~LDnoQ7n5zjNTc0YK6d-J8VKnRv5wVTrePNPSmcb3N-G7djSnWyVZvjbRcphWNXEztvkDzkZdsfwcKta5zTGjuI-tT5c-DuTzldFj0O-Bw7RVgezt25EknhaoEh6Te7xhZhhkL7nxTyyL8AhD8zbqwUD1uF0Cf23gQS1K-LvOfoU69vcXUhA0hakitr76qSwVTUSj-u1dqfWCC4hFUYPPw1J0~UwDRBjHhCus2KhmbI1IwzEUyvZPmXmvwLK3UOGWWFn6A__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
      title: 'นาโน ไวท์เทนนิ่ง โซฟ จีพีโฟร์จี',
    ),
    RecommendGoodsModel(
      id: '35',
      image:
          'https://s3-alpha-sig.figma.com/img/08e8/7fe3/8ba2c1655c9d9cea10697c6e58862f7b?Expires=1675641600&Signature=mLzN0NuPNlkwfpmhlgGQlrxp4-Q3LlQU4icflO6-4ZOcLzhbV64BR0O5Vv1H9YZ8Jm0QSI8CUsr~xk7x~UbECa~PEd3AyALUSfjqpiDGpnNdYgTD7Ob6FKJJmN9oiA3o0m-pi~V20JSmhaJPRX57LoEPQpeGegRv1r7URWciuryX50t23iVIVxAbJ7764m2varxfu8ksdIJOwKO54BU7YDVkcx~haDmpA9ivORoepplIvflORDDj2OXmTvWRkX61w9SNvg-ol4HuPdxWCb7QLPHMUPqHCZpAP3YuJUHcSnak7pVU7uvDhpszmnRIoeRwKFCODoqSlSw8~Wkj01g~Ng__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
      title: 'คอมแพค พาวเดอร์',
    ),
    RecommendGoodsModel(
      id: '36',
      image:
          'https://s3-alpha-sig.figma.com/img/a17a/46a0/b61f2b377247d188d42ad343ccddb317?Expires=1675641600&Signature=ntGiUIGFp3zDQjzt0cG4oYFNVq5Fb43MrwyGaM0yG~op41yl1Enq-s8y~GQN7pc6baymxaACPk8-ULXD6fWKL6RYFT3oY~ORj1r6CTpDIl5hzB4EXOajirMDF0H-DxLC5B0F0F68eAT64TBCoOCezuNWIpQoQ1iUq1OPxdDfkB96TMDJDDMFF5q55EDuZOOmQM2s1JdJt8yky087g8DLLb8xAuDC4Yq9L8TSw2uNxtwcT3huso2Y0dsXL9knqvMUXyC4yrduTlEsOqudx6hOjLbZavQ2mrWWf4v8aYOZYS6Kgx62xJ40oCI8Y5q0iUckGHZeg3JoYR5HlkXgrF9C2g__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
      title: 'บูสเตอร์ มาส์ก',
    ),
    RecommendGoodsModel(
      id: '37',
      image:
          'https://s3-alpha-sig.figma.com/img/25b4/a6a3/3534ecc797a82bba2a7bc30315dc5dca?Expires=1675641600&Signature=lP-FZfHOWlXtHAr7KncaYQ7NsPGec7w6Rq-NZ0jSpQVgWkKvfnH1Gk3ULq9~i4dcJGGRSwA9o1WJANV3~LDnoQ7n5zjNTc0YK6d-J8VKnRv5wVTrePNPSmcb3N-G7djSnWyVZvjbRcphWNXEztvkDzkZdsfwcKta5zTGjuI-tT5c-DuTzldFj0O-Bw7RVgezt25EknhaoEh6Te7xhZhhkL7nxTyyL8AhD8zbqwUD1uF0Cf23gQS1K-LvOfoU69vcXUhA0hakitr76qSwVTUSj-u1dqfWCC4hFUYPPw1J0~UwDRBjHhCus2KhmbI1IwzEUyvZPmXmvwLK3UOGWWFn6A__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
      title: 'นาโน ไวท์เทนนิ่ง โซฟ จีพีโฟร์จี',
    ),
    RecommendGoodsModel(
      id: '38',
      image:
          'https://s3-alpha-sig.figma.com/img/08e8/7fe3/8ba2c1655c9d9cea10697c6e58862f7b?Expires=1675641600&Signature=mLzN0NuPNlkwfpmhlgGQlrxp4-Q3LlQU4icflO6-4ZOcLzhbV64BR0O5Vv1H9YZ8Jm0QSI8CUsr~xk7x~UbECa~PEd3AyALUSfjqpiDGpnNdYgTD7Ob6FKJJmN9oiA3o0m-pi~V20JSmhaJPRX57LoEPQpeGegRv1r7URWciuryX50t23iVIVxAbJ7764m2varxfu8ksdIJOwKO54BU7YDVkcx~haDmpA9ivORoepplIvflORDDj2OXmTvWRkX61w9SNvg-ol4HuPdxWCb7QLPHMUPqHCZpAP3YuJUHcSnak7pVU7uvDhpszmnRIoeRwKFCODoqSlSw8~Wkj01g~Ng__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
      title: 'คอมแพค พาวเดอร์',
    ),
    RecommendGoodsModel(
      id: '39',
      image:
          'https://s3-alpha-sig.figma.com/img/a17a/46a0/b61f2b377247d188d42ad343ccddb317?Expires=1675641600&Signature=ntGiUIGFp3zDQjzt0cG4oYFNVq5Fb43MrwyGaM0yG~op41yl1Enq-s8y~GQN7pc6baymxaACPk8-ULXD6fWKL6RYFT3oY~ORj1r6CTpDIl5hzB4EXOajirMDF0H-DxLC5B0F0F68eAT64TBCoOCezuNWIpQoQ1iUq1OPxdDfkB96TMDJDDMFF5q55EDuZOOmQM2s1JdJt8yky087g8DLLb8xAuDC4Yq9L8TSw2uNxtwcT3huso2Y0dsXL9knqvMUXyC4yrduTlEsOqudx6hOjLbZavQ2mrWWf4v8aYOZYS6Kgx62xJ40oCI8Y5q0iUckGHZeg3JoYR5HlkXgrF9C2g__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
      title: 'บูสเตอร์ มาส์ก',
    ),
    RecommendGoodsModel(
      id: '40',
      image:
          'https://s3-alpha-sig.figma.com/img/25b4/a6a3/3534ecc797a82bba2a7bc30315dc5dca?Expires=1675641600&Signature=lP-FZfHOWlXtHAr7KncaYQ7NsPGec7w6Rq-NZ0jSpQVgWkKvfnH1Gk3ULq9~i4dcJGGRSwA9o1WJANV3~LDnoQ7n5zjNTc0YK6d-J8VKnRv5wVTrePNPSmcb3N-G7djSnWyVZvjbRcphWNXEztvkDzkZdsfwcKta5zTGjuI-tT5c-DuTzldFj0O-Bw7RVgezt25EknhaoEh6Te7xhZhhkL7nxTyyL8AhD8zbqwUD1uF0Cf23gQS1K-LvOfoU69vcXUhA0hakitr76qSwVTUSj-u1dqfWCC4hFUYPPw1J0~UwDRBjHhCus2KhmbI1IwzEUyvZPmXmvwLK3UOGWWFn6A__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
      title: 'นาโน ไวท์เทนนิ่ง โซฟ จีพีโฟร์จี',
    ),
    RecommendGoodsModel(
      id: '41',
      image:
          'https://s3-alpha-sig.figma.com/img/08e8/7fe3/8ba2c1655c9d9cea10697c6e58862f7b?Expires=1675641600&Signature=mLzN0NuPNlkwfpmhlgGQlrxp4-Q3LlQU4icflO6-4ZOcLzhbV64BR0O5Vv1H9YZ8Jm0QSI8CUsr~xk7x~UbECa~PEd3AyALUSfjqpiDGpnNdYgTD7Ob6FKJJmN9oiA3o0m-pi~V20JSmhaJPRX57LoEPQpeGegRv1r7URWciuryX50t23iVIVxAbJ7764m2varxfu8ksdIJOwKO54BU7YDVkcx~haDmpA9ivORoepplIvflORDDj2OXmTvWRkX61w9SNvg-ol4HuPdxWCb7QLPHMUPqHCZpAP3YuJUHcSnak7pVU7uvDhpszmnRIoeRwKFCODoqSlSw8~Wkj01g~Ng__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
      title: 'คอมแพค พาวเดอร์',
    ),
    RecommendGoodsModel(
      id: '42',
      image:
          'https://s3-alpha-sig.figma.com/img/a17a/46a0/b61f2b377247d188d42ad343ccddb317?Expires=1675641600&Signature=ntGiUIGFp3zDQjzt0cG4oYFNVq5Fb43MrwyGaM0yG~op41yl1Enq-s8y~GQN7pc6baymxaACPk8-ULXD6fWKL6RYFT3oY~ORj1r6CTpDIl5hzB4EXOajirMDF0H-DxLC5B0F0F68eAT64TBCoOCezuNWIpQoQ1iUq1OPxdDfkB96TMDJDDMFF5q55EDuZOOmQM2s1JdJt8yky087g8DLLb8xAuDC4Yq9L8TSw2uNxtwcT3huso2Y0dsXL9knqvMUXyC4yrduTlEsOqudx6hOjLbZavQ2mrWWf4v8aYOZYS6Kgx62xJ40oCI8Y5q0iUckGHZeg3JoYR5HlkXgrF9C2g__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
      title: 'บูสเตอร์ มาส์ก',
    ),
    RecommendGoodsModel(
      id: '43',
      image:
          'https://s3-alpha-sig.figma.com/img/25b4/a6a3/3534ecc797a82bba2a7bc30315dc5dca?Expires=1675641600&Signature=lP-FZfHOWlXtHAr7KncaYQ7NsPGec7w6Rq-NZ0jSpQVgWkKvfnH1Gk3ULq9~i4dcJGGRSwA9o1WJANV3~LDnoQ7n5zjNTc0YK6d-J8VKnRv5wVTrePNPSmcb3N-G7djSnWyVZvjbRcphWNXEztvkDzkZdsfwcKta5zTGjuI-tT5c-DuTzldFj0O-Bw7RVgezt25EknhaoEh6Te7xhZhhkL7nxTyyL8AhD8zbqwUD1uF0Cf23gQS1K-LvOfoU69vcXUhA0hakitr76qSwVTUSj-u1dqfWCC4hFUYPPw1J0~UwDRBjHhCus2KhmbI1IwzEUyvZPmXmvwLK3UOGWWFn6A__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
      title: 'นาโน ไวท์เทนนิ่ง โซฟ จีพีโฟร์จี',
    ),
    RecommendGoodsModel(
      id: '44',
      image:
          'https://s3-alpha-sig.figma.com/img/08e8/7fe3/8ba2c1655c9d9cea10697c6e58862f7b?Expires=1675641600&Signature=mLzN0NuPNlkwfpmhlgGQlrxp4-Q3LlQU4icflO6-4ZOcLzhbV64BR0O5Vv1H9YZ8Jm0QSI8CUsr~xk7x~UbECa~PEd3AyALUSfjqpiDGpnNdYgTD7Ob6FKJJmN9oiA3o0m-pi~V20JSmhaJPRX57LoEPQpeGegRv1r7URWciuryX50t23iVIVxAbJ7764m2varxfu8ksdIJOwKO54BU7YDVkcx~haDmpA9ivORoepplIvflORDDj2OXmTvWRkX61w9SNvg-ol4HuPdxWCb7QLPHMUPqHCZpAP3YuJUHcSnak7pVU7uvDhpszmnRIoeRwKFCODoqSlSw8~Wkj01g~Ng__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
      title: 'คอมแพค พาวเดอร์',
    ),
    RecommendGoodsModel(
      id: '45',
      image:
          'https://s3-alpha-sig.figma.com/img/a17a/46a0/b61f2b377247d188d42ad343ccddb317?Expires=1675641600&Signature=ntGiUIGFp3zDQjzt0cG4oYFNVq5Fb43MrwyGaM0yG~op41yl1Enq-s8y~GQN7pc6baymxaACPk8-ULXD6fWKL6RYFT3oY~ORj1r6CTpDIl5hzB4EXOajirMDF0H-DxLC5B0F0F68eAT64TBCoOCezuNWIpQoQ1iUq1OPxdDfkB96TMDJDDMFF5q55EDuZOOmQM2s1JdJt8yky087g8DLLb8xAuDC4Yq9L8TSw2uNxtwcT3huso2Y0dsXL9knqvMUXyC4yrduTlEsOqudx6hOjLbZavQ2mrWWf4v8aYOZYS6Kgx62xJ40oCI8Y5q0iUckGHZeg3JoYR5HlkXgrF9C2g__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
      title: 'บูสเตอร์ มาส์ก',
    ),
    RecommendGoodsModel(
      id: '46',
      image:
          'https://s3-alpha-sig.figma.com/img/25b4/a6a3/3534ecc797a82bba2a7bc30315dc5dca?Expires=1675641600&Signature=lP-FZfHOWlXtHAr7KncaYQ7NsPGec7w6Rq-NZ0jSpQVgWkKvfnH1Gk3ULq9~i4dcJGGRSwA9o1WJANV3~LDnoQ7n5zjNTc0YK6d-J8VKnRv5wVTrePNPSmcb3N-G7djSnWyVZvjbRcphWNXEztvkDzkZdsfwcKta5zTGjuI-tT5c-DuTzldFj0O-Bw7RVgezt25EknhaoEh6Te7xhZhhkL7nxTyyL8AhD8zbqwUD1uF0Cf23gQS1K-LvOfoU69vcXUhA0hakitr76qSwVTUSj-u1dqfWCC4hFUYPPw1J0~UwDRBjHhCus2KhmbI1IwzEUyvZPmXmvwLK3UOGWWFn6A__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
      title: 'นาโน ไวท์เทนนิ่ง โซฟ จีพีโฟร์จี',
    ),
    RecommendGoodsModel(
      id: '47',
      image:
          'https://s3-alpha-sig.figma.com/img/08e8/7fe3/8ba2c1655c9d9cea10697c6e58862f7b?Expires=1675641600&Signature=mLzN0NuPNlkwfpmhlgGQlrxp4-Q3LlQU4icflO6-4ZOcLzhbV64BR0O5Vv1H9YZ8Jm0QSI8CUsr~xk7x~UbECa~PEd3AyALUSfjqpiDGpnNdYgTD7Ob6FKJJmN9oiA3o0m-pi~V20JSmhaJPRX57LoEPQpeGegRv1r7URWciuryX50t23iVIVxAbJ7764m2varxfu8ksdIJOwKO54BU7YDVkcx~haDmpA9ivORoepplIvflORDDj2OXmTvWRkX61w9SNvg-ol4HuPdxWCb7QLPHMUPqHCZpAP3YuJUHcSnak7pVU7uvDhpszmnRIoeRwKFCODoqSlSw8~Wkj01g~Ng__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
      title: 'คอมแพค พาวเดอร์',
    ),
    RecommendGoodsModel(
      id: '48',
      image:
          'https://s3-alpha-sig.figma.com/img/a17a/46a0/b61f2b377247d188d42ad343ccddb317?Expires=1675641600&Signature=ntGiUIGFp3zDQjzt0cG4oYFNVq5Fb43MrwyGaM0yG~op41yl1Enq-s8y~GQN7pc6baymxaACPk8-ULXD6fWKL6RYFT3oY~ORj1r6CTpDIl5hzB4EXOajirMDF0H-DxLC5B0F0F68eAT64TBCoOCezuNWIpQoQ1iUq1OPxdDfkB96TMDJDDMFF5q55EDuZOOmQM2s1JdJt8yky087g8DLLb8xAuDC4Yq9L8TSw2uNxtwcT3huso2Y0dsXL9knqvMUXyC4yrduTlEsOqudx6hOjLbZavQ2mrWWf4v8aYOZYS6Kgx62xJ40oCI8Y5q0iUckGHZeg3JoYR5HlkXgrF9C2g__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
      title: 'บูสเตอร์ มาส์ก',
    ),
    RecommendGoodsModel(
      id: '49',
      image:
          'https://s3-alpha-sig.figma.com/img/08e8/7fe3/8ba2c1655c9d9cea10697c6e58862f7b?Expires=1675641600&Signature=mLzN0NuPNlkwfpmhlgGQlrxp4-Q3LlQU4icflO6-4ZOcLzhbV64BR0O5Vv1H9YZ8Jm0QSI8CUsr~xk7x~UbECa~PEd3AyALUSfjqpiDGpnNdYgTD7Ob6FKJJmN9oiA3o0m-pi~V20JSmhaJPRX57LoEPQpeGegRv1r7URWciuryX50t23iVIVxAbJ7764m2varxfu8ksdIJOwKO54BU7YDVkcx~haDmpA9ivORoepplIvflORDDj2OXmTvWRkX61w9SNvg-ol4HuPdxWCb7QLPHMUPqHCZpAP3YuJUHcSnak7pVU7uvDhpszmnRIoeRwKFCODoqSlSw8~Wkj01g~Ng__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
      title: 'คอมแพค พาวเดอร์',
    ),
    RecommendGoodsModel(
      id: '50',
      image:
          'https://s3-alpha-sig.figma.com/img/a17a/46a0/b61f2b377247d188d42ad343ccddb317?Expires=1675641600&Signature=ntGiUIGFp3zDQjzt0cG4oYFNVq5Fb43MrwyGaM0yG~op41yl1Enq-s8y~GQN7pc6baymxaACPk8-ULXD6fWKL6RYFT3oY~ORj1r6CTpDIl5hzB4EXOajirMDF0H-DxLC5B0F0F68eAT64TBCoOCezuNWIpQoQ1iUq1OPxdDfkB96TMDJDDMFF5q55EDuZOOmQM2s1JdJt8yky087g8DLLb8xAuDC4Yq9L8TSw2uNxtwcT3huso2Y0dsXL9knqvMUXyC4yrduTlEsOqudx6hOjLbZavQ2mrWWf4v8aYOZYS6Kgx62xJ40oCI8Y5q0iUckGHZeg3JoYR5HlkXgrF9C2g__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
      title: 'บูสเตอร์ มาส์ก',
    ),
  ];

  // Getter

  List<PromotionModel> get promotionList => _promotionList;
  List<BestSellGoodsModel> get bestSellGoodsList => _bestSellGoodsList;
  List<RecommendGoodsModel> get recommendGoodsList => _recommendGoodsList;

  void pressProduct() {
    Get.toNamed(AppRoutes.PRODUCTDETAIL);
  }
}
