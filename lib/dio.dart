import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

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

void foo() {
  DioClient.defaultClient
  .get<String>('https://www.qomg.fun')
  .then((value) => debugPrint(value.data))
  .catchError((dynamic e, dynamic s) {
    // if (e is String) {
    //   debugPrint(e);
    // } else if (e is Exception) {
    //   debugPrint(e.toString());
    // } else if (e is Error) {
      debugPrint(Error.safeToString(e));
    // } else if (e != null) {
    //   debugPrint(jsonEncode(e));
    // }
    if (s is StackTrace) {
      debugPrintStack(stackTrace: s);
    }
  });
}