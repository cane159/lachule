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
    'https://s3-alpha-sig.figma.com/img/04eb/1d0f/d9a28b59aa5b89ff2f7a59130c33015c?Expires=1678060800&Signature=cajs5HIfcugzgEUFqh~DKK2qnBNg7~aJRpOSahTcoDDgb5dnTV4WB6rOd6DVTRy1QnKM7ekNA0H3WTc90v9Ok829jW8RIvEWN0t~Kxn5l7PaKWwnKpmmgqgYI0BJo3mti5k0nR2wkFiZt3bcqp7wf7R-zf-F-CM-a73I0DAiXxOXD32ZKanQJhrjN84J8HgQ9yGcjGd4uMd7A5qqKWtUODOD4LwTd4FkkehhtjIi8alNmqcrVtAjZ70p2ZEimEH1YCat2sraxuDyqTQ-GPXba~WF-v-yn12bM83w3xrUAGvEokRdVFVx7V3IehcFv7gakNPcXLwbl52uL-7PoGDUTA__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
    'https://s3-alpha-sig.figma.com/img/04eb/1d0f/d9a28b59aa5b89ff2f7a59130c33015c?Expires=1678060800&Signature=cajs5HIfcugzgEUFqh~DKK2qnBNg7~aJRpOSahTcoDDgb5dnTV4WB6rOd6DVTRy1QnKM7ekNA0H3WTc90v9Ok829jW8RIvEWN0t~Kxn5l7PaKWwnKpmmgqgYI0BJo3mti5k0nR2wkFiZt3bcqp7wf7R-zf-F-CM-a73I0DAiXxOXD32ZKanQJhrjN84J8HgQ9yGcjGd4uMd7A5qqKWtUODOD4LwTd4FkkehhtjIi8alNmqcrVtAjZ70p2ZEimEH1YCat2sraxuDyqTQ-GPXba~WF-v-yn12bM83w3xrUAGvEokRdVFVx7V3IehcFv7gakNPcXLwbl52uL-7PoGDUTA__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
    'https://s3-alpha-sig.figma.com/img/04eb/1d0f/d9a28b59aa5b89ff2f7a59130c33015c?Expires=1678060800&Signature=cajs5HIfcugzgEUFqh~DKK2qnBNg7~aJRpOSahTcoDDgb5dnTV4WB6rOd6DVTRy1QnKM7ekNA0H3WTc90v9Ok829jW8RIvEWN0t~Kxn5l7PaKWwnKpmmgqgYI0BJo3mti5k0nR2wkFiZt3bcqp7wf7R-zf-F-CM-a73I0DAiXxOXD32ZKanQJhrjN84J8HgQ9yGcjGd4uMd7A5qqKWtUODOD4LwTd4FkkehhtjIi8alNmqcrVtAjZ70p2ZEimEH1YCat2sraxuDyqTQ-GPXba~WF-v-yn12bM83w3xrUAGvEokRdVFVx7V3IehcFv7gakNPcXLwbl52uL-7PoGDUTA__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
    'https://s3-alpha-sig.figma.com/img/04eb/1d0f/d9a28b59aa5b89ff2f7a59130c33015c?Expires=1678060800&Signature=cajs5HIfcugzgEUFqh~DKK2qnBNg7~aJRpOSahTcoDDgb5dnTV4WB6rOd6DVTRy1QnKM7ekNA0H3WTc90v9Ok829jW8RIvEWN0t~Kxn5l7PaKWwnKpmmgqgYI0BJo3mti5k0nR2wkFiZt3bcqp7wf7R-zf-F-CM-a73I0DAiXxOXD32ZKanQJhrjN84J8HgQ9yGcjGd4uMd7A5qqKWtUODOD4LwTd4FkkehhtjIi8alNmqcrVtAjZ70p2ZEimEH1YCat2sraxuDyqTQ-GPXba~WF-v-yn12bM83w3xrUAGvEokRdVFVx7V3IehcFv7gakNPcXLwbl52uL-7PoGDUTA__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
    'https://s3-alpha-sig.figma.com/img/04eb/1d0f/d9a28b59aa5b89ff2f7a59130c33015c?Expires=1678060800&Signature=cajs5HIfcugzgEUFqh~DKK2qnBNg7~aJRpOSahTcoDDgb5dnTV4WB6rOd6DVTRy1QnKM7ekNA0H3WTc90v9Ok829jW8RIvEWN0t~Kxn5l7PaKWwnKpmmgqgYI0BJo3mti5k0nR2wkFiZt3bcqp7wf7R-zf-F-CM-a73I0DAiXxOXD32ZKanQJhrjN84J8HgQ9yGcjGd4uMd7A5qqKWtUODOD4LwTd4FkkehhtjIi8alNmqcrVtAjZ70p2ZEimEH1YCat2sraxuDyqTQ-GPXba~WF-v-yn12bM83w3xrUAGvEokRdVFVx7V3IehcFv7gakNPcXLwbl52uL-7PoGDUTA__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
  ];
  final List<PromotionModel> _promotionList = [
    PromotionModel(
      id: '1',
      image:
          'https://s3-alpha-sig.figma.com/img/f183/300a/727e94c90c923dfc3091ac83d14723e0?Expires=1678060800&Signature=ZeTi9vSrPv7PM7Sq1XB7o8pbpsIgDPdbmOdu77jVABe9bwIMJyVHLTriXMTSmBCt6tZK6RMfq89zxeetfMmXtSGuGJIuSrY-GhvwM6ayRwdP6y8bKoyGlv~UeYx0UtfA8x-kNG5OMtjlaNUgA5DdfiehmqPqo1TFq3J5ddRT5QC~cEgB37gYg3zjZftfMjeBeuklBc~g7CbOLgmFbwtfivf43dB2ceDuwR5Plv2MMQWSkJiYbF2vGOrzeJkH9Dfpbu2VUR~rbjFynl3ZFqbctHzDVAO1io0FLPPc-4XHEwfApodBYO07VsqB4LYvxdotLwRsojmFjIldm5sWUyn7Fg__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
      title: 'โปรโมชั่นเดือนพฤศจิกายน 2565',
    ),
    PromotionModel(
      id: '2',
      image:
          'https://s3-alpha-sig.figma.com/img/f183/300a/727e94c90c923dfc3091ac83d14723e0?Expires=1678060800&Signature=ZeTi9vSrPv7PM7Sq1XB7o8pbpsIgDPdbmOdu77jVABe9bwIMJyVHLTriXMTSmBCt6tZK6RMfq89zxeetfMmXtSGuGJIuSrY-GhvwM6ayRwdP6y8bKoyGlv~UeYx0UtfA8x-kNG5OMtjlaNUgA5DdfiehmqPqo1TFq3J5ddRT5QC~cEgB37gYg3zjZftfMjeBeuklBc~g7CbOLgmFbwtfivf43dB2ceDuwR5Plv2MMQWSkJiYbF2vGOrzeJkH9Dfpbu2VUR~rbjFynl3ZFqbctHzDVAO1io0FLPPc-4XHEwfApodBYO07VsqB4LYvxdotLwRsojmFjIldm5sWUyn7Fg__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
      title: 'โปรโมชั่นเดือนตุลาคม 2565',
    ),
    PromotionModel(
      id: '3',
      image:
          'https://s3-alpha-sig.figma.com/img/f183/300a/727e94c90c923dfc3091ac83d14723e0?Expires=1678060800&Signature=ZeTi9vSrPv7PM7Sq1XB7o8pbpsIgDPdbmOdu77jVABe9bwIMJyVHLTriXMTSmBCt6tZK6RMfq89zxeetfMmXtSGuGJIuSrY-GhvwM6ayRwdP6y8bKoyGlv~UeYx0UtfA8x-kNG5OMtjlaNUgA5DdfiehmqPqo1TFq3J5ddRT5QC~cEgB37gYg3zjZftfMjeBeuklBc~g7CbOLgmFbwtfivf43dB2ceDuwR5Plv2MMQWSkJiYbF2vGOrzeJkH9Dfpbu2VUR~rbjFynl3ZFqbctHzDVAO1io0FLPPc-4XHEwfApodBYO07VsqB4LYvxdotLwRsojmFjIldm5sWUyn7Fg__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
      title: 'โปรโมชั่นเดือนตุลาคม 2565',
    ),
    PromotionModel(
      id: '4',
      image:
          'https://s3-alpha-sig.figma.com/img/f183/300a/727e94c90c923dfc3091ac83d14723e0?Expires=1678060800&Signature=ZeTi9vSrPv7PM7Sq1XB7o8pbpsIgDPdbmOdu77jVABe9bwIMJyVHLTriXMTSmBCt6tZK6RMfq89zxeetfMmXtSGuGJIuSrY-GhvwM6ayRwdP6y8bKoyGlv~UeYx0UtfA8x-kNG5OMtjlaNUgA5DdfiehmqPqo1TFq3J5ddRT5QC~cEgB37gYg3zjZftfMjeBeuklBc~g7CbOLgmFbwtfivf43dB2ceDuwR5Plv2MMQWSkJiYbF2vGOrzeJkH9Dfpbu2VUR~rbjFynl3ZFqbctHzDVAO1io0FLPPc-4XHEwfApodBYO07VsqB4LYvxdotLwRsojmFjIldm5sWUyn7Fg__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
      title: 'โปรโมชั่นเดือนพฤศจิกายน 2565',
    ),
    PromotionModel(
      id: '5',
      image:
          'https://s3-alpha-sig.figma.com/img/f183/300a/727e94c90c923dfc3091ac83d14723e0?Expires=1678060800&Signature=ZeTi9vSrPv7PM7Sq1XB7o8pbpsIgDPdbmOdu77jVABe9bwIMJyVHLTriXMTSmBCt6tZK6RMfq89zxeetfMmXtSGuGJIuSrY-GhvwM6ayRwdP6y8bKoyGlv~UeYx0UtfA8x-kNG5OMtjlaNUgA5DdfiehmqPqo1TFq3J5ddRT5QC~cEgB37gYg3zjZftfMjeBeuklBc~g7CbOLgmFbwtfivf43dB2ceDuwR5Plv2MMQWSkJiYbF2vGOrzeJkH9Dfpbu2VUR~rbjFynl3ZFqbctHzDVAO1io0FLPPc-4XHEwfApodBYO07VsqB4LYvxdotLwRsojmFjIldm5sWUyn7Fg__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
      title: 'โปรโมชั่นเดือนตุลาคม 2565',
    ),
  ];

  final List<BestSellGoodsModel> _bestSellGoodsList = [
    BestSellGoodsModel(
      id: '1',
      image:
          'https://s3-alpha-sig.figma.com/img/3882/55bc/dafa8fbfd8ac49059021da6fe48915a5?Expires=1678060800&Signature=MTG4ZjIx7NiP-Udx4TwMq1HcevUfxBt2Da0An-cME-p~eQFZx8zJ3QqGPJ-eGpcy1d37XS19QUR1X3H-dI8J-95eB8KkJDOO53ebB~MFOKEoYZRCxI0LSHXsRIRWFVjGj095sPhANz5Lv7MmFmkQmarMJabNN9U6vbknWvgtyriPFdPBnz4l-0mb2Lytr6GKm~N-YipHHHDF9EsHyLie51sA4hXE0-IYz2ercXG7nGsHeqKk9GTpiwMj0hbBpc35vNqnBDXf0x2zJNrdDYPBeti-lkBnqTvK3~GuPTEpNHNu27-p1-7KoRDpT4KSylHRlV8djWSIcGfCL97ZEgOSsA__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
      title: 'นาโน แอคเน่ ครีม จีพีโฟร์จี',
    ),
    BestSellGoodsModel(
      id: '2',
      image:
          'https://s3-alpha-sig.figma.com/img/3882/55bc/dafa8fbfd8ac49059021da6fe48915a5?Expires=1678060800&Signature=MTG4ZjIx7NiP-Udx4TwMq1HcevUfxBt2Da0An-cME-p~eQFZx8zJ3QqGPJ-eGpcy1d37XS19QUR1X3H-dI8J-95eB8KkJDOO53ebB~MFOKEoYZRCxI0LSHXsRIRWFVjGj095sPhANz5Lv7MmFmkQmarMJabNN9U6vbknWvgtyriPFdPBnz4l-0mb2Lytr6GKm~N-YipHHHDF9EsHyLie51sA4hXE0-IYz2ercXG7nGsHeqKk9GTpiwMj0hbBpc35vNqnBDXf0x2zJNrdDYPBeti-lkBnqTvK3~GuPTEpNHNu27-p1-7KoRDpT4KSylHRlV8djWSIcGfCL97ZEgOSsA__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
      title: 'นาโน ซันสกรีน ครีม จีพีโฟร์จี SPF50 PA+++',
    ),
    BestSellGoodsModel(
      id: '3',
      image:
          'https://s3-alpha-sig.figma.com/img/3882/55bc/dafa8fbfd8ac49059021da6fe48915a5?Expires=1678060800&Signature=MTG4ZjIx7NiP-Udx4TwMq1HcevUfxBt2Da0An-cME-p~eQFZx8zJ3QqGPJ-eGpcy1d37XS19QUR1X3H-dI8J-95eB8KkJDOO53ebB~MFOKEoYZRCxI0LSHXsRIRWFVjGj095sPhANz5Lv7MmFmkQmarMJabNN9U6vbknWvgtyriPFdPBnz4l-0mb2Lytr6GKm~N-YipHHHDF9EsHyLie51sA4hXE0-IYz2ercXG7nGsHeqKk9GTpiwMj0hbBpc35vNqnBDXf0x2zJNrdDYPBeti-lkBnqTvK3~GuPTEpNHNu27-p1-7KoRDpT4KSylHRlV8djWSIcGfCL97ZEgOSsA__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
      title: 'นาโน มอยส์เจอร์ไรเซอร์ ครีม จีพีโฟร์จี',
    ),
    BestSellGoodsModel(
      id: '4',
      image:
          'https://s3-alpha-sig.figma.com/img/3882/55bc/dafa8fbfd8ac49059021da6fe48915a5?Expires=1678060800&Signature=MTG4ZjIx7NiP-Udx4TwMq1HcevUfxBt2Da0An-cME-p~eQFZx8zJ3QqGPJ-eGpcy1d37XS19QUR1X3H-dI8J-95eB8KkJDOO53ebB~MFOKEoYZRCxI0LSHXsRIRWFVjGj095sPhANz5Lv7MmFmkQmarMJabNN9U6vbknWvgtyriPFdPBnz4l-0mb2Lytr6GKm~N-YipHHHDF9EsHyLie51sA4hXE0-IYz2ercXG7nGsHeqKk9GTpiwMj0hbBpc35vNqnBDXf0x2zJNrdDYPBeti-lkBnqTvK3~GuPTEpNHNu27-p1-7KoRDpT4KSylHRlV8djWSIcGfCL97ZEgOSsA__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
      title: 'นาโน แอคเน่ ครีม จีพีโฟร์จี',
    ),
    BestSellGoodsModel(
      id: '5',
      image:
          'https://s3-alpha-sig.figma.com/img/3882/55bc/dafa8fbfd8ac49059021da6fe48915a5?Expires=1678060800&Signature=MTG4ZjIx7NiP-Udx4TwMq1HcevUfxBt2Da0An-cME-p~eQFZx8zJ3QqGPJ-eGpcy1d37XS19QUR1X3H-dI8J-95eB8KkJDOO53ebB~MFOKEoYZRCxI0LSHXsRIRWFVjGj095sPhANz5Lv7MmFmkQmarMJabNN9U6vbknWvgtyriPFdPBnz4l-0mb2Lytr6GKm~N-YipHHHDF9EsHyLie51sA4hXE0-IYz2ercXG7nGsHeqKk9GTpiwMj0hbBpc35vNqnBDXf0x2zJNrdDYPBeti-lkBnqTvK3~GuPTEpNHNu27-p1-7KoRDpT4KSylHRlV8djWSIcGfCL97ZEgOSsA__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
      title: 'นาโน ซันสกรีน ครีม จีพีโฟร์จี SPF50 PA+++',
    ),
    BestSellGoodsModel(
      id: '6',
      image:
          'https://s3-alpha-sig.figma.com/img/3882/55bc/dafa8fbfd8ac49059021da6fe48915a5?Expires=1678060800&Signature=MTG4ZjIx7NiP-Udx4TwMq1HcevUfxBt2Da0An-cME-p~eQFZx8zJ3QqGPJ-eGpcy1d37XS19QUR1X3H-dI8J-95eB8KkJDOO53ebB~MFOKEoYZRCxI0LSHXsRIRWFVjGj095sPhANz5Lv7MmFmkQmarMJabNN9U6vbknWvgtyriPFdPBnz4l-0mb2Lytr6GKm~N-YipHHHDF9EsHyLie51sA4hXE0-IYz2ercXG7nGsHeqKk9GTpiwMj0hbBpc35vNqnBDXf0x2zJNrdDYPBeti-lkBnqTvK3~GuPTEpNHNu27-p1-7KoRDpT4KSylHRlV8djWSIcGfCL97ZEgOSsA__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
      title: 'นาโน มอยส์เจอร์ไรเซอร์ ครีม จีพีโฟร์จี',
    ),
    BestSellGoodsModel(
      id: '7',
      image:
          'https://s3-alpha-sig.figma.com/img/3882/55bc/dafa8fbfd8ac49059021da6fe48915a5?Expires=1678060800&Signature=MTG4ZjIx7NiP-Udx4TwMq1HcevUfxBt2Da0An-cME-p~eQFZx8zJ3QqGPJ-eGpcy1d37XS19QUR1X3H-dI8J-95eB8KkJDOO53ebB~MFOKEoYZRCxI0LSHXsRIRWFVjGj095sPhANz5Lv7MmFmkQmarMJabNN9U6vbknWvgtyriPFdPBnz4l-0mb2Lytr6GKm~N-YipHHHDF9EsHyLie51sA4hXE0-IYz2ercXG7nGsHeqKk9GTpiwMj0hbBpc35vNqnBDXf0x2zJNrdDYPBeti-lkBnqTvK3~GuPTEpNHNu27-p1-7KoRDpT4KSylHRlV8djWSIcGfCL97ZEgOSsA__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
      title: 'นาโน แอคเน่ ครีม จีพีโฟร์จี',
    ),
    BestSellGoodsModel(
      id: '8',
      image:
          'https://s3-alpha-sig.figma.com/img/3882/55bc/dafa8fbfd8ac49059021da6fe48915a5?Expires=1678060800&Signature=MTG4ZjIx7NiP-Udx4TwMq1HcevUfxBt2Da0An-cME-p~eQFZx8zJ3QqGPJ-eGpcy1d37XS19QUR1X3H-dI8J-95eB8KkJDOO53ebB~MFOKEoYZRCxI0LSHXsRIRWFVjGj095sPhANz5Lv7MmFmkQmarMJabNN9U6vbknWvgtyriPFdPBnz4l-0mb2Lytr6GKm~N-YipHHHDF9EsHyLie51sA4hXE0-IYz2ercXG7nGsHeqKk9GTpiwMj0hbBpc35vNqnBDXf0x2zJNrdDYPBeti-lkBnqTvK3~GuPTEpNHNu27-p1-7KoRDpT4KSylHRlV8djWSIcGfCL97ZEgOSsA__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
      title: 'นาโน ซันสกรีน ครีม จีพีโฟร์จี SPF50 PA+++',
    ),
    BestSellGoodsModel(
      id: '9',
      image:
          'https://s3-alpha-sig.figma.com/img/3882/55bc/dafa8fbfd8ac49059021da6fe48915a5?Expires=1678060800&Signature=MTG4ZjIx7NiP-Udx4TwMq1HcevUfxBt2Da0An-cME-p~eQFZx8zJ3QqGPJ-eGpcy1d37XS19QUR1X3H-dI8J-95eB8KkJDOO53ebB~MFOKEoYZRCxI0LSHXsRIRWFVjGj095sPhANz5Lv7MmFmkQmarMJabNN9U6vbknWvgtyriPFdPBnz4l-0mb2Lytr6GKm~N-YipHHHDF9EsHyLie51sA4hXE0-IYz2ercXG7nGsHeqKk9GTpiwMj0hbBpc35vNqnBDXf0x2zJNrdDYPBeti-lkBnqTvK3~GuPTEpNHNu27-p1-7KoRDpT4KSylHRlV8djWSIcGfCL97ZEgOSsA__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
      title: 'นาโน มอยส์เจอร์ไรเซอร์ ครีม จีพีโฟร์จี',
    ),
    BestSellGoodsModel(
      id: '10',
      image:
          'https://s3-alpha-sig.figma.com/img/3882/55bc/dafa8fbfd8ac49059021da6fe48915a5?Expires=1678060800&Signature=MTG4ZjIx7NiP-Udx4TwMq1HcevUfxBt2Da0An-cME-p~eQFZx8zJ3QqGPJ-eGpcy1d37XS19QUR1X3H-dI8J-95eB8KkJDOO53ebB~MFOKEoYZRCxI0LSHXsRIRWFVjGj095sPhANz5Lv7MmFmkQmarMJabNN9U6vbknWvgtyriPFdPBnz4l-0mb2Lytr6GKm~N-YipHHHDF9EsHyLie51sA4hXE0-IYz2ercXG7nGsHeqKk9GTpiwMj0hbBpc35vNqnBDXf0x2zJNrdDYPBeti-lkBnqTvK3~GuPTEpNHNu27-p1-7KoRDpT4KSylHRlV8djWSIcGfCL97ZEgOSsA__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
      title: 'นาโน แอคเน่ ครีม จีพีโฟร์จี',
    ),
  ];

  final List<RecommendGoodsModel> _recommendGoodsList = [
    RecommendGoodsModel(
      id: '1',
      image:
          'https://s3-alpha-sig.figma.com/img/25b4/a6a3/3534ecc797a82bba2a7bc30315dc5dca?Expires=1678060800&Signature=GYJaLsovDMtwqWFRY-nnFxGwzPkm9wIBe3Y6Wc6jS2jb4aJA-28CHjc4t2UOsWP1-w-uLb1loG9vSo8In7ETs2sHC6hpr~f6iRz~BleLVwZy-wA10ftb7McU-kE3Yq59XT9iHnpbsEvanVz3U0laf4hodDGnPiOWKKacv5lYxQsdMGSHrEmBzpabJewtvQg7tKcEEaOgPJee~Cw2gCg7VLQsLyKFkwqTqv3dMV-RFjIss59qLm-aU6V9N0pxj1Nqz~r9dYV7MCqlyMuHot5VQPAsUpdb5x7PaiLtKUNuGpfNAh3v~NWknssmyXJGPvca2oZ4Xxq~d3hlYxHTsXFzbQ__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
      title: 'นาโน ไวท์เทนนิ่ง โซฟ จีพีโฟร์จี',
    ),
    RecommendGoodsModel(
      id: '2',
      image:
          'https://s3-alpha-sig.figma.com/img/25b4/a6a3/3534ecc797a82bba2a7bc30315dc5dca?Expires=1678060800&Signature=GYJaLsovDMtwqWFRY-nnFxGwzPkm9wIBe3Y6Wc6jS2jb4aJA-28CHjc4t2UOsWP1-w-uLb1loG9vSo8In7ETs2sHC6hpr~f6iRz~BleLVwZy-wA10ftb7McU-kE3Yq59XT9iHnpbsEvanVz3U0laf4hodDGnPiOWKKacv5lYxQsdMGSHrEmBzpabJewtvQg7tKcEEaOgPJee~Cw2gCg7VLQsLyKFkwqTqv3dMV-RFjIss59qLm-aU6V9N0pxj1Nqz~r9dYV7MCqlyMuHot5VQPAsUpdb5x7PaiLtKUNuGpfNAh3v~NWknssmyXJGPvca2oZ4Xxq~d3hlYxHTsXFzbQ__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
      title: 'คอมแพค พาวเดอร์',
    ),
    RecommendGoodsModel(
      id: '3',
      image:
          'https://s3-alpha-sig.figma.com/img/25b4/a6a3/3534ecc797a82bba2a7bc30315dc5dca?Expires=1678060800&Signature=GYJaLsovDMtwqWFRY-nnFxGwzPkm9wIBe3Y6Wc6jS2jb4aJA-28CHjc4t2UOsWP1-w-uLb1loG9vSo8In7ETs2sHC6hpr~f6iRz~BleLVwZy-wA10ftb7McU-kE3Yq59XT9iHnpbsEvanVz3U0laf4hodDGnPiOWKKacv5lYxQsdMGSHrEmBzpabJewtvQg7tKcEEaOgPJee~Cw2gCg7VLQsLyKFkwqTqv3dMV-RFjIss59qLm-aU6V9N0pxj1Nqz~r9dYV7MCqlyMuHot5VQPAsUpdb5x7PaiLtKUNuGpfNAh3v~NWknssmyXJGPvca2oZ4Xxq~d3hlYxHTsXFzbQ__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
      title: 'บูสเตอร์ มาส์ก',
    ),
    RecommendGoodsModel(
      id: '4',
      image:
          'https://s3-alpha-sig.figma.com/img/25b4/a6a3/3534ecc797a82bba2a7bc30315dc5dca?Expires=1678060800&Signature=GYJaLsovDMtwqWFRY-nnFxGwzPkm9wIBe3Y6Wc6jS2jb4aJA-28CHjc4t2UOsWP1-w-uLb1loG9vSo8In7ETs2sHC6hpr~f6iRz~BleLVwZy-wA10ftb7McU-kE3Yq59XT9iHnpbsEvanVz3U0laf4hodDGnPiOWKKacv5lYxQsdMGSHrEmBzpabJewtvQg7tKcEEaOgPJee~Cw2gCg7VLQsLyKFkwqTqv3dMV-RFjIss59qLm-aU6V9N0pxj1Nqz~r9dYV7MCqlyMuHot5VQPAsUpdb5x7PaiLtKUNuGpfNAh3v~NWknssmyXJGPvca2oZ4Xxq~d3hlYxHTsXFzbQ__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
      title: 'นาโน ไวท์เทนนิ่ง โซฟ จีพีโฟร์จี',
    ),
    RecommendGoodsModel(
      id: '5',
      image:
          'https://s3-alpha-sig.figma.com/img/25b4/a6a3/3534ecc797a82bba2a7bc30315dc5dca?Expires=1678060800&Signature=GYJaLsovDMtwqWFRY-nnFxGwzPkm9wIBe3Y6Wc6jS2jb4aJA-28CHjc4t2UOsWP1-w-uLb1loG9vSo8In7ETs2sHC6hpr~f6iRz~BleLVwZy-wA10ftb7McU-kE3Yq59XT9iHnpbsEvanVz3U0laf4hodDGnPiOWKKacv5lYxQsdMGSHrEmBzpabJewtvQg7tKcEEaOgPJee~Cw2gCg7VLQsLyKFkwqTqv3dMV-RFjIss59qLm-aU6V9N0pxj1Nqz~r9dYV7MCqlyMuHot5VQPAsUpdb5x7PaiLtKUNuGpfNAh3v~NWknssmyXJGPvca2oZ4Xxq~d3hlYxHTsXFzbQ__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
      title: 'คอมแพค พาวเดอร์',
    ),
    RecommendGoodsModel(
      id: '6',
      image:
          'https://s3-alpha-sig.figma.com/img/25b4/a6a3/3534ecc797a82bba2a7bc30315dc5dca?Expires=1678060800&Signature=GYJaLsovDMtwqWFRY-nnFxGwzPkm9wIBe3Y6Wc6jS2jb4aJA-28CHjc4t2UOsWP1-w-uLb1loG9vSo8In7ETs2sHC6hpr~f6iRz~BleLVwZy-wA10ftb7McU-kE3Yq59XT9iHnpbsEvanVz3U0laf4hodDGnPiOWKKacv5lYxQsdMGSHrEmBzpabJewtvQg7tKcEEaOgPJee~Cw2gCg7VLQsLyKFkwqTqv3dMV-RFjIss59qLm-aU6V9N0pxj1Nqz~r9dYV7MCqlyMuHot5VQPAsUpdb5x7PaiLtKUNuGpfNAh3v~NWknssmyXJGPvca2oZ4Xxq~d3hlYxHTsXFzbQ__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
      title: 'บูสเตอร์ มาส์ก',
    ),
    RecommendGoodsModel(
      id: '7',
      image:
          'https://s3-alpha-sig.figma.com/img/25b4/a6a3/3534ecc797a82bba2a7bc30315dc5dca?Expires=1678060800&Signature=GYJaLsovDMtwqWFRY-nnFxGwzPkm9wIBe3Y6Wc6jS2jb4aJA-28CHjc4t2UOsWP1-w-uLb1loG9vSo8In7ETs2sHC6hpr~f6iRz~BleLVwZy-wA10ftb7McU-kE3Yq59XT9iHnpbsEvanVz3U0laf4hodDGnPiOWKKacv5lYxQsdMGSHrEmBzpabJewtvQg7tKcEEaOgPJee~Cw2gCg7VLQsLyKFkwqTqv3dMV-RFjIss59qLm-aU6V9N0pxj1Nqz~r9dYV7MCqlyMuHot5VQPAsUpdb5x7PaiLtKUNuGpfNAh3v~NWknssmyXJGPvca2oZ4Xxq~d3hlYxHTsXFzbQ__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
      title: 'นาโน ไวท์เทนนิ่ง โซฟ จีพีโฟร์จี',
    ),
    RecommendGoodsModel(
      id: '8',
      image:
          'https://s3-alpha-sig.figma.com/img/25b4/a6a3/3534ecc797a82bba2a7bc30315dc5dca?Expires=1678060800&Signature=GYJaLsovDMtwqWFRY-nnFxGwzPkm9wIBe3Y6Wc6jS2jb4aJA-28CHjc4t2UOsWP1-w-uLb1loG9vSo8In7ETs2sHC6hpr~f6iRz~BleLVwZy-wA10ftb7McU-kE3Yq59XT9iHnpbsEvanVz3U0laf4hodDGnPiOWKKacv5lYxQsdMGSHrEmBzpabJewtvQg7tKcEEaOgPJee~Cw2gCg7VLQsLyKFkwqTqv3dMV-RFjIss59qLm-aU6V9N0pxj1Nqz~r9dYV7MCqlyMuHot5VQPAsUpdb5x7PaiLtKUNuGpfNAh3v~NWknssmyXJGPvca2oZ4Xxq~d3hlYxHTsXFzbQ__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
      title: 'คอมแพค พาวเดอร์',
    ),
    RecommendGoodsModel(
      id: '9',
      image:
          'https://s3-alpha-sig.figma.com/img/25b4/a6a3/3534ecc797a82bba2a7bc30315dc5dca?Expires=1678060800&Signature=GYJaLsovDMtwqWFRY-nnFxGwzPkm9wIBe3Y6Wc6jS2jb4aJA-28CHjc4t2UOsWP1-w-uLb1loG9vSo8In7ETs2sHC6hpr~f6iRz~BleLVwZy-wA10ftb7McU-kE3Yq59XT9iHnpbsEvanVz3U0laf4hodDGnPiOWKKacv5lYxQsdMGSHrEmBzpabJewtvQg7tKcEEaOgPJee~Cw2gCg7VLQsLyKFkwqTqv3dMV-RFjIss59qLm-aU6V9N0pxj1Nqz~r9dYV7MCqlyMuHot5VQPAsUpdb5x7PaiLtKUNuGpfNAh3v~NWknssmyXJGPvca2oZ4Xxq~d3hlYxHTsXFzbQ__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
      title: 'บูสเตอร์ มาส์ก',
    ),
    RecommendGoodsModel(
      id: '10',
      image:
          'https://s3-alpha-sig.figma.com/img/25b4/a6a3/3534ecc797a82bba2a7bc30315dc5dca?Expires=1678060800&Signature=GYJaLsovDMtwqWFRY-nnFxGwzPkm9wIBe3Y6Wc6jS2jb4aJA-28CHjc4t2UOsWP1-w-uLb1loG9vSo8In7ETs2sHC6hpr~f6iRz~BleLVwZy-wA10ftb7McU-kE3Yq59XT9iHnpbsEvanVz3U0laf4hodDGnPiOWKKacv5lYxQsdMGSHrEmBzpabJewtvQg7tKcEEaOgPJee~Cw2gCg7VLQsLyKFkwqTqv3dMV-RFjIss59qLm-aU6V9N0pxj1Nqz~r9dYV7MCqlyMuHot5VQPAsUpdb5x7PaiLtKUNuGpfNAh3v~NWknssmyXJGPvca2oZ4Xxq~d3hlYxHTsXFzbQ__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
      title: 'นาโน ไวท์เทนนิ่ง โซฟ จีพีโฟร์จี',
    ),
    RecommendGoodsModel(
      id: '11',
      image:
          'https://s3-alpha-sig.figma.com/img/25b4/a6a3/3534ecc797a82bba2a7bc30315dc5dca?Expires=1678060800&Signature=GYJaLsovDMtwqWFRY-nnFxGwzPkm9wIBe3Y6Wc6jS2jb4aJA-28CHjc4t2UOsWP1-w-uLb1loG9vSo8In7ETs2sHC6hpr~f6iRz~BleLVwZy-wA10ftb7McU-kE3Yq59XT9iHnpbsEvanVz3U0laf4hodDGnPiOWKKacv5lYxQsdMGSHrEmBzpabJewtvQg7tKcEEaOgPJee~Cw2gCg7VLQsLyKFkwqTqv3dMV-RFjIss59qLm-aU6V9N0pxj1Nqz~r9dYV7MCqlyMuHot5VQPAsUpdb5x7PaiLtKUNuGpfNAh3v~NWknssmyXJGPvca2oZ4Xxq~d3hlYxHTsXFzbQ__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
      title: 'คอมแพค พาวเดอร์',
    ),
    RecommendGoodsModel(
      id: '12',
      image:
          'https://s3-alpha-sig.figma.com/img/25b4/a6a3/3534ecc797a82bba2a7bc30315dc5dca?Expires=1678060800&Signature=GYJaLsovDMtwqWFRY-nnFxGwzPkm9wIBe3Y6Wc6jS2jb4aJA-28CHjc4t2UOsWP1-w-uLb1loG9vSo8In7ETs2sHC6hpr~f6iRz~BleLVwZy-wA10ftb7McU-kE3Yq59XT9iHnpbsEvanVz3U0laf4hodDGnPiOWKKacv5lYxQsdMGSHrEmBzpabJewtvQg7tKcEEaOgPJee~Cw2gCg7VLQsLyKFkwqTqv3dMV-RFjIss59qLm-aU6V9N0pxj1Nqz~r9dYV7MCqlyMuHot5VQPAsUpdb5x7PaiLtKUNuGpfNAh3v~NWknssmyXJGPvca2oZ4Xxq~d3hlYxHTsXFzbQ__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
      title: 'บูสเตอร์ มาส์ก',
    ),
    RecommendGoodsModel(
      id: '13',
      image:
          'https://s3-alpha-sig.figma.com/img/25b4/a6a3/3534ecc797a82bba2a7bc30315dc5dca?Expires=1678060800&Signature=GYJaLsovDMtwqWFRY-nnFxGwzPkm9wIBe3Y6Wc6jS2jb4aJA-28CHjc4t2UOsWP1-w-uLb1loG9vSo8In7ETs2sHC6hpr~f6iRz~BleLVwZy-wA10ftb7McU-kE3Yq59XT9iHnpbsEvanVz3U0laf4hodDGnPiOWKKacv5lYxQsdMGSHrEmBzpabJewtvQg7tKcEEaOgPJee~Cw2gCg7VLQsLyKFkwqTqv3dMV-RFjIss59qLm-aU6V9N0pxj1Nqz~r9dYV7MCqlyMuHot5VQPAsUpdb5x7PaiLtKUNuGpfNAh3v~NWknssmyXJGPvca2oZ4Xxq~d3hlYxHTsXFzbQ__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
      title: 'นาโน ไวท์เทนนิ่ง โซฟ จีพีโฟร์จี',
    ),
    RecommendGoodsModel(
      id: '14',
      image:
          'https://s3-alpha-sig.figma.com/img/25b4/a6a3/3534ecc797a82bba2a7bc30315dc5dca?Expires=1678060800&Signature=GYJaLsovDMtwqWFRY-nnFxGwzPkm9wIBe3Y6Wc6jS2jb4aJA-28CHjc4t2UOsWP1-w-uLb1loG9vSo8In7ETs2sHC6hpr~f6iRz~BleLVwZy-wA10ftb7McU-kE3Yq59XT9iHnpbsEvanVz3U0laf4hodDGnPiOWKKacv5lYxQsdMGSHrEmBzpabJewtvQg7tKcEEaOgPJee~Cw2gCg7VLQsLyKFkwqTqv3dMV-RFjIss59qLm-aU6V9N0pxj1Nqz~r9dYV7MCqlyMuHot5VQPAsUpdb5x7PaiLtKUNuGpfNAh3v~NWknssmyXJGPvca2oZ4Xxq~d3hlYxHTsXFzbQ__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
      title: 'คอมแพค พาวเดอร์',
    ),
    RecommendGoodsModel(
      id: '15',
      image:
          'https://s3-alpha-sig.figma.com/img/25b4/a6a3/3534ecc797a82bba2a7bc30315dc5dca?Expires=1678060800&Signature=GYJaLsovDMtwqWFRY-nnFxGwzPkm9wIBe3Y6Wc6jS2jb4aJA-28CHjc4t2UOsWP1-w-uLb1loG9vSo8In7ETs2sHC6hpr~f6iRz~BleLVwZy-wA10ftb7McU-kE3Yq59XT9iHnpbsEvanVz3U0laf4hodDGnPiOWKKacv5lYxQsdMGSHrEmBzpabJewtvQg7tKcEEaOgPJee~Cw2gCg7VLQsLyKFkwqTqv3dMV-RFjIss59qLm-aU6V9N0pxj1Nqz~r9dYV7MCqlyMuHot5VQPAsUpdb5x7PaiLtKUNuGpfNAh3v~NWknssmyXJGPvca2oZ4Xxq~d3hlYxHTsXFzbQ__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
      title: 'บูสเตอร์ มาส์ก',
    ),
    RecommendGoodsModel(
      id: '16',
      image:
          'https://s3-alpha-sig.figma.com/img/25b4/a6a3/3534ecc797a82bba2a7bc30315dc5dca?Expires=1678060800&Signature=GYJaLsovDMtwqWFRY-nnFxGwzPkm9wIBe3Y6Wc6jS2jb4aJA-28CHjc4t2UOsWP1-w-uLb1loG9vSo8In7ETs2sHC6hpr~f6iRz~BleLVwZy-wA10ftb7McU-kE3Yq59XT9iHnpbsEvanVz3U0laf4hodDGnPiOWKKacv5lYxQsdMGSHrEmBzpabJewtvQg7tKcEEaOgPJee~Cw2gCg7VLQsLyKFkwqTqv3dMV-RFjIss59qLm-aU6V9N0pxj1Nqz~r9dYV7MCqlyMuHot5VQPAsUpdb5x7PaiLtKUNuGpfNAh3v~NWknssmyXJGPvca2oZ4Xxq~d3hlYxHTsXFzbQ__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
      title: 'นาโน ไวท์เทนนิ่ง โซฟ จีพีโฟร์จี',
    ),
    RecommendGoodsModel(
      id: '17',
      image:
          'https://s3-alpha-sig.figma.com/img/25b4/a6a3/3534ecc797a82bba2a7bc30315dc5dca?Expires=1678060800&Signature=GYJaLsovDMtwqWFRY-nnFxGwzPkm9wIBe3Y6Wc6jS2jb4aJA-28CHjc4t2UOsWP1-w-uLb1loG9vSo8In7ETs2sHC6hpr~f6iRz~BleLVwZy-wA10ftb7McU-kE3Yq59XT9iHnpbsEvanVz3U0laf4hodDGnPiOWKKacv5lYxQsdMGSHrEmBzpabJewtvQg7tKcEEaOgPJee~Cw2gCg7VLQsLyKFkwqTqv3dMV-RFjIss59qLm-aU6V9N0pxj1Nqz~r9dYV7MCqlyMuHot5VQPAsUpdb5x7PaiLtKUNuGpfNAh3v~NWknssmyXJGPvca2oZ4Xxq~d3hlYxHTsXFzbQ__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
      title: 'คอมแพค พาวเดอร์',
    ),
    RecommendGoodsModel(
      id: '18',
      image:
          'https://s3-alpha-sig.figma.com/img/25b4/a6a3/3534ecc797a82bba2a7bc30315dc5dca?Expires=1678060800&Signature=GYJaLsovDMtwqWFRY-nnFxGwzPkm9wIBe3Y6Wc6jS2jb4aJA-28CHjc4t2UOsWP1-w-uLb1loG9vSo8In7ETs2sHC6hpr~f6iRz~BleLVwZy-wA10ftb7McU-kE3Yq59XT9iHnpbsEvanVz3U0laf4hodDGnPiOWKKacv5lYxQsdMGSHrEmBzpabJewtvQg7tKcEEaOgPJee~Cw2gCg7VLQsLyKFkwqTqv3dMV-RFjIss59qLm-aU6V9N0pxj1Nqz~r9dYV7MCqlyMuHot5VQPAsUpdb5x7PaiLtKUNuGpfNAh3v~NWknssmyXJGPvca2oZ4Xxq~d3hlYxHTsXFzbQ__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
      title: 'บูสเตอร์ มาส์ก',
    ),
    RecommendGoodsModel(
      id: '19',
      image:
          'https://s3-alpha-sig.figma.com/img/25b4/a6a3/3534ecc797a82bba2a7bc30315dc5dca?Expires=1678060800&Signature=GYJaLsovDMtwqWFRY-nnFxGwzPkm9wIBe3Y6Wc6jS2jb4aJA-28CHjc4t2UOsWP1-w-uLb1loG9vSo8In7ETs2sHC6hpr~f6iRz~BleLVwZy-wA10ftb7McU-kE3Yq59XT9iHnpbsEvanVz3U0laf4hodDGnPiOWKKacv5lYxQsdMGSHrEmBzpabJewtvQg7tKcEEaOgPJee~Cw2gCg7VLQsLyKFkwqTqv3dMV-RFjIss59qLm-aU6V9N0pxj1Nqz~r9dYV7MCqlyMuHot5VQPAsUpdb5x7PaiLtKUNuGpfNAh3v~NWknssmyXJGPvca2oZ4Xxq~d3hlYxHTsXFzbQ__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
      title: 'นาโน ไวท์เทนนิ่ง โซฟ จีพีโฟร์จี',
    ),
    RecommendGoodsModel(
      id: '20',
      image:
          'https://s3-alpha-sig.figma.com/img/25b4/a6a3/3534ecc797a82bba2a7bc30315dc5dca?Expires=1678060800&Signature=GYJaLsovDMtwqWFRY-nnFxGwzPkm9wIBe3Y6Wc6jS2jb4aJA-28CHjc4t2UOsWP1-w-uLb1loG9vSo8In7ETs2sHC6hpr~f6iRz~BleLVwZy-wA10ftb7McU-kE3Yq59XT9iHnpbsEvanVz3U0laf4hodDGnPiOWKKacv5lYxQsdMGSHrEmBzpabJewtvQg7tKcEEaOgPJee~Cw2gCg7VLQsLyKFkwqTqv3dMV-RFjIss59qLm-aU6V9N0pxj1Nqz~r9dYV7MCqlyMuHot5VQPAsUpdb5x7PaiLtKUNuGpfNAh3v~NWknssmyXJGPvca2oZ4Xxq~d3hlYxHTsXFzbQ__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
      title: 'คอมแพค พาวเดอร์',
    ),
  ];

  // Getter

  List<PromotionModel> get promotionList => _promotionList;
  List<BestSellGoodsModel> get bestSellGoodsList => _bestSellGoodsList;
  List<RecommendGoodsModel> get recommendGoodsList => _recommendGoodsList;

  void pressProduct() {
    Get.toNamed(AppRoutes.PRODUCTDETAIL);
  }

  void pressPromotion() {
    Get.toNamed(AppRoutes.PROMOTIONDETAIL);
  }
}
