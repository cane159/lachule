import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:lachule/bases/base_assets.dart';
import 'package:lachule/bases/base_colors.dart';
import 'package:lachule/bases/base_sizes.dart';
import 'package:lachule/controllers/promotion_detail_controller.dart';
import 'package:lachule/widgets/button/go_back_button.dart';
import 'package:lachule/widgets/button/primary_button.dart';

class PromotionDetailPage extends GetView<PromotionDetailController> {
  const PromotionDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    controller.setBuildContext(context);
    return Scaffold(
      //appBar: _appbar(),
      body: Stack(
        children: [
          _imageBg(),
          SafeArea(
            child: SingleChildScrollView(
              child: _bodyContent(context),
            ),
          ),
        ],
      ),
      bottomNavigationBar: _bottomNavBar(),
    );
  }

  Widget _imageBg() {
    return Image.asset(
      ImageAssets.splashBg,
      fit: BoxFit.fitWidth,
      width: double.infinity,
    );
  }

  AppBar _appbar() {
    return AppBar(
      leading: const GoBackbutton(),
      leadingWidth: 36,
      elevation: 0,
      backgroundColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
      automaticallyImplyLeading: false,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: const [
          Text(
            'รายละเอียด',
            style: TextStyle(
              color: BaseColors.textPrimary,
              fontSize: 21,
            ),
          ),
        ],
      ),
    );
  }

  Widget _gobackButton() {
    return Padding(
      padding: const EdgeInsets.all(22.0),
      child: Row(
        children: const [
          GoBackbutton(),
          Text(
            'รายละเอียด',
            style: TextStyle(
              color: BaseColors.textPrimary,
              fontSize: 21,
            ),
          )
        ],
      ),
    );
  }

  Widget _bodyContent(BuildContext context) {
    return Column(
      children: <Widget>[
        _gobackButton(),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              controller.promotionDetail.image,
              width: Get.width,
              fit: BoxFit.fitWidth,
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) return child;
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
              errorBuilder: (context, error, stackTrace) {
                return Center(
                  child: Image.asset(
                    ImageAssets.defaultImage,
                    fit: BoxFit.fitHeight,
                  ),
                );
              },
            ),
          ],
        ),
        Container(
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(20),
              ),
              color: BaseColors.white),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 15,
                  horizontal: 22,
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          controller.promotionDetail.title,
                          style: const TextStyle(
                            color: BaseColors.textPrimary,
                            fontSize: 21,
                          ),
                        ),
                      ],
                    ),
                    // Row(
                    //   children: [
                    //     Image.asset(
                    //       IconAssets.clock,
                    //       width: 14,
                    //       height: 14,
                    //       fit: BoxFit.fitWidth,
                    //     ),
                    //     const SizedBox(
                    //       width: 7,
                    //     ),
                    //     Text(
                    //       DateFormat('dd/MM/yyy').format(
                    //         DateTime.parse(controller.promotionDetail.endDate),
                    //       ),
                    //       style: const TextStyle(
                    //         color: BaseColors.tabTitle,
                    //         fontSize: 12,
                    //       ),
                    //     ),
                    //     const SizedBox(
                    //       width: 20,
                    //     ),
                    //     Image.asset(
                    //       IconAssets.colorsWatch,
                    //       width: 14,
                    //       height: 14,
                    //       fit: BoxFit.fitWidth,
                    //     ),
                    //     const SizedBox(
                    //       width: 7,
                    //     ),
                    //     const Text(
                    //       'โปรโมชั่น',
                    //       style: TextStyle(
                    //         color: BaseColors.secondaryRed,
                    //         fontSize: 12,
                    //       ),
                    //     ),
                    //   ],
                    // ),
                    const Divider(
                      thickness: 1.5,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 22,
          ),
          child: Text(
            controller.promotionDetail.description,
            style: const TextStyle(
              fontSize: BaseSizes.fontBody1,
              color: BaseColors.textPrimary,
            ),
            textAlign: TextAlign.justify,
          ),
        ),
      ],
    );
  }

  Widget _bottomNavBar() {
    return ClipRRect(
      borderRadius: const BorderRadius.vertical(
        top: Radius.circular(20),
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 22,
          vertical: 14,
        ),
        decoration: BoxDecoration(
          color: BaseColors.white,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.04),
              spreadRadius: 8,
              blurRadius: 7,
              offset: const Offset(0, -1),
            ),
          ],
        ),
        child: Row(
          children: [
            Expanded(
              child: PrimaryButtonView(
                onPressed: () => {},
                title: 'ซื้อสินค้า',
                prefixIcon: Image.asset(
                  IconAssets.moneySend,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
