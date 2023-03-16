import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lachule/controllers/webview_controller.dart';
import 'package:lachule/widgets/button/go_back_button.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebviewPae extends GetView<WebviewController> {
  const WebviewPae({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const GoBackbutton(),
        title: const Text('การจัดส่ง'),
      ),
      body: WebViewWidget(
        controller: controller.webviewController,
      ),
    );
  }
}
