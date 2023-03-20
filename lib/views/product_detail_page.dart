import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:lachule/bases/base_assets.dart';
import 'package:lachule/bases/base_colors.dart';
import 'package:lachule/bases/base_sizes.dart';
import 'package:lachule/controllers/product_detail_controller.dart';
import 'package:lachule/widgets/button/go_back_button.dart';
import 'package:lachule/widgets/button/outline_button.dart';
import 'package:lachule/widgets/button/primary_button.dart';

class ProductDetailPage extends GetView<ProductDetailController> {
  const ProductDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    controller.setBuildContext(context);
    return Scaffold(
      backgroundColor: BaseColors.btnInput,
      appBar: _appbar(),
      body: SingleChildScrollView(
        child: _bodyContent(context),
      ),
      bottomNavigationBar: _bottomNavBar(),
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
      actions: [
        IconButton(
          onPressed: () => controller.pressedCart(),
          icon: Image.asset(
            IconAssets.bagHappy,
            width: 24,
            height: 24,
            fit: BoxFit.fitWidth,
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
              child: OutlinedButtonView(
                onPressed: () => {
                  // Get.bottomSheet(
                  //   Container(
                  //     padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                  //     width: Get.width,
                  //     decoration: const BoxDecoration(
                  //       borderRadius: BorderRadius.vertical(
                  //         top: Radius.circular(20),
                  //       ),
                  //       color: BaseColors.white,
                  //     ),
                  //     child: Column(
                  //       mainAxisSize: MainAxisSize.min,
                  //       children: [
                  //         Row(
                  //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //           children: [
                  //             const Text(
                  //               'จำนวน',
                  //               style: TextStyle(
                  //                   color: BaseColors.textPrimary,
                  //                   fontSize: BaseSizes.fontH4),
                  //             ),
                  //             IconButton(
                  //               onPressed: () => Get.back(),
                  //               icon: Image.asset(
                  //                 IconAssets.close,
                  //                 width: 24,
                  //                 fit: BoxFit.fitWidth,
                  //               ),
                  //             ),
                  //           ],
                  //         ),
                  //         Padding(
                  //           padding: const EdgeInsets.only(top: 10),
                  //           child: Row(
                  //             mainAxisAlignment: MainAxisAlignment.center,
                  //             mainAxisSize: MainAxisSize.max,
                  //             children: <Widget>[
                  //               IconButton(
                  //                 onPressed: () =>
                  //                     {}, // TODO : wait for connect API
                  //                 icon: Image.asset(
                  //                   IconAssets.minus,
                  //                   width: 50,
                  //                   fit: BoxFit.fitWidth,
                  //                 ),
                  //               ),
                  //               Expanded(
                  //                 child: SizedBox(
                  //                   width: 194,
                  //                   height: 50,
                  //                   child: _goodsAmountTextField(),
                  //                 ),
                  //               ),
                  //               IconButton(
                  //                 onPressed: () =>
                  //                     {}, // TODO : wait for connect API
                  //                 icon: Image.asset(
                  //                   IconAssets.plus,
                  //                   width: 50,
                  //                   fit: BoxFit.fitWidth,
                  //                 ),
                  //               ),
                  //             ],
                  //           ),
                  //         ),
                  //       ],
                  //     ),
                  //   ),
                  // ),
                },
                title: 'ใส่ตะกร้าสินค้า',
                prefixIcon: Image.asset(
                  IconAssets.bagHappy,
                ),
                borderColor: BaseColors.btnDisabledPlaceholder,
                textStyle: const TextStyle(
                  fontSize: BaseSizes.fontH4,
                  color: BaseColors.textPrimary,
                ),
              ),
            ),
            const SizedBox(
              width: 11,
            ),
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

  Widget _goodsAmountTextField() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextField(
          //initialValue: controller.cartItem[index].amount.value.toString(),
          // controller: TextEditingController(
          //   text: controller.cartItem[index].amount.value.toString(),
          // ),
          decoration: const InputDecoration(
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: BaseColors.textPrimary),
            ),
          ),
          minLines: 1,
          maxLines: 1,
          keyboardType: TextInputType.number,
          inputFormatters: <TextInputFormatter>[
            FilteringTextInputFormatter.digitsOnly,
            LengthLimitingTextInputFormatter(3),
          ],
          textAlign: TextAlign.center,
          onChanged: (value) => {
            // if (value == "")
            //   {controller.changeCartItemAmount(index, 0)}
            // else
            //   {controller.changeCartItemAmount(index, int.parse(value))}
          },
          style: const TextStyle(
            color: BaseColors.textPrimary,
            fontSize: BaseSizes.fontBody1,
          ),
        ),
      ],
    );
  }

  Widget _bodyContent(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.symmetric(
                vertical: 20,
              ),
              width: 275,
              height: 275,
              child: Image.network(
                controller.produceDetail.image,
                height: 142,
                width: 142,
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
                      height: 142,
                      fit: BoxFit.fitHeight,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
        Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(20),
            ),
            color: BaseColors.white,
          ),
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
                          controller.produceDetail.title,
                          style: const TextStyle(
                            color: BaseColors.textPrimary,
                            fontSize: 21,
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Row(
                        children: [
                          Image.asset(
                            IconAssets.colorsWatch,
                            width: 14,
                            height: 14,
                            fit: BoxFit.fitWidth,
                          ),
                          const SizedBox(
                            width: 7,
                          ),
                          const Text(
                            'ผลิตภัณฑ์ทำความสะอาด',
                            style: TextStyle(
                              color: BaseColors.secondaryRed,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Divider(
                      thickness: 1.5,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            'ราาคา',
                            style: TextStyle(
                              color: BaseColors.tabTitle,
                              fontSize: BaseSizes.fontH4,
                            ),
                          ),
                          Text(
                            'คะแนนสะสม',
                            style: TextStyle(
                              color: BaseColors.tabTitle,
                              fontSize: BaseSizes.fontH4,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '฿ ${controller.productPrice}',
                          style: const TextStyle(
                            color: BaseColors.textPrimary,
                            fontSize: 24,
                          ),
                        ),
                        Text(
                          controller.produceDetail.point.toString(),
                          style: const TextStyle(
                            color: BaseColors.textPrimary,
                            fontSize: 24,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const Divider(
                thickness: 1.5,
              ),
              const SizedBox(
                height: 15,
              ),
              _descriptionBody(),
              // _descriptionBar(),
              // if (controller.descriptionIndex == 0) ...[
              //   _descriptionBody(),
              // ] else if (controller.descriptionIndex == 1) ...[
              //   _specificationsBody(),
              // ] else if (controller.descriptionIndex == 2) ...[
              //   _howToUseBody(),
              // ]
            ],
          ),
        ),
      ],
    );
  }

  Widget _descriptionBar() {
    return Container(
      padding: const EdgeInsets.all(24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: BaseColors.white,
              elevation: 0,
              padding: EdgeInsets.zero,
            ),
            onPressed: () => controller.pressDescription(0),
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 3,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: controller.descriptionIndex == 0
                    ? BaseColors.primaryRed
                    : BaseColors.white,
              ),
              child: Text(
                'รายละเอียด',
                style: TextStyle(
                  fontSize: BaseSizes.fontBody1,
                  color: controller.descriptionIndex == 0
                      ? BaseColors.white
                      : BaseColors.btnDisabledPlaceholder,
                ),
                maxLines: 1,
              ),
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: BaseColors.white,
              elevation: 0,
              padding: EdgeInsets.zero,
            ),
            onPressed: () => controller.pressDescription(1),
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 3,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: controller.descriptionIndex == 1
                    ? BaseColors.primaryRed
                    : BaseColors.white,
              ),
              child: Text(
                'ข้อมูลจำเพาะ',
                style: TextStyle(
                  fontSize: BaseSizes.fontBody1,
                  color: controller.descriptionIndex == 1
                      ? BaseColors.white
                      : BaseColors.btnDisabledPlaceholder,
                ),
                maxLines: 1,
              ),
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: BaseColors.white,
              elevation: 0,
              padding: EdgeInsets.zero,
            ),
            onPressed: () => controller.pressDescription(2),
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 3,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: controller.descriptionIndex == 2
                    ? BaseColors.primaryRed
                    : BaseColors.white,
              ),
              child: Text(
                'วิธีใช้งาน',
                style: TextStyle(
                  fontSize: BaseSizes.fontBody1,
                  color: controller.descriptionIndex == 2
                      ? BaseColors.white
                      : BaseColors.btnDisabledPlaceholder,
                ),
                maxLines: 1,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _descriptionBody() {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 22,
      ),
      child: Text(
        controller.produceDetail.description,
        style: const TextStyle(
          fontSize: BaseSizes.fontBody1,
          color: BaseColors.textPrimary,
        ),
        textAlign: TextAlign.left,
      ),
    );
  }

  Widget _specificationsBody() {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 22,
      ),
      child: Text(
        controller.produceDetail.specifications,
        style: const TextStyle(
          fontSize: BaseSizes.fontBody1,
          color: BaseColors.textPrimary,
        ),
        textAlign: TextAlign.left,
      ),
    );
  }

  Widget _howToUseBody() {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 22,
      ),
      child: Text(
        controller.produceDetail.howToUse,
        style: const TextStyle(
          fontSize: BaseSizes.fontBody1,
          color: BaseColors.textPrimary,
        ),
        textAlign: TextAlign.left,
      ),
    );
  }
}
