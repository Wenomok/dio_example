import 'package:dio/dio.dart';

import 'NetworkRequest.dart';

class IsolatedNetworkRequest<Model> {
  final NetworkRequest request;
  final Model Function(Map<String, dynamic>)? objectParser;
  final Model Function(List<dynamic>)? arrayParser;
  final Dio dio;
  final Map<String, dynamic> headers;

  const IsolatedNetworkRequest(
      this.request,
      this.objectParser,
      this.arrayParser,
      this.dio,
      this.headers,
      );
}

