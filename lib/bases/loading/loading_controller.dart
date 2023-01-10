import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'loading_page.dart';

class LoadingController extends GetxController {
  var isLoading = false.obs;

  updateLoading(BuildContext context, bool showLoading) {
    isLoading.value = showLoading;

    if (isLoading.value) {
      showDialog(
          context: context,
          barrierDismissible: false,
          useSafeArea: false,
          builder: (ctx) => const FullScreenLoader());
    } else {
      Navigator.of(context).pop();
    }
  }
}
