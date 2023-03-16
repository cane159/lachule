import 'package:lachule/bases/base_controller.dart';
import 'package:lachule/models/promotion_detail.dart';

class PromotionDetailController extends BaseController {
  final PromotionDetailModel _promotionDetail = PromotionDetailModel(
    id: '1',
    title: 'โปรโมชั่นเดือนพฤศจิกายน 2565',
    image:
        'https://s3-alpha-sig.figma.com/img/25b4/a6a3/3534ecc797a82bba2a7bc30315dc5dca?Expires=1679270400&Signature=UNNSHI7NyrqUvC3iod~IsdnASfPFmRlpTJh8zxILowmFDcKopmOypcP9EciEeZnjamQOUVwvmjm6~RkGhYuolMmLZMDnX9v46Wv7n14RpM6BXu1zfaR2hmFbQWe2TFvJ2WchuQKGPw681zPLA-nFY46dpUOpEp7cNwTGY17m9aboLPzPYGOhlnihjsPVRkSApQkuwMlcSj0TzblSVJr0xvcPl6benVV8djY6Rk5MPE6fYgdRqxK7dt5D0V~tQFAUTpjg2fio~6XOygeIRwQs9L-augDvpJPFGycdHUQ-AGfHKWPvm5mDwDUi5WzPIPXxwuUXHwgmdCq0w49SoGduOA__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
    description:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Netus pellentesque ullamcorper scelerisque pulvinar libero semper id enim id. Viverra at quis elit non maecenas consectetur non. Tellus commodo morbi arcu tellus. Ut aenean porttitor porttitor id faucibus adipiscing proin. Elit, commodo mollis diam egestas. Nascetur nisi sit maecenas nisi, sed. Tincidunt nunc mauris mi, ut vitae suspendisse. Sit ornare suspendisse elit interdum vestibulum at purus viverra. Ut tempus vitae libero faucibus. Nulla id pharetra purus in magna cursus consectetur. Amet, duis gravida urna, nunc. Arcu quis in tincidunt aliquam malesuada sit. Proin consectetur neque, nec, in. Fermentum scelerisque ipsum risus luctus lorem in mauris adipiscing hendrerit. Enim, venenatis ornare fames urna enim in feugiat. Proin sed donec.',
    endDate: "2023-03-25T03:54:08.931948Z",
    price: 1600,
    point: 50,
  );

  // Getter

  PromotionDetailModel get promotionDetail => _promotionDetail;
}
