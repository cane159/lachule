import 'package:lachule/bases/base_controller.dart';
import 'package:lachule/models/product_detail_model.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';

class ProductDetailController extends BaseController {
  final formatCurrency = new NumberFormat("#,##0.00", "th_TH");

  @override
  void onInit() {
    // TODO: implement onInit
    print('object');
    _priceIntl();
    super.onInit();
  }

  late String _productPrice;
  final _descriptionIndex = 0.obs;

  final ProductDetailModel _produceDetail = ProductDetailModel(
    id: '1',
    title: 'นาโน แอคเน่ ครีม จีพีโฟร์จี',
    image:
        'https://s3-alpha-sig.figma.com/img/3882/55bc/dafa8fbfd8ac49059021da6fe48915a5?Expires=1675641600&Signature=B1H9XxWD~9cGE7pWnU4LzTwnNodtVm4IPZfLXL~4~70LxfCScKcwjuQtbfv9hD9ZyXdy1mGdwAqVI7oajsBBYHlGfAHXg8KXX-5~VBO4XmJ8uqL0-uL1e3~zqhKLDGxsWA7lPNc~Z7V-nZO3zP6dVN31Sgij8~TfDGFwXC2TM0ifFsJUj15U13IcWCA-561zqbEC1RCYKXnfHmJf6jpyRFS5MxHYpD85D5Dv4T2U7PyYwTn8SC~DAC6BQm0Q0wSWaEDKiNXIgkUzTID9h0xfQDd7WjCSDybkvv7iU9S2oebvyN2751Hq1b1amN5rlCi05FXxY-I4GmKLKQDDbQseXw__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
    description:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Netus pellentesque ullamcorper scelerisque pulvinar libero semper id enim id. Viverra at quis elit non maecenas consectetur non. Tellus commodo morbi arcu tellus. Ut aenean porttitor porttitor id faucibus adipiscing proin. Elit, commodo mollis diam egestas. Nascetur nisi sit maecenas nisi, sed. Tincidunt nunc mauris mi, ut vitae suspendisse. Sit ornare suspendisse elit interdum vestibulum at purus viverra. Ut tempus vitae libero faucibus. Nulla id pharetra purus in magna cursus consectetur. Amet, duis gravida urna, nunc. Arcu quis in tincidunt aliquam malesuada sit. Proin consectetur neque, nec, in. Fermentum scelerisque ipsum risus luctus lorem in mauris adipiscing hendrerit. Enim, venenatis ornare fames urna enim in feugiat. Proin sed donec.',
    specifications:
        "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).",
    howToUse:
        "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.",
    price: 1600,
    point: 50,
  );

  // Getter

  ProductDetailModel get produceDetail => _produceDetail;
  String get productPrice => _productPrice;
  int get descriptionIndex => _descriptionIndex.value;

  void pressDescription(int index) {
    _descriptionIndex.value = index;
  }

  void _priceIntl() {
    _productPrice = formatCurrency.format(_produceDetail.price);
  }
}
