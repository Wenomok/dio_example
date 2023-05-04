import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio_example/Network/Requests/NetworkRequest.dart';
import 'package:flutter/foundation.dart';

import 'Requests/IsolatedNetworkRequest.dart';

class DioNetworkManager {
  // Инициализация Dio клиента с указанием начального урла, к которому будут добавляться path из request объектов
  // и таймауты на подключение и получение результата запроса, при выходе за рамки этого времени будут возвращены соотвествующие
  // DioError объекты, DioError.connectionTimeout и DioError.receiveTimeout
  final _dio = Dio(
    BaseOptions(
        baseUrl: 'https://api.spaceflightnewsapi.net',
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 15)
    ),
    // Перехватчик для логирования запроса и ответа на него
  )..interceptors.add(LogInterceptor(responseBody: true));

  // Редко изменяемые заголовки
  final Map<String, dynamic> _headers = {
    HttpHeaders.contentTypeHeader: 'application/json; charset=UTF-8'
  };
  // Но так же можно добавить заголовок авторизации
  // void addAuth(String accessToken) {
  //   _headers[HttpHeaders.authorizationHeader] = 'Bearer $accessToken';
  // }

  Future<Model> performRequest<Model>({
    // Параметры запроса
    required NetworkRequest request,
    // Функция парсера объекта
    Model Function(Map<String, dynamic>)? objectParser,
    // Функция парсера массива
    Model Function(List<dynamic>)? arrayParser,
  }) async {
    // Модель с копией запроса и dio клиента
    final isolatedRequest = IsolatedNetworkRequest<Model>(
        request,
        objectParser,
        arrayParser,
        _dio,
        {..._headers,...(request.headers ?? {})}
    );

    // Метод, который создаст новый изолят, который должен будет выполнить глобальный
    // метод executeRequest и передаст в него IsolatedNetworkRequest и вернёт
    // результат executeRequest
    return compute(
        executeRequest<Model>,
        isolatedRequest
    );
  }
}

Future<Model> executeRequest<Model>(IsolatedNetworkRequest request) async {
  try {
    final response = await request.dio.request(
        request.request.path,
        data: request.request.data,
        cancelToken: request.request.cancelToken,
        queryParameters: request.request.queryParams,
        options: Options(
            method: request.request.type.name,
            headers: request.headers,
        ),
    );

    dynamic Function(Map<String, dynamic>)? objectParser = request.objectParser;
    dynamic Function(List<dynamic>)? arrayParser = request.arrayParser;

    if(objectParser != null) {
      return objectParser(response.data);
    } else if(arrayParser != null) {
      return arrayParser(response.data);
    } else {
      return response.data;
    }
  } catch(error) {
    return Future.error(error);
  }
}