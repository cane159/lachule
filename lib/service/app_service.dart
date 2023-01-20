// ignore_for_file: avoid_print
import 'package:flutter/material.dart';
import 'package:lachule/core/network/network_exception.dart';
import '../models/app_response.dart';

typedef OnSuccess<T> = Function(T response);
typedef OnFail = Function(dynamic error);

class AppService {
  static Future<dynamic> call<T>(
      {required BuildContext context,
      required Future<T> request,
      required OnSuccess<T> onSuccess,
      required OnFail onFail,
      bool backWhenFail = false,
      bool checkStatus = false}) async {
    try {
      final response = await request;

      if (checkStatus) {
        if (response is AppResponse) {
          if (!response.status!) {
            print('response data ${!response.status!}');
            onFail(Exception(response.message));
            // HandlerAlert.popupMessage(context,
            //     message: response.message,
            //     isBack: backWhenFail,
            //     showAlway: true);
          } else {
            await onSuccess(response);
          }
        } else {
          const errMsg = 'error cast exception';
          onFail(Exception(errMsg));
          print(errMsg);
          // HandlerAlert.popupMessage(context,
          //     message: errMsg, isBack: true, showAlway: true);
        }
      } else {
        await onSuccess(response);
      }
    } on NetworkException catch (e) {
      onFail(e);
      // HandlerAlert.network(context, e: e, isBack: backWhenFail);
    }
  }

  AppService._();
}
