import 'package:lachule/bases/base_controller.dart';
import 'package:lachule/models/promotion_detail.dart';

class PromotionDetailController extends BaseController {
  final PromotionDetailModel _promotionDetail = PromotionDetailModel(
    id: '1',
    title: 'โปรโมชั่นเดือนพฤศจิกายน 2565',
    image:
        'https://s3-alpha-sig.figma.com/img/04eb/1d0f/d9a28b59aa5b89ff2f7a59130c33015c?Expires=1678060800&Signature=cajs5HIfcugzgEUFqh~DKK2qnBNg7~aJRpOSahTcoDDgb5dnTV4WB6rOd6DVTRy1QnKM7ekNA0H3WTc90v9Ok829jW8RIvEWN0t~Kxn5l7PaKWwnKpmmgqgYI0BJo3mti5k0nR2wkFiZt3bcqp7wf7R-zf-F-CM-a73I0DAiXxOXD32ZKanQJhrjN84J8HgQ9yGcjGd4uMd7A5qqKWtUODOD4LwTd4FkkehhtjIi8alNmqcrVtAjZ70p2ZEimEH1YCat2sraxuDyqTQ-GPXba~WF-v-yn12bM83w3xrUAGvEokRdVFVx7V3IehcFv7gakNPcXLwbl52uL-7PoGDUTA__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
    description:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Netus pellentesque ullamcorper scelerisque pulvinar libero semper id enim id. Viverra at quis elit non maecenas consectetur non. Tellus commodo morbi arcu tellus. Ut aenean porttitor porttitor id faucibus adipiscing proin. Elit, commodo mollis diam egestas. Nascetur nisi sit maecenas nisi, sed. Tincidunt nunc mauris mi, ut vitae suspendisse. Sit ornare suspendisse elit interdum vestibulum at purus viverra. Ut tempus vitae libero faucibus. Nulla id pharetra purus in magna cursus consectetur. Amet, duis gravida urna, nunc. Arcu quis in tincidunt aliquam malesuada sit. Proin consectetur neque, nec, in. Fermentum scelerisque ipsum risus luctus lorem in mauris adipiscing hendrerit. Enim, venenatis ornare fames urna enim in feugiat. Proin sed donec.',
    endDate: "2023-03-25T03:54:08.931948Z",
    price: 1600,
    point: 50,
  );

  // Getter

  PromotionDetailModel get promotionDetail => _promotionDetail;
}
