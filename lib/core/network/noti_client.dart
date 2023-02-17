// ignore_for_file: constant_identifier_names

import 'package:dio/dio.dart';
import 'package:get/instance_manager.dart';
import 'package:lachule/storage/app_prefs.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class NotiClient {
  static const int CONNECT_TIMEOUT = 35 * 1000;
  static const int RECEIVE_TIMEOUT = 35 * 1000;

  static const String GET = 'get';
  static const String POST = 'post';
  static const String PUT = 'put';
  static const String PATCH = 'patch';
  static const String DELETE = 'delete';

  late Dio _dio;

  final AppPrefs _appPrefs = Get.find();

  /// dio new instants
  NotiClient() {
    _dio = Dio();

    // set options
    _dio.options = BaseOptions(
      baseUrl: "http://test.push-gears-mk2.appspot.com/",
      connectTimeout: CONNECT_TIMEOUT,
      receiveTimeout: RECEIVE_TIMEOUT,
    );

    // add log
    _dio.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 90,
      ),
    );
  }

  // get method
  Future<dynamic> get(
    String url, {
    data,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    bool isAuth = false,
    bool isFormUrlEncoded = false,
    bool isMediaTypeAccept = true,
  }) async {
    return _request(
      url,
      method: GET,
      data: data,
      cancelToken: cancelToken,
      headers: headers,
      isAuth: isAuth,
      isFormUrlEncoded: isFormUrlEncoded,
      isMediaTypeAccept: isMediaTypeAccept,
    );
  }

  // post method
  Future<dynamic> post(
    String url, {
    data,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    bool isAuth = false,
    bool isFormUrlEncoded = false,
    bool isMediaTypeAccept = true,
  }) async {
    return _request(
      url,
      method: POST,
      data: data,
      cancelToken: cancelToken,
      headers: headers,
      isAuth: isAuth,
      isFormUrlEncoded: isFormUrlEncoded,
      isMediaTypeAccept: isMediaTypeAccept,
    );
  }

  // put method
  Future<dynamic> put(
    String url, {
    data,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    bool isAuth = false,
    bool isFormUrlEncoded = false,
    bool isMediaTypeAccept = true,
  }) async {
    return _request(
      url,
      method: PUT,
      data: data,
      cancelToken: cancelToken,
      headers: headers,
      isAuth: isAuth,
      isFormUrlEncoded: isFormUrlEncoded,
      isMediaTypeAccept: isMediaTypeAccept,
    );
  }

  // patch method
  Future<dynamic> patch(
    String url, {
    data,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    bool isAuth = false,
    bool isFormUrlEncoded = false,
    bool isMediaTypeAccept = true,
  }) async {
    return _request(
      url,
      method: PATCH,
      data: data,
      cancelToken: cancelToken,
      headers: headers,
      isAuth: isAuth,
      isFormUrlEncoded: isFormUrlEncoded,
      isMediaTypeAccept: isMediaTypeAccept,
    );
  }

  // delete method
  Future<dynamic> delete(
    String url, {
    data,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    bool isAuth = false,
    bool isFormUrlEncoded = false,
    bool isMediaTypeAccept = true,
  }) async {
    return _request(
      url,
      method: DELETE,
      data: data,
      cancelToken: cancelToken,
      headers: headers,
      isAuth: isAuth,
      isFormUrlEncoded: isFormUrlEncoded,
      isMediaTypeAccept: isMediaTypeAccept,
    );
  }

  // request data
  Future<dynamic> _request(
    String url, {
    String? method,
    data,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    bool isAuth = false,
    bool isFormUrlEncoded = false,
    bool isMediaTypeAccept = true,
  }) async {
    try {
      final token = isAuth ? _appPrefs.accessToken.value : null;
      final locale = _appPrefs.locale.value;
      final xApiKey = "iG7u0FEB2b7FY1uQSPKmaT73PVMAo7Ah";

      Response response = await _dio.request(
        url,
        data: data,
        queryParameters: method == GET ? data : null,
        options: Options(
          method: method,
          headers: {
            "Content-Type": isFormUrlEncoded
                ? Headers.formUrlEncodedContentType
                : 'application/json',
            'x-api-key': xApiKey,
            if (token != null) 'Authorization': "Bearer " + token,
            if (locale != null) 'locale': locale,
            if (headers != null) ...headers,
          },
        ),
        cancelToken: cancelToken,
      );

      return response.data;
    } catch (e) {
      rethrow;
    }
  }
}
