import 'package:dio/dio.dart';
import 'api_endpoints.dart';

class NetworkClient {
  late final Dio _dio;
  static NetworkClient? _instance;

  NetworkClient._internal() {
    _dio = Dio(
      BaseOptions(
        baseUrl: ApiEndpoints.baseUrl,
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ),
    );
  }

  factory NetworkClient() {
    _instance ??= NetworkClient._internal();
    return _instance!;
  }

  Future<Response> get(
    String path, {
    Map<String, dynamic>? queryParameters,
  }) async {
    return await _dio.get(path, queryParameters: queryParameters);
  }
}
