import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lachule/bases/loading/loading_controller.dart';

abstract class BaseController extends GetxController {
  late final LoadingController _loadingController = Get.find();
  late BuildContext context;
  late FocusScopeNode _currentFocus = FocusScope.of(context);

  setBuildContext(BuildContext context) {
    this.context = context;
  }

  startLoading() {
    _loadingController.updateLoading(context, true);
  }

  stopLoad() {
    _loadingController.updateLoading(context, false);
  }
}
