import 'package:lachule/bases/base_controller.dart';
import 'package:lachule/models/promotion_detail.dart';

class PromotionDetailController extends BaseController {
  final PromotionDetailModel _promotionDetail = PromotionDetailModel(
    id: '1',
    title: 'โปรโมชั่นเดือนพฤศจิกายน 2565',
    image:
        'https://s3-alpha-sig.figma.com/img/f183/300a/727e94c90c923dfc3091ac83d14723e0?Expires=1675641600&Signature=C7N7~6O9ZjMjOcmLklR2niaApdqtG5210ZuQwBq~pKQmSwPaEwG2ASv6mM-3b4ZnJL~JZUjeexp4msm~cfUNu01Ixi8t0laVBfJiOv~mTqeYt~Q8FD4Nt-sYNrotZtGcf5ndq6fm-YB02mLZKw78l1v~zRPwwFtV-nE1jIhTl3SeaIQbt8MNy3ONRKyNX8NvIqR8HwXJEFI~amEka4kABJD34P7WU7utgneLEKnj4qZe6ZJZbDiSf~dA1RIOFO4Px5B8y42wORwtSIenMAFIBcJWQHSzMB4e25gGSaWG1Lzpv7FKnYutNkEn1von1SwiFMr-KEkzBmkWLjmhcPHeug__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
    description:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Netus pellentesque ullamcorper scelerisque pulvinar libero semper id enim id. Viverra at quis elit non maecenas consectetur non. Tellus commodo morbi arcu tellus. Ut aenean porttitor porttitor id faucibus adipiscing proin. Elit, commodo mollis diam egestas. Nascetur nisi sit maecenas nisi, sed. Tincidunt nunc mauris mi, ut vitae suspendisse. Sit ornare suspendisse elit interdum vestibulum at purus viverra. Ut tempus vitae libero faucibus. Nulla id pharetra purus in magna cursus consectetur. Amet, duis gravida urna, nunc. Arcu quis in tincidunt aliquam malesuada sit. Proin consectetur neque, nec, in. Fermentum scelerisque ipsum risus luctus lorem in mauris adipiscing hendrerit. Enim, venenatis ornare fames urna enim in feugiat. Proin sed donec.',
    endDate: "2023-03-25T03:54:08.931948Z",
    price: 1600,
    point: 50,
  );

  // Getter

  PromotionDetailModel get promotionDetail => _promotionDetail;
}
