import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lachule/bases/base_controller.dart';
import 'package:webview_flutter/webview_flutter.dart';

class SettingTermsOfServiceController extends BaseController {
  WebViewController webviewController = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..setBackgroundColor(const Color(0x00000000))
    ..loadRequest(Uri.parse('https://lachuleonline.net/member/img_dialog.php'));
}
