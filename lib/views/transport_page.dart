import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:lachule/bases/base_assets.dart';
import 'package:lachule/bases/base_colors.dart';
import 'package:lachule/bases/base_sizes.dart';
import 'package:lachule/controllers/transport_controller.dart';
import 'package:lachule/routes/app_pages.dart';
import 'package:lachule/widgets/app_main_body.dart';
import 'package:lachule/widgets/dismissible_keyboard.dart';

class TranSportPage extends GetView<TransportController> {
  const TranSportPage({super.key});

  @override
  Widget build(BuildContext context) {
    controller.setBuildContext(context);
    return Obx(
      () => AppMainBody(
        title: 'การจัดส่ง',
        isGoBack: false,
        child: Column(
          children: [
            Row(
              children: [
                _textButton(
                  0,
                  'รอดำเนินการ',
                ),
                _textButton(
                  1,
                  'จัดส่งพัศดุแล้ว',
                ),
              ],
            ),
            if (controller.transportIndex == 0) ...[
              _pending(),
            ],
            if (controller.transportIndex == 1) ...[
              _delivered(),
            ],
          ],
        ),
      ),
    );
  }

  Widget _textButton(int index, String title) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: BaseColors.white,
        elevation: 0,
        padding: EdgeInsets.zero,
      ),
      onPressed: () => controller.pressedTransport(index),
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 3,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: controller.transportIndex == index
              ? BaseColors.primaryRed
              : BaseColors.white,
        ),
        child: Text(
          title,
          style: TextStyle(
            fontSize: BaseSizes.fontBody1,
            color: controller.transportIndex == index
                ? BaseColors.white
                : BaseColors.btnDisabledPlaceholder,
          ),
          maxLines: 1,
        ),
      ),
    );
  }

  Widget _pending() {
    return Column(
      children: controller.pendingList
          .map(
            (pending) => _cardContent(
              pending.orderNumber,
              pending.orderDate,
              pending.status,
              image: Image.asset(
                IconAssets.pending,
                width: 50,
                fit: BoxFit.fitWidth,
              ),
              onTap: () => {
                Get.toNamed(
                  AppRoutes.TRANSPORTDETAIL,
                ),
              },
            ),
          )
          .toList(),
    );
  }

  Widget _delivered() {
    return Column(
      children: controller.deliveredList
          .map(
            (delicered) => _cardContent(
              delicered.orderNumber,
              delicered.orderDate,
              delicered.status,
              orderStatusColor: BaseColors.trueSuccess,
              image: Image.asset(
                IconAssets.delivered,
                width: 50,
                fit: BoxFit.fitWidth,
              ),
              onTap: () => {
                Get.toNamed(
                  AppRoutes.TRANSPORTDETAIL,
                ),
              },
            ),
          )
          .toList(),
    );
  }

  Widget _cardContent(
    String orderNumber,
    String orderDate,
    String orderStatus, {
    Function()? onTap,
    Color? orderStatusColor,
    Widget? image,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: BaseColors.borderColor,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: image,
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'หมายเลขออเดอร์',
                        style: TextStyle(
                          color: BaseColors.textPrimary,
                          fontSize: BaseSizes.fontBody1,
                        ),
                      ),
                      Text(
                        'วันที่สั่งซื้อสินค้า',
                        style: TextStyle(
                          color: BaseColors.textPrimary,
                          fontSize: BaseSizes.fontBody1,
                        ),
                      ),
                      Text(
                        'สถานะ',
                        style: TextStyle(
                          color: BaseColors.textPrimary,
                          fontSize: BaseSizes.fontBody1,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        '#$orderNumber',
                        style: const TextStyle(
                          color: BaseColors.textPrimary,
                          fontSize: BaseSizes.fontBody1,
                        ),
                      ),
                      Text(
                        '${DateFormat('dd/MM').format(DateTime.parse(orderDate))}/${DateTime.parse(orderDate).year + 543}',
                        style: const TextStyle(
                          color: BaseColors.textPrimary,
                          fontSize: BaseSizes.fontBody1,
                        ),
                      ),
                      Text(
                        orderStatus,
                        style: TextStyle(
                          color: orderStatusColor ?? BaseColors.primaryRed,
                          fontSize: BaseSizes.fontBody1,
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
    );
  }
}
