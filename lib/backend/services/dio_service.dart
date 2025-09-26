import 'package:ai_interview_coach_app/backend/services/dio_interceptor.dart';
import 'package:dio/dio.dart';

class DioService {
  late Dio _dio;
  DioService() {
    _dio = Dio(
      BaseOptions(
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
        sendTimeout: const Duration(seconds: 10),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ),
    )..interceptors.add(DioInterceptor());
  }

  Future<dynamic> get(
    String url, {
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) async {
    try {
      final response = await _dio.get(
        url,
        queryParameters: queryParameters,
        options: Options(headers: headers),
      );
      return response.data;
    } on DioException catch (e) {
      throw Exception('DioException: ${e.message}');
    } catch (e) {
      throw Exception('Exception: ${e.toString()}');
    }
  }

  Future<dynamic> post(
    String url, {
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) async {
    try {
      final response = await _dio.post(
        url,
        data: data,
        queryParameters: queryParameters,
        options: Options(headers: headers),
      );
      return response.data;
    } on DioException catch (e) {
      throw Exception('DioException: ${e.message}');
    } catch (e) {
      throw Exception('Exception: ${e.toString()}');
    }
  }

  Future<dynamic> put(
    String url, {
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final response = await _dio.put(
        url,
        data: data,
        queryParameters: queryParameters,
      );
      return response.data;
    } on DioException catch (e) {
      throw Exception('DioException: ${e.message}');
    } catch (e) {
      throw Exception('Exception: ${e.toString()}');
    }
  }
}
