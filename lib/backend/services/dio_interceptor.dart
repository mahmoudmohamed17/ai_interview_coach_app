import 'dart:developer';

import 'package:dio/dio.dart';

class DioInterceptor implements Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    log('Error: ${err.message}');
    handler.next(err);
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    log('Success: ${options.method} ${options.uri}');
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    log('Response: ${response.statusCode} ${response.requestOptions.uri}');
    handler.next(response);
  }
}
