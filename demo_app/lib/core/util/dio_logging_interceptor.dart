import 'dart:convert';

import 'package:demo_app/core/config/flavor_config.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';



class DioLoggingInterceptor extends InterceptorsWrapper {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (FlavorConfig.instance?.flavor == Flavor.development) {
      debugPrint("--> ${options.method.toUpperCase()} ${"${options.baseUrl}${options.path}"}");
      debugPrint('Headers:');
      options.headers.forEach((k, v) => debugPrint('$k: $v'));
      debugPrint('queryParameters:');
      options.queryParameters.forEach((k, v) => debugPrint('$k: $v'));
      if (options.data != null) {
        debugPrint('Body: ${options.data}');
      }
      debugPrint("--> END ${options.method.toUpperCase()}");
    }

    // example for add header authorization
    /*if (options.headers.containsKey(requiredToken)) {
      options.headers.remove(requiredToken);
      options.headers.addAll({'Authorization': 'Bearer $token'});
    }*/
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (FlavorConfig.instance?.flavor == Flavor.development) {
      debugPrint("<-- ${response.statusCode} ${(response.requestOptions.baseUrl + response.requestOptions.path)}");
      debugPrint('Headers:');
      response.headers.forEach((k, v) => debugPrint('$k: $v'));
      // Format large response bodies
      final data = response.data;
      if (data is Map || data is List) {
        debugPrint('Response: ${jsonEncode(data)}');
      } else {
        debugPrint('Response: $data');
      }
      debugPrint('<-- END HTTP');
    }
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (FlavorConfig.instance?.flavor == Flavor.development) {
      debugPrint("<-- ${err.message} ${(err.response != null ? (err.response!.requestOptions.baseUrl + err.response!.requestOptions.path) : 'URL')}");
      debugPrint(err.response != null ? jsonEncode(err.response?.data) : 'Unknown Error');
      debugPrint('<-- End error');
    }
    super.onError(err, handler);
  }
}
