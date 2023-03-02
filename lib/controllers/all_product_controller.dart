import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lachule/bases/base_controller.dart';
import 'package:lachule/models/product_detail_model.dart';

class AllProductController extends BaseController {
  final List<ProductDetailModel> _allProduct = [
    ProductDetailModel(
      id: '1',
      title: 'นาโน แอคเน่ ครีม จีพีโฟร์จี',
      image:
          'https://s3-alpha-sig.figma.com/img/3882/55bc/dafa8fbfd8ac49059021da6fe48915a5?Expires=1678665600&Signature=bOnfp6HGvXnuBviXlpLiMyDtJaWIgFKAvZjNHinxYt-HIQhU8Vol5xVoCUOELWaODBWLJ82tCl4HYmTf8TNjuaGi0WiHX7Sg2-9tBqHIRC-9YYergpbv0h0c9df2g~4DMxaNZ682MdPjNDXlPP1b1vPIaVU-GW031SVxBy14wd3hxB5d4cr5QwIUO5RolqXhhY-1vxoX95xXCVgWAcUzuzvytodnP0gRc4usjl3qH6FALY~8iEFRq1BCGJ9nlg7sE1kHaYzUl3UCY-XXDW70sq10c287ixse~TLiXC47BdkhoaRtGy9DkYIA3xCaJKAd1SUuqAwX7t6b283RawKAaw__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
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
          'https://s3-alpha-sig.figma.com/img/3882/55bc/dafa8fbfd8ac49059021da6fe48915a5?Expires=1678665600&Signature=bOnfp6HGvXnuBviXlpLiMyDtJaWIgFKAvZjNHinxYt-HIQhU8Vol5xVoCUOELWaODBWLJ82tCl4HYmTf8TNjuaGi0WiHX7Sg2-9tBqHIRC-9YYergpbv0h0c9df2g~4DMxaNZ682MdPjNDXlPP1b1vPIaVU-GW031SVxBy14wd3hxB5d4cr5QwIUO5RolqXhhY-1vxoX95xXCVgWAcUzuzvytodnP0gRc4usjl3qH6FALY~8iEFRq1BCGJ9nlg7sE1kHaYzUl3UCY-XXDW70sq10c287ixse~TLiXC47BdkhoaRtGy9DkYIA3xCaJKAd1SUuqAwX7t6b283RawKAaw__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
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
          'https://s3-alpha-sig.figma.com/img/3882/55bc/dafa8fbfd8ac49059021da6fe48915a5?Expires=1678665600&Signature=bOnfp6HGvXnuBviXlpLiMyDtJaWIgFKAvZjNHinxYt-HIQhU8Vol5xVoCUOELWaODBWLJ82tCl4HYmTf8TNjuaGi0WiHX7Sg2-9tBqHIRC-9YYergpbv0h0c9df2g~4DMxaNZ682MdPjNDXlPP1b1vPIaVU-GW031SVxBy14wd3hxB5d4cr5QwIUO5RolqXhhY-1vxoX95xXCVgWAcUzuzvytodnP0gRc4usjl3qH6FALY~8iEFRq1BCGJ9nlg7sE1kHaYzUl3UCY-XXDW70sq10c287ixse~TLiXC47BdkhoaRtGy9DkYIA3xCaJKAd1SUuqAwX7t6b283RawKAaw__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
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
          'https://s3-alpha-sig.figma.com/img/3882/55bc/dafa8fbfd8ac49059021da6fe48915a5?Expires=1678665600&Signature=bOnfp6HGvXnuBviXlpLiMyDtJaWIgFKAvZjNHinxYt-HIQhU8Vol5xVoCUOELWaODBWLJ82tCl4HYmTf8TNjuaGi0WiHX7Sg2-9tBqHIRC-9YYergpbv0h0c9df2g~4DMxaNZ682MdPjNDXlPP1b1vPIaVU-GW031SVxBy14wd3hxB5d4cr5QwIUO5RolqXhhY-1vxoX95xXCVgWAcUzuzvytodnP0gRc4usjl3qH6FALY~8iEFRq1BCGJ9nlg7sE1kHaYzUl3UCY-XXDW70sq10c287ixse~TLiXC47BdkhoaRtGy9DkYIA3xCaJKAd1SUuqAwX7t6b283RawKAaw__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
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
          'https://s3-alpha-sig.figma.com/img/3882/55bc/dafa8fbfd8ac49059021da6fe48915a5?Expires=1678665600&Signature=bOnfp6HGvXnuBviXlpLiMyDtJaWIgFKAvZjNHinxYt-HIQhU8Vol5xVoCUOELWaODBWLJ82tCl4HYmTf8TNjuaGi0WiHX7Sg2-9tBqHIRC-9YYergpbv0h0c9df2g~4DMxaNZ682MdPjNDXlPP1b1vPIaVU-GW031SVxBy14wd3hxB5d4cr5QwIUO5RolqXhhY-1vxoX95xXCVgWAcUzuzvytodnP0gRc4usjl3qH6FALY~8iEFRq1BCGJ9nlg7sE1kHaYzUl3UCY-XXDW70sq10c287ixse~TLiXC47BdkhoaRtGy9DkYIA3xCaJKAd1SUuqAwX7t6b283RawKAaw__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
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
          'https://s3-alpha-sig.figma.com/img/3882/55bc/dafa8fbfd8ac49059021da6fe48915a5?Expires=1678665600&Signature=bOnfp6HGvXnuBviXlpLiMyDtJaWIgFKAvZjNHinxYt-HIQhU8Vol5xVoCUOELWaODBWLJ82tCl4HYmTf8TNjuaGi0WiHX7Sg2-9tBqHIRC-9YYergpbv0h0c9df2g~4DMxaNZ682MdPjNDXlPP1b1vPIaVU-GW031SVxBy14wd3hxB5d4cr5QwIUO5RolqXhhY-1vxoX95xXCVgWAcUzuzvytodnP0gRc4usjl3qH6FALY~8iEFRq1BCGJ9nlg7sE1kHaYzUl3UCY-XXDW70sq10c287ixse~TLiXC47BdkhoaRtGy9DkYIA3xCaJKAd1SUuqAwX7t6b283RawKAaw__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
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
          'https://s3-alpha-sig.figma.com/img/3882/55bc/dafa8fbfd8ac49059021da6fe48915a5?Expires=1678665600&Signature=bOnfp6HGvXnuBviXlpLiMyDtJaWIgFKAvZjNHinxYt-HIQhU8Vol5xVoCUOELWaODBWLJ82tCl4HYmTf8TNjuaGi0WiHX7Sg2-9tBqHIRC-9YYergpbv0h0c9df2g~4DMxaNZ682MdPjNDXlPP1b1vPIaVU-GW031SVxBy14wd3hxB5d4cr5QwIUO5RolqXhhY-1vxoX95xXCVgWAcUzuzvytodnP0gRc4usjl3qH6FALY~8iEFRq1BCGJ9nlg7sE1kHaYzUl3UCY-XXDW70sq10c287ixse~TLiXC47BdkhoaRtGy9DkYIA3xCaJKAd1SUuqAwX7t6b283RawKAaw__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
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
          'https://s3-alpha-sig.figma.com/img/3882/55bc/dafa8fbfd8ac49059021da6fe48915a5?Expires=1678665600&Signature=bOnfp6HGvXnuBviXlpLiMyDtJaWIgFKAvZjNHinxYt-HIQhU8Vol5xVoCUOELWaODBWLJ82tCl4HYmTf8TNjuaGi0WiHX7Sg2-9tBqHIRC-9YYergpbv0h0c9df2g~4DMxaNZ682MdPjNDXlPP1b1vPIaVU-GW031SVxBy14wd3hxB5d4cr5QwIUO5RolqXhhY-1vxoX95xXCVgWAcUzuzvytodnP0gRc4usjl3qH6FALY~8iEFRq1BCGJ9nlg7sE1kHaYzUl3UCY-XXDW70sq10c287ixse~TLiXC47BdkhoaRtGy9DkYIA3xCaJKAd1SUuqAwX7t6b283RawKAaw__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
      description: '',
      specifications: '',
      howToUse: '',
      tag: 'ผลิตภัณฑ์ทำความสะอาด',
      price: 1399,
      point: 50,
    ),
  ];

  // Getter

  List<ProductDetailModel> get allProduct => _allProduct;
}
