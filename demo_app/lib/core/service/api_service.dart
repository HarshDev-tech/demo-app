import 'dart:io';

import 'package:demo_app/core/config/base_url_config.dart';
import 'package:demo_app/core/error/failure.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';


enum DioMethod { post, get, put, delete }

class APIService {
  APIService._singleton();

  static final APIService instance = APIService._singleton();

  // Define the token variable
  String? token;

  String get baseUrl {
    if (kDebugMode) {
      return BaseUrlConfig.baseUrlDevelopment;
    }
    return BaseUrlConfig.baseUrlDevelopment;
  }

  Future<Response> request(
    String endpoint,
    DioMethod method, {
    Map<String, dynamic>? param,
    String? contentType,
    FormData? formData,
  }) async {
    try {
      final dio = Dio(
        BaseOptions(
          baseUrl: baseUrl,
          contentType: contentType ?? Headers.formUrlEncodedContentType,
          headers: {
            HttpHeaders.authorizationHeader: 'Bearer ${token ?? ''}',
          },
        ),
      );
      switch (method) {
        case DioMethod.post:
          return dio.post(
            endpoint,
            data: param ?? formData,
          );
        case DioMethod.get:
          return dio.get(
            endpoint,
            queryParameters: param,
          );
        case DioMethod.put:
          return dio.put(
            endpoint,
            data: param ?? formData,
          );
        case DioMethod.delete:
          return dio.delete(
            endpoint,
            data: param ?? formData,
          );
        default:
          return dio.post(
            endpoint,
            data: param ?? formData,
          );
      }
    } catch (e) {
      throw ServerFailure('Network error: $e');
    }
  }
}
