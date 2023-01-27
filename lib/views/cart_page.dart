import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lachule/bases/base_assets.dart';
import 'package:lachule/bases/base_colors.dart';
import 'package:lachule/bases/base_sizes.dart';
import 'package:lachule/controllers/cart_controller.dart';
import 'package:lachule/widgets/button/go_back_button.dart';

class CartPage extends GetView<CartController> {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    controller.setBuildContext(context);
    return Scaffold(
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
    return Container(
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
          Container(
            width: double.infinity,
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
                  'https://s3-alpha-sig.figma.com/img/3882/55bc/dafa8fbfd8ac49059021da6fe48915a5?Expires=1675641600&Signature=B1H9XxWD~9cGE7pWnU4LzTwnNodtVm4IPZfLXL~4~70LxfCScKcwjuQtbfv9hD9ZyXdy1mGdwAqVI7oajsBBYHlGfAHXg8KXX-5~VBO4XmJ8uqL0-uL1e3~zqhKLDGxsWA7lPNc~Z7V-nZO3zP6dVN31Sgij8~TfDGFwXC2TM0ifFsJUj15U13IcWCA-561zqbEC1RCYKXnfHmJf6jpyRFS5MxHYpD85D5Dv4T2U7PyYwTn8SC~DAC6BQm0Q0wSWaEDKiNXIgkUzTID9h0xfQDd7WjCSDybkvv7iU9S2oebvyN2751Hq1b1amN5rlCi05FXxY-I4GmKLKQDDbQseXw__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
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
                    Text(
                      controller.cartItem[0].name,
                      style: const TextStyle(
                        color: BaseColors.textPrimary,
                        fontSize: BaseSizes.fontBody1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Text(
                      '฿ ${controller.formatCurrency.format(controller.cartItem[0].price * controller.cartItem[0].amount)}',
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
                            onPressed: () => {},
                            icon: Image.asset(
                              IconAssets.minus,
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
        ],
      ),
    );
  }

  Widget _goodsAmountTextField(BuildContext context, int index) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextField(
          minLines: 1,
          maxLines: 1,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            label: Text(
              controller.cartItem[index].amount.toString(),
              style: const TextStyle(
                color: BaseColors.textPrimary,
                fontSize: BaseSizes.fontBody1,
              ),
            ),
          ),
          textAlign: TextAlign.center,
          onChanged: (value) => {},
          style: const TextStyle(
            color: BaseColors.textPrimary,
            fontSize: BaseSizes.fontBody1,
          ),
        ),
      ],
    );
  }
}

// Container(
//                     padding: const EdgeInsets.all(10),
//                     decoration: BoxDecoration(
//                       border: Border.all(
//                         color: BaseColors.borderColor,
//                       ),
//                       borderRadius: BorderRadius.circular(20),
//                     ),
//                     child: Row(
//                       children: <Widget>[
//                         Image.network(
//                           item.image,
//                           width: 100,
//                           height: 100,
//                           fit: BoxFit.fitWidth,
//                           loadingBuilder: (context, child, loadingProgress) {
//                             if (loadingProgress == null) return child;
//                             return const Center(
//                               child: SizedBox(
//                                 height: 30,
//                                 width: 30,
//                                 child: CircularProgressIndicator(
//                                   strokeWidth: 4,
//                                 ),
//                               ),
//                             );
//                           },
//                           errorBuilder: (context, error, stackTrace) {
//                             return const Center(
//                               child: SizedBox(
//                                 height: 30,
//                                 width: 30,
//                                 child: CircularProgressIndicator(
//                                   strokeWidth: 4,
//                                 ),
//                               ),
//                             );
//                           },
//                         ),
//                         const SizedBox(
//                           width: 10,
//                         ),
//                         Column(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: <Widget>[
//                             Row(
//                               children: <Widget>[
//                                 Image.asset(
//                                   IconAssets.colorsWatch,
//                                   width: 14,
//                                   height: 14,
//                                 ),
//                                 const SizedBox(
//                                   width: 7,
//                                 ),
//                                 const Text(
//                                   'ผลิตภัณฑ์ทำความสะอาด',
//                                   style: TextStyle(
//                                     color: BaseColors.secondaryRed,
//                                     fontSize: 12,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                             Text(
//                               item.name,
//                               style: const TextStyle(
//                                 color: BaseColors.textPrimary,
//                                 fontSize: BaseSizes.fontBody1,
//                                 overflow: TextOverflow.ellipsis,
//                               ),
//                             ),
//                             Text(
//                               '฿ ${controller.formatCurrency.format(item.price * item.amount)}',
//                               style: const TextStyle(
//                                 color: BaseColors.textPrimary,
//                                 fontSize: BaseSizes.fontBody1,
//                               ),
//                             ),
//                             Padding(
//                               padding: const EdgeInsets.only(
//                                 top: 10,
//                               ),
//                               child: Row(
//                                 children: <Widget>[
//                                   GestureDetector(),
//                                 ],
//                               ),
//                             ),
//                           ],
//                         )
//                       ],
//                     ),
//                   ),
