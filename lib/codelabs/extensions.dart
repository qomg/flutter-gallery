import 'dart:convert' show jsonDecode;
import 'package:http/http.dart' as http;

extension on Future<http.Response> {
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

void getArticleList(Uri uri) {
    try {
        http.get(uri).mapFromResponse<List, List<Article>>(Article.fromList);
    } catch(e) {
        print(e);
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