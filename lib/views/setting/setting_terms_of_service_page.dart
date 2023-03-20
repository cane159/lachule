import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lachule/bases/base_assets.dart';
import 'package:lachule/bases/base_colors.dart';
import 'package:lachule/bases/base_sizes.dart';
import 'package:lachule/controllers/setting/setting_terms_of_service_controller.dart';
import 'package:lachule/routes/app_pages.dart';
import 'package:lachule/widgets/app_check_box.dart';
import 'package:lachule/widgets/button/button_theme_helper.dart';
import 'package:lachule/widgets/button/go_back_button.dart';
import 'package:lachule/widgets/button/primary_button.dart';
import 'package:webview_flutter/webview_flutter.dart';

class SettingTermsOfServicePage
    extends GetView<SettingTermsOfServiceController> {
  const SettingTermsOfServicePage({super.key});

  @override
  Widget build(BuildContext context) {
    controller.setBuildContext(context);
    return Scaffold(
      appBar: _appbar(),
      body: WebViewWidget(
        controller: controller.webviewController,
      ),
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
            'ข้อตกลง และเงื่อนไขการให้บริการ',
            style: TextStyle(
              color: BaseColors.textPrimary,
              fontSize: 21,
              fontWeight: FontWeight.bold,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
