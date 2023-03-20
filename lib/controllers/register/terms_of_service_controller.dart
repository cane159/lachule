
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lachule/bases/base_controller.dart';
import 'package:webview_flutter/webview_flutter.dart';

class TermsOfServiceController extends BaseController {
  final RxBool _isAccept = false.obs;
  final String detail =
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Netus pellentesque ullamcorper scelerisque pulvinar libero semper id enim id. Viverra at quis elit non maecenas consectetur non. Tellus commodo morbi arcu tellus. Ut aenean porttitor porttitor id faucibus adipiscing proin.Elit, commodo mollis diam egestas. Nascetur nisi sit maecenas nisi, sed. Tincidunt nunc mauris mi, ut vitae suspendisse. Sit ornare suspendisse elit interdum vestibulum at purus viverra. Ut tempus vitae libero faucibus. Nulla id pharetra purus in magna cursus consectetur. Amet, duis gravida urna, nunc.Arcu quis in tincidunt aliquam malesuada sit. Proin consectetur neque, nec, in. Fermentum scelerisque ipsum risus luctus lorem in mauris adipiscing hendrerit. Enim, venenatis ornare fames urna enim in feugiat. Proin sed donec.';

  // Getter
  bool get isAccept => _isAccept.value;

  void isPressedAccept(bool value) {
    _isAccept.value = value;
  }

  WebViewController webviewController = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..setBackgroundColor(const Color(0x00000000))
    ..loadRequest(Uri.parse('https://lachuleonline.net/member/img_dialog.php'));
}
