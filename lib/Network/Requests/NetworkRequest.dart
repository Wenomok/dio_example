import 'package:dio/dio.dart';

// Методы запроса
enum NetworkRequestType { GET, POST, PUT, PATCH, DELETE }

class NetworkRequest {
  final NetworkRequestType type;
  // Конечный путь
  final String path;
  // Тело запроса
  final dynamic data;
  // Параметры
  final Map<String, dynamic>? queryParams;
  // Дополнительные хидеры
  final Map<String, dynamic>? headers;
  // Токен для отмены запроса
  final CancelToken? cancelToken;

  const NetworkRequest({required this.type, required this.path, this.data,
    this.queryParams, this.headers, this.cancelToken});
}