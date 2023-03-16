import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lachule/bases/base_assets.dart';
import 'package:lachule/bases/base_colors.dart';
import 'package:lachule/controllers/home_controller.dart';
import 'package:lachule/routes/app_pages.dart';
import 'package:lachule/widgets/appbar_scaffold.dart';
import 'package:lachule/widgets/dismissible_keyboard.dart';
import 'package:lachule/widgets/item_carousel.dart';

class HomePage extends GetView<HomeController> {
  HomePage({super.key});

  final CarouselController _carouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    controller.setBuildContext(context);
    return Obx(
      () => DismissibleKeyboard(
        child: Container(
          color: BaseColors.primaryRed,
          child: SafeArea(
            child: SingleChildScrollView(
              child: Stack(
                children: [
                  _imageBg(),
                  _appbarBg(),
                  Column(
                    children: <Widget>[
                      _imageCarousel(context),
                      _goodsSection(),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _appbarBg() {
    return Container(
      height: 50,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20),
          ),
          color: BaseColors.primaryRed),
    );
  }

  Widget _imageBg() {
    return Image.asset(
      ImageAssets.splashBg,
      fit: BoxFit.fitWidth,
      width: double.infinity,
    );
  }

  Widget _imageCarousel(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            margin: const EdgeInsets.fromLTRB(0, 8, 0, 8),
            width: double.infinity,
            child: CarouselSlider(
              carouselController: _carouselController,
              options: CarouselOptions(
                autoPlay: true,
                autoPlayInterval: const Duration(
                  seconds: 5,
                ),
                viewportFraction: 1,
                onPageChanged: (index, reason) => {
                  controller.currentCarousel.value = index,
                },
              ),
              items: controller.imageCarousel
                  .map(
                    (image) => ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: GestureDetector(
                        onTap: () => Get.toNamed(AppRoutes.PROMOTIONDETAIL),
                        child: Image.network(
                          image,
                          fit: BoxFit.fitWidth,
                          loadingBuilder: (context, child, loadingProgress) {
                            if (loadingProgress == null) return child;
                            return const Center(
                              child: SizedBox(
                                width: 100,
                                height: 100,
                                child: CircularProgressIndicator(),
                              ),
                            );
                          },
                          errorBuilder: (context, error, stackTrace) {
                            return const Center(
                              child: SizedBox(
                                height: 50,
                                width: 50,
                                child: CircularProgressIndicator(
                                  strokeWidth: 4,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: controller.imageCarousel
                .asMap()
                .entries
                .map(
                  (index) => GestureDetector(
                    //onTap: () => _carouselController.animateToPage(index.key),
                    child: Container(
                      width: 8.0,
                      height: 8.0,
                      margin: const EdgeInsets.symmetric(
                        horizontal: 4.0,
                      ),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: controller.currentCarousel.value == index.key
                            ? BaseColors.secondaryRed
                            : BaseColors.bgImageInputDisabled,
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }

  Widget _goodsSection() {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      padding: const EdgeInsets.fromLTRB(10, 10, 0, 10),
      width: double.infinity,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(
              20,
            ),
          ),
          color: BaseColors.white),
      child: Column(
        children: <Widget>[
          ItemCarousel(
            header: 'โปรโมชั่น',
            leadingIcon: IconAssets.promotion,
            carouselItem: controller.promotionList,
            pressItem: () => controller.pressProduct(),
          ),
          ItemCarousel(
            header: 'สินค้าขายดี',
            leadingIcon: IconAssets.bestSell,
            carouselItem: controller.bestSellGoodsList,
            onPressed: () => controller.pressProduct(),
            pressItem: () => controller.pressProduct(),
          ),
          ItemCarousel(
            header: 'สินค้าแนะนำ',
            leadingIcon: IconAssets.recommend,
            carouselItem: controller.recommendGoodsList,
            pressItem: () => controller.pressProduct(),
          ),
        ],
      ),
    );
  }
}
