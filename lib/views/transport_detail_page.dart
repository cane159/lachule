import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:lachule/bases/base_assets.dart';
import 'package:lachule/bases/base_colors.dart';
import 'package:lachule/bases/base_sizes.dart';
import 'package:lachule/controllers/transport_detail_controller.dart';
import 'package:lachule/routes/app_pages.dart';
import 'package:lachule/widgets/app_main_body.dart';

class TransportDetailPage extends GetView<TransportDetailController> {
  const TransportDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    controller.setBuildContext(context);
    return AppMainBody(
      title: 'รายละเอียดการจัดส่ง',
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(17),
            decoration: BoxDecoration(
              border: Border.all(color: BaseColors.borderColor),
              borderRadius: const BorderRadius.all(
                Radius.circular(20),
              ),
            ),
            child: Column(
              children: [
                _detailCard(
                  'หมายเลขออเดอร์',
                  '#${controller.transportDetail.orderNumber}',
                ),
                _detailCard(
                  'วันที่สั่งซื้อ',
                  '${DateFormat('dd/MM').format(DateTime.parse(controller.transportDetail.orderDate))}/${DateTime.parse(controller.transportDetail.orderDate).year + 543}',
                ),
                _detailCard(
                  'ยอดชำระ',
                  '฿ ${controller.priceIntl(controller.transportDetail.price)}',
                ),
                _detailCard(
                  'ได้คะแนนสะสม',
                  controller.transportDetail.point.toString(),
                ),
                _detailCard(
                  'ที่อยู่ที่จัดส่ง',
                  controller.transportDetail.address,
                ),
                if (controller.transportDetail.parcelNumber != null) ...[
                  _parcelNumberCard(
                    'เลขพัสดุ',
                    controller.transportDetail.parcelNumber ?? '',
                    onPressed: () => {
                      Get.toNamed(AppRoutes.WEBVIEW),
                    },
                  ),
                ],
                _detailCard(
                  'สถานะ',
                  controller.transportDetail.status,
                  isBottom: true,
                  prefixIcon: controller.transportDetail.parcelNumber == null
                      ? Image.asset(
                          IconAssets.clockRed,
                          width: 18,
                          fit: BoxFit.fitWidth,
                        )
                      : Image.asset(
                          IconAssets.tickCircle,
                          width: 18,
                          fit: BoxFit.fitWidth,
                        ),
                  textStyle: TextStyle(
                    color: controller.transportDetail.parcelNumber == null
                        ? BaseColors.primaryRed
                        : BaseColors.trueSuccess,
                    fontSize: BaseSizes.fontBody1,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 20),
            alignment: Alignment.centerLeft,
            child: Text(
              'รายการสินค้า (${controller.transportDetail.product.length})',
              style: const TextStyle(
                color: BaseColors.textPrimary,
                fontSize: BaseSizes.fontH4,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Column(
            children: controller.transportDetail.product
                .map(
                  (product) => Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: Border.all(color: BaseColors.borderColor),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.network(
                          product.image,
                          height: 100,
                          width: 100,
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
                                height: 100,
                                fit: BoxFit.fitHeight,
                              ),
                            );
                          },
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Image.asset(
                                  IconAssets.colorsWatch,
                                  width: 14,
                                  fit: BoxFit.fitWidth,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  product.tag,
                                  style: const TextStyle(
                                    color: BaseColors.secondaryRed,
                                    fontSize: BaseSizes.fontBody2,
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              product.name,
                              style: const TextStyle(
                                color: BaseColors.textPrimary,
                                fontSize: BaseSizes.fontBody1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              maxLines: 2,
                            ),
                            Text(
                              '฿ ${controller.priceIntl(product.price)}',
                              style: const TextStyle(
                                color: BaseColors.textPrimary,
                                fontSize: BaseSizes.fontBody1,
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                )
                .toList(),
          )
        ],
      ),
    );
  }

  Widget _detailCard(
    String label,
    String value, {
    bool isBottom = false,
    Widget? prefixIcon,
    TextStyle? textStyle,
  }) {
    return Container(
      decoration: BoxDecoration(
        border: isBottom
            ? null
            : const Border(
                bottom: BorderSide(
                  width: 1,
                  color: BaseColors.borderColor,
                ),
              ),
      ),
      padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                label,
                style: const TextStyle(
                  color: BaseColors.textPrimary,
                  fontSize: BaseSizes.fontBody1,
                ),
              ),
              const SizedBox(
                width: 50,
              ),
              Expanded(
                child: Wrap(
                  alignment: WrapAlignment.end,
                  children: [
                    if (prefixIcon != null) ...[
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: prefixIcon,
                      ),
                    ],
                    Text(
                      value,
                      style: textStyle ??
                          const TextStyle(
                            color: BaseColors.textPrimary,
                            fontSize: BaseSizes.fontBody1,
                          ),
                      textAlign: TextAlign.right,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _parcelNumberCard(
    String label,
    String value, {
    bool isBottom = false,
    Function()? onPressed,
  }) {
    return Container(
      decoration: BoxDecoration(
        border: isBottom
            ? null
            : const Border(
                bottom: BorderSide(
                  width: 1,
                  color: BaseColors.borderColor,
                ),
              ),
      ),
      padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                label,
                style: const TextStyle(
                  color: BaseColors.textPrimary,
                  fontSize: BaseSizes.fontBody1,
                ),
              ),
              const SizedBox(
                width: 50,
              ),
              Expanded(
                child: Wrap(
                  alignment: WrapAlignment.end,
                  children: [
                    TextButton(
                      onPressed: onPressed,
                      style: TextButton.styleFrom(
                        elevation: 0,
                        padding: EdgeInsets.zero,
                        backgroundColor: Colors.transparent,
                        shadowColor: Colors.transparent,
                      ),
                      child: Text(
                        value,
                        style: const TextStyle(
                          color: BaseColors.actived,
                          fontSize: BaseSizes.fontBody1,
                        ),
                        textAlign: TextAlign.right,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
