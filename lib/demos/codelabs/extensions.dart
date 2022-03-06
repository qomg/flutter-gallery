import 'dart:convert' show jsonDecode;
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

extension HttpResponseMapper on Future<http.Response> {
  Future<R?> mapFromResponse<R, T>(R? Function(T?) jsonParser) async {
    try {
      final response = await this;
      if (response.statusCode == 200) {
        return jsonParser(jsonDecode(response.body) as T?);
      } else {
        throw GenericHttpException();
      }
    } on SocketException {
      throw NoConnectionException();
    }
  }
}

class SocketException {}

class NoConnectionException {}

class GenericHttpException {}

/// 示例
class Article {
  static Article fromMap(dynamic map) {
    return Article();
  }

  static List<Article>? fromList(List? list) {
    return list?.map(fromMap).toList();
  }
}

Future<void> getArticleList(Uri uri) async {
  try {
    var articles = await http.get(uri).mapFromResponse<List, List<Article>>(Article.fromList);
  } catch (e) {
    debugPrint(Error.safeToString(e));
  }
}
