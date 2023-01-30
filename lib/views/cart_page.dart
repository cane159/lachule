import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:lachule/bases/base_assets.dart';
import 'package:lachule/bases/base_colors.dart';
import 'package:lachule/bases/base_sizes.dart';
import 'package:lachule/controllers/cart_controller.dart';
import 'package:lachule/widgets/button/go_back_button.dart';
import 'package:lachule/widgets/button/primary_button.dart';
import 'package:lachule/widgets/dismissible_keyboard.dart';

class CartPage extends GetView<CartController> {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    controller.setBuildContext(context);
    return Obx(
      () => SizedBox(
        width: Get.width,
        height: Get.height,
        child: DismissibleKeyboard(
          child: Scaffold(
            body: SafeArea(
              child: SingleChildScrollView(
                child: Stack(
                  children: [
                    _imageBg(),
                    Column(
                      children: [
                        _gobackButton(),
                        _bottomSheet(context),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            bottomNavigationBar: _bottomNavBar(),
          ),
        ),
      ),
    );
  }

  Widget _imageBg() {
    return Image.asset(
      ImageAssets.splashBg,
      fit: BoxFit.fitWidth,
      width: double.infinity,
    );
  }

  Widget _gobackButton() {
    return Padding(
      padding: const EdgeInsets.all(22.0),
      child: Row(
        children: const [
          GoBackbutton(),
          Text(
            'ตะกร้า',
            style: TextStyle(
              color: BaseColors.textPrimary,
              fontSize: 21,
            ),
          )
        ],
      ),
    );
  }

  Widget _bottomSheet(BuildContext context) {
    return Column(
      children: [
        Container(
          width: Get.width,
          padding: const EdgeInsets.symmetric(
            horizontal: 22,
            vertical: 14,
          ),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(20),
            ),
            color: BaseColors.white,
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    'รายกาสินค้า (${controller.cartItem.length})',
                    style: const TextStyle(
                      color: BaseColors.textPrimary,
                      fontSize: BaseSizes.fontH4,
                    ),
                  ),
                ],
              ),
              Column(
                children: controller.cartItem
                    .map(
                      (data) => Container(
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: BaseColors.borderColor,
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          children: [
                            Image.network(
                              data.image,
                              width: 100,
                              fit: BoxFit.fitWidth,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Row(
                                  children: [
                                    Image.asset(
                                      IconAssets.colorsWatch,
                                      height: 14,
                                      width: 14,
                                    ),
                                    const SizedBox(
                                      width: 7,
                                    ),
                                    const Text(
                                      'ผลิตภัณฑ์ทำความสะอาด',
                                      style: TextStyle(
                                        color: BaseColors.secondaryRed,
                                        fontSize: BaseSizes.fontBody2,
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  width: 225,
                                  child: Text(
                                    data.name,
                                    style: const TextStyle(
                                      color: BaseColors.textPrimary,
                                      fontSize: BaseSizes.fontBody1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ),
                                Text(
                                  '฿ ${controller.formatCurrency.format(data.price * data.amount.value)}',
                                  style: const TextStyle(
                                    color: BaseColors.textPrimary,
                                    fontSize: BaseSizes.fontBody1,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: Row(
                                    children: <Widget>[
                                      IconButton(
                                        onPressed: () =>
                                            {}, // TODO : wait for connect API
                                        icon: Image.asset(
                                          IconAssets.minus,
                                          width: 28,
                                          fit: BoxFit.fitWidth,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 48,
                                        width: 44,
                                        child:
                                            _goodsAmountTextField(context, 0),
                                      ),
                                      IconButton(
                                        onPressed: () =>
                                            {}, // TODO : wait for connect API
                                        icon: Image.asset(
                                          IconAssets.plus,
                                          width: 28,
                                          fit: BoxFit.fitWidth,
                                        ),
                                      ),
                                      IconButton(
                                        onPressed: () =>
                                            {}, // TODO : wait for connect API
                                        icon: Image.asset(
                                          IconAssets.trashCan,
                                          width: 28,
                                          fit: BoxFit.fitWidth,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    )
                    .toList(),
              ),
              Row(
                children: const [
                  Text(
                    'ที่อยู่การจัดส่งสินค้า',
                    style: TextStyle(
                      color: BaseColors.textPrimary,
                      fontSize: BaseSizes.fontH4,
                    ),
                  ),
                ],
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                padding: const EdgeInsets.all(17),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: BaseColors.borderColor,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 7,
                      child: Text(
                        controller.userAddresss,
                        maxLines: 3,
                        style: const TextStyle(
                          color: BaseColors.textContent,
                          fontSize: BaseSizes.fontBody1,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          const Text(
                            'ค่าเริ่มต้น',
                            style: TextStyle(
                              color: BaseColors.primaryRed,
                              fontSize: BaseSizes.fontBody1,
                            ),
                          ),
                          Image.asset(
                            IconAssets.locationTick,
                            width: 18,
                            height: 18,
                            fit: BoxFit.fitWidth,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 6, horizontal: 17),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.04),
                      spreadRadius: 8,
                      blurRadius: 7,
                      offset: const Offset(0, -1),
                    ),
                  ],
                ),
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'คะแนนรวม',
                          style: TextStyle(
                            color: BaseColors.textContent,
                            fontSize: BaseSizes.fontBody1,
                          ),
                        ),
                        Text(
                          '${controller.cartItem.fold(0, (sum, data) => sum + data.point)}',
                          style: const TextStyle(
                            color: BaseColors.textPrimary,
                            fontSize: BaseSizes.fontBody1,
                          ),
                        ),
                      ],
                    ),
                    const Divider(
                      thickness: 1.5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'รวมทั้งสิ้น (${controller.cartItem.length})',
                          style: const TextStyle(
                            color: BaseColors.textPrimary,
                            fontSize: BaseSizes.fontBody1,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          //'฿ ${controller.formatCurrency.format(data.price * data.amount.value)}'
                          '฿ ${controller.formatCurrency.format(controller.cartItem.fold(0.00, (double sum, data) => sum + (data.amount.value * data.price.value)))}',
                          style: const TextStyle(
                            color: BaseColors.primaryRed,
                            fontSize: BaseSizes.fontH4,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _goodsAmountTextField(BuildContext context, int index) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextFormField(
          initialValue: controller.cartItem[index].amount.toString(),
          minLines: 1,
          maxLines: 1,
          keyboardType: TextInputType.number,
          inputFormatters: <TextInputFormatter>[
            FilteringTextInputFormatter.digitsOnly,
            LengthLimitingTextInputFormatter(3),
          ],
          textAlign: TextAlign.center,
          onChanged: (value) => {
            if (value == "")
              {controller.changeCartItemAmount(index, 0)}
            else
              {controller.changeCartItemAmount(index, int.parse(value))}
          },
          style: const TextStyle(
            color: BaseColors.textPrimary,
            fontSize: BaseSizes.fontBody1,
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
