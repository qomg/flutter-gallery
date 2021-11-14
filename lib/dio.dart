import 'package:dio/dio.dart';

class DioClient {
  static final Dio defaultClient = _createDefaultDio();

  static Dio _createDefaultDio() {
    var options = BaseOptions(
      baseUrl: 'https://www.example.com/api',
      connectTimeout: 5000,
      receiveTimeout: 3000,
    );
    return Dio(options);
  }
}