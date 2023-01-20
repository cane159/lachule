import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:lachule/bases/base_assets.dart';
import 'package:lachule/bases/base_colors.dart';
import 'package:lachule/controllers/notification_controller.dart';
import 'package:lachule/widgets/bottomNavigationBar/app_bottom_navigation_bar.dart';

class NotificationPage extends GetView<NotificationController> {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            _imageBg(),
            _notiBody(),
          ],
        ),
      ),
      bottomNavigationBar: const AppBottomNavigationBar(),
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
    return Padding(
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

  Widget _notiBody() {
    return Column(
      children: <Widget>[
        _textTitle(),
        _bottomSheet(),
      ],
    );
  }

  Widget _bottomSheet() {
    return Container(
      margin: const EdgeInsets.fromLTRB(23, 23, 23, 0),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(
            20,
          ),
        ),
        color: BaseColors.white,
      ),
      child: Column(),
    );
  }
}
