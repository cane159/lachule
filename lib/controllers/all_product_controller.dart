import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:lachule/bases/base_controller.dart';
import 'package:lachule/models/product_detail_model.dart';
import 'package:lachule/models/product_tag.dart';

class AllProductController extends BaseController {
  final formatCurrency = NumberFormat("#,##0.00", "th_TH");

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  final RxList<ProductDetailModel> _allProduct = [
    ProductDetailModel(
      id: '1',
      title: 'นาโน แอคเน่ ครีม จีพีโฟร์จี',
      image:
          'https://s3-alpha-sig.figma.com/img/3882/55bc/dafa8fbfd8ac49059021da6fe48915a5?Expires=1679270400&Signature=Glch7f2gAHzWoGXouDXpZIfSBDMH6Ygk1dR5gv8SaIv3CcvO3d-6cJCrljofzIo5ng3MjTbwrKWuJruT1eu1AhlNs8tX5B6alg5N1Jdt~zgDeKq5SPg-3nJIQW66cshHrs1HDvmieqkNzPhhhm-EPInxX3fGGJ-DRXNI3IL6XGsolagJ7WbOmpszgfdG0M8ldA6aT3TsYklkWizjZMkON-Ji3Ku9HtoaxLc9smr~xLLTMhwwU0GdypJ97x1BYzIdR-W6LwVww87seXIdZeep2EpEgBUeg3oSx2Sm~UHoaQEXmOfpRGNwpQiE5ApH8HrdIhnXYTHpDiKKZfUIG4VcOA__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
      description: '',
      specifications: '',
      howToUse: '',
      tag: 'ผลิตภัณฑ์บำรุงผิว',
      price: 1600,
      point: 50,
    ),
    ProductDetailModel(
      id: '2',
      title: 'นาโน แอคเน่ ครีม',
      image:
          'https://s3-alpha-sig.figma.com/img/3882/55bc/dafa8fbfd8ac49059021da6fe48915a5?Expires=1679270400&Signature=Glch7f2gAHzWoGXouDXpZIfSBDMH6Ygk1dR5gv8SaIv3CcvO3d-6cJCrljofzIo5ng3MjTbwrKWuJruT1eu1AhlNs8tX5B6alg5N1Jdt~zgDeKq5SPg-3nJIQW66cshHrs1HDvmieqkNzPhhhm-EPInxX3fGGJ-DRXNI3IL6XGsolagJ7WbOmpszgfdG0M8ldA6aT3TsYklkWizjZMkON-Ji3Ku9HtoaxLc9smr~xLLTMhwwU0GdypJ97x1BYzIdR-W6LwVww87seXIdZeep2EpEgBUeg3oSx2Sm~UHoaQEXmOfpRGNwpQiE5ApH8HrdIhnXYTHpDiKKZfUIG4VcOA__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
      description: '',
      specifications: '',
      howToUse: '',
      tag: 'ผลิตภัณฑ์บำรุงผิว',
      price: 1400,
      point: 50,
    ),
    ProductDetailModel(
      id: '3',
      title: 'นาโน แอคเน่ ครีม จีพีโฟร์จี',
      image:
          'https://s3-alpha-sig.figma.com/img/3882/55bc/dafa8fbfd8ac49059021da6fe48915a5?Expires=1679270400&Signature=Glch7f2gAHzWoGXouDXpZIfSBDMH6Ygk1dR5gv8SaIv3CcvO3d-6cJCrljofzIo5ng3MjTbwrKWuJruT1eu1AhlNs8tX5B6alg5N1Jdt~zgDeKq5SPg-3nJIQW66cshHrs1HDvmieqkNzPhhhm-EPInxX3fGGJ-DRXNI3IL6XGsolagJ7WbOmpszgfdG0M8ldA6aT3TsYklkWizjZMkON-Ji3Ku9HtoaxLc9smr~xLLTMhwwU0GdypJ97x1BYzIdR-W6LwVww87seXIdZeep2EpEgBUeg3oSx2Sm~UHoaQEXmOfpRGNwpQiE5ApH8HrdIhnXYTHpDiKKZfUIG4VcOA__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
      description: '',
      specifications: '',
      howToUse: '',
      tag: 'ผลิตภัณฑ์ทำความสะอาด',
      price: 1399,
      point: 50,
    ),
    ProductDetailModel(
      id: '4',
      title: 'นาโน แอคเน่ ครีม จีพีโฟร์จี',
      image:
          'https://s3-alpha-sig.figma.com/img/3882/55bc/dafa8fbfd8ac49059021da6fe48915a5?Expires=1679270400&Signature=Glch7f2gAHzWoGXouDXpZIfSBDMH6Ygk1dR5gv8SaIv3CcvO3d-6cJCrljofzIo5ng3MjTbwrKWuJruT1eu1AhlNs8tX5B6alg5N1Jdt~zgDeKq5SPg-3nJIQW66cshHrs1HDvmieqkNzPhhhm-EPInxX3fGGJ-DRXNI3IL6XGsolagJ7WbOmpszgfdG0M8ldA6aT3TsYklkWizjZMkON-Ji3Ku9HtoaxLc9smr~xLLTMhwwU0GdypJ97x1BYzIdR-W6LwVww87seXIdZeep2EpEgBUeg3oSx2Sm~UHoaQEXmOfpRGNwpQiE5ApH8HrdIhnXYTHpDiKKZfUIG4VcOA__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
      description: '',
      specifications: '',
      howToUse: '',
      tag: 'ผลิตภัณฑ์ทำความสะอาด',
      price: 1399,
      point: 50,
    ),
    ProductDetailModel(
      id: '5',
      title: 'นาโน แอคเน่ ครีม จีพีโฟร์จี',
      image:
          'https://s3-alpha-sig.figma.com/img/3882/55bc/dafa8fbfd8ac49059021da6fe48915a5?Expires=1679270400&Signature=Glch7f2gAHzWoGXouDXpZIfSBDMH6Ygk1dR5gv8SaIv3CcvO3d-6cJCrljofzIo5ng3MjTbwrKWuJruT1eu1AhlNs8tX5B6alg5N1Jdt~zgDeKq5SPg-3nJIQW66cshHrs1HDvmieqkNzPhhhm-EPInxX3fGGJ-DRXNI3IL6XGsolagJ7WbOmpszgfdG0M8ldA6aT3TsYklkWizjZMkON-Ji3Ku9HtoaxLc9smr~xLLTMhwwU0GdypJ97x1BYzIdR-W6LwVww87seXIdZeep2EpEgBUeg3oSx2Sm~UHoaQEXmOfpRGNwpQiE5ApH8HrdIhnXYTHpDiKKZfUIG4VcOA__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
      description: '',
      specifications: '',
      howToUse: '',
      tag: 'ผลิตภัณฑ์บำรุงผิว',
      price: 1600,
      point: 50,
    ),
    ProductDetailModel(
      id: '6',
      title: 'นาโน แอคเน่ ครีม',
      image:
          'https://s3-alpha-sig.figma.com/img/3882/55bc/dafa8fbfd8ac49059021da6fe48915a5?Expires=1679270400&Signature=Glch7f2gAHzWoGXouDXpZIfSBDMH6Ygk1dR5gv8SaIv3CcvO3d-6cJCrljofzIo5ng3MjTbwrKWuJruT1eu1AhlNs8tX5B6alg5N1Jdt~zgDeKq5SPg-3nJIQW66cshHrs1HDvmieqkNzPhhhm-EPInxX3fGGJ-DRXNI3IL6XGsolagJ7WbOmpszgfdG0M8ldA6aT3TsYklkWizjZMkON-Ji3Ku9HtoaxLc9smr~xLLTMhwwU0GdypJ97x1BYzIdR-W6LwVww87seXIdZeep2EpEgBUeg3oSx2Sm~UHoaQEXmOfpRGNwpQiE5ApH8HrdIhnXYTHpDiKKZfUIG4VcOA__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
      description: '',
      specifications: '',
      howToUse: '',
      tag: 'ผลิตภัณฑ์บำรุงผิว',
      price: 1400,
      point: 50,
    ),
    ProductDetailModel(
      id: '7',
      title: 'นาโน แอคเน่ ครีม จีพีโฟร์จี',
      image:
          'https://s3-alpha-sig.figma.com/img/3882/55bc/dafa8fbfd8ac49059021da6fe48915a5?Expires=1679270400&Signature=Glch7f2gAHzWoGXouDXpZIfSBDMH6Ygk1dR5gv8SaIv3CcvO3d-6cJCrljofzIo5ng3MjTbwrKWuJruT1eu1AhlNs8tX5B6alg5N1Jdt~zgDeKq5SPg-3nJIQW66cshHrs1HDvmieqkNzPhhhm-EPInxX3fGGJ-DRXNI3IL6XGsolagJ7WbOmpszgfdG0M8ldA6aT3TsYklkWizjZMkON-Ji3Ku9HtoaxLc9smr~xLLTMhwwU0GdypJ97x1BYzIdR-W6LwVww87seXIdZeep2EpEgBUeg3oSx2Sm~UHoaQEXmOfpRGNwpQiE5ApH8HrdIhnXYTHpDiKKZfUIG4VcOA__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
      description: '',
      specifications: '',
      howToUse: '',
      tag: 'ผลิตภัณฑ์ทำความสะอาด',
      price: 1399,
      point: 50,
    ),
    ProductDetailModel(
      id: '8',
      title: 'นาโน แอคเน่ ครีม จีพีโฟร์จี',
      image:
          'https://s3-alpha-sig.figma.com/img/3882/55bc/dafa8fbfd8ac49059021da6fe48915a5?Expires=1679270400&Signature=Glch7f2gAHzWoGXouDXpZIfSBDMH6Ygk1dR5gv8SaIv3CcvO3d-6cJCrljofzIo5ng3MjTbwrKWuJruT1eu1AhlNs8tX5B6alg5N1Jdt~zgDeKq5SPg-3nJIQW66cshHrs1HDvmieqkNzPhhhm-EPInxX3fGGJ-DRXNI3IL6XGsolagJ7WbOmpszgfdG0M8ldA6aT3TsYklkWizjZMkON-Ji3Ku9HtoaxLc9smr~xLLTMhwwU0GdypJ97x1BYzIdR-W6LwVww87seXIdZeep2EpEgBUeg3oSx2Sm~UHoaQEXmOfpRGNwpQiE5ApH8HrdIhnXYTHpDiKKZfUIG4VcOA__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
      description: '',
      specifications: '',
      howToUse: '',
      tag: 'ผลิตภัณฑ์ทำความสะอาด',
      price: 1399,
      point: 50,
    ),
  ].obs;

  final RxList<ProductTagModel> _productTag = [
    ProductTagModel(
      id: '1',
      name: 'ทั้งหมด',
    ),
    ProductTagModel(
      id: '2',
      name: 'ผลิตภัณฑ์ทำความสะอาด',
    ),
    ProductTagModel(
      id: '3',
      name: 'ผลิตภัณฑ์บำรุงผิวหน้า',
    ),
  ].obs;

  final _tagIndex = 0.obs;

  // Getter

  List<ProductDetailModel> get allProduct => _allProduct;
  List<ProductTagModel> get productTag => _productTag;
  int get tagIndex => _tagIndex.value;

  void pressedTagButton(int index) {
    _tagIndex.value = index;
  }

  String priceIntl(var price) {
    return formatCurrency.format(price);
  }
}
