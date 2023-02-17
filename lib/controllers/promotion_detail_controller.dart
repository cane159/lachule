import 'package:lachule/bases/base_controller.dart';
import 'package:lachule/models/promotion_detail.dart';

class PromotionDetailController extends BaseController {
  final PromotionDetailModel _promotionDetail = PromotionDetailModel(
    id: '1',
    title: 'โปรโมชั่นเดือนพฤศจิกายน 2565',
    image:
        'https://s3-alpha-sig.figma.com/img/f183/300a/727e94c90c923dfc3091ac83d14723e0?Expires=1677456000&Signature=BLyUELLxl72ls-VfNGmxEACSrlbwzRCQHGslWzS~4aIGuvE2Lup81KSl3VRsB8cvy4CAvF8UT4FnPd8KEIJpZ1LNFxdQ8cfpKFDgObuwf7AfrBQJdiX87NR-DKObDF9VnJZTBmbSOEPXp3cdM9r-93~x1rKVZ8WTKq4EUDTgmoBz0Gjnem0pqjaCS1Elh1ZEpC0BpcaSRCz1xkdwbOuhwjUsxm9U3BAx1Mp5MiQNEOYlCcvibdu0~ErQBe-SsqVi9YlEh7m7Kv2Pb6Ju3SLdUgfUjj022jGr3mZSEBdSUW5KsF9IhZX-~BlyPNYlEOkQG6WdUbZTQR~Ni9UU~UK3hA__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
    description:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Netus pellentesque ullamcorper scelerisque pulvinar libero semper id enim id. Viverra at quis elit non maecenas consectetur non. Tellus commodo morbi arcu tellus. Ut aenean porttitor porttitor id faucibus adipiscing proin. Elit, commodo mollis diam egestas. Nascetur nisi sit maecenas nisi, sed. Tincidunt nunc mauris mi, ut vitae suspendisse. Sit ornare suspendisse elit interdum vestibulum at purus viverra. Ut tempus vitae libero faucibus. Nulla id pharetra purus in magna cursus consectetur. Amet, duis gravida urna, nunc. Arcu quis in tincidunt aliquam malesuada sit. Proin consectetur neque, nec, in. Fermentum scelerisque ipsum risus luctus lorem in mauris adipiscing hendrerit. Enim, venenatis ornare fames urna enim in feugiat. Proin sed donec.',
    endDate: "2023-03-25T03:54:08.931948Z",
    price: 1600,
    point: 50,
  );

  // Getter

  PromotionDetailModel get promotionDetail => _promotionDetail;
}
