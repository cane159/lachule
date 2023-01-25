import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lachule/bases/base_assets.dart';
import 'package:lachule/bases/base_colors.dart';
import 'package:lachule/bases/base_sizes.dart';
import 'package:lachule/controllers/notification_controller.dart';
import 'package:lachule/widgets/bottomNavigationBar/app_bottom_navigation_bar.dart';

class NotificationPage extends GetView<NotificationController> {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    controller.setBuildContext(context);
    return Obx(
      () => SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: <Widget>[
              _imageBg(),
              _notiBody(context),
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

  Widget _textTitle() {
    return Container(
      width: Get.width,
      padding: const EdgeInsets.all(
        20,
      ),
      child: Row(
        children: const [
          Text(
            'กล่องข้อความ',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _notiBody(BuildContext context) {
    return Column(
      children: <Widget>[
        _textTitle(),
        _bottomSheet(context),
      ],
    );
  }

  Widget _bottomSheet(BuildContext context) {
    return Container(
      width: Get.width,
      padding: const EdgeInsets.fromLTRB(23, 23, 23, 0),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(
            20,
          ),
        ),
        color: BaseColors.white,
      ),
      child: Column(
        children: controller.notificationListData
            .map(
              (data) => Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Row(
                      children: <Widget>[
                        Text(
                          DateFormat('dd/MM/yyy').format(
                            DateTime.parse(data.createDate!),
                          ),
                          style: const TextStyle(
                            fontSize: BaseSizes.fontH4,
                            color: BaseColors.textPrimary,
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.only(bottom: 10),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: BaseColors.borderColor,
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      children: <Widget>[
                        Image.asset(
                          data.readed == true
                              ? ImageAssets.meassageRead
                              : ImageAssets.meassageUnRead,
                          width: 50,
                          height: 50,
                          fit: BoxFit.contain,
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              '${data.title}',
                              style: const TextStyle(
                                fontSize: BaseSizes.fontBody1,
                                color: BaseColors.textPrimary,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                            Text(
                              '${data.body}',
                              style: const TextStyle(
                                fontSize: BaseSizes.fontBody1,
                                color: BaseColors.tabTitle,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                            Row(
                              children: <Widget>[
                                Image.asset(
                                  IconAssets.clock,
                                  width: 12,
                                  height: 12,
                                  fit: BoxFit.fitWidth,
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  DateFormat('dd/MM/yyy').format(
                                    DateTime.parse(data.createDate!),
                                  ),
                                  style: const TextStyle(
                                    fontSize: 11,
                                    color: BaseColors.tabTitle,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
            .toList(),
      ),
    );
  }
}
