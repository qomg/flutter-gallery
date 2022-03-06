typedef Comparison<T> = int Function(T a, T b);

// 匿名
Future<void> downloadFile(
  String url,
  void Function(int progress) onProgressChanged,
  Function onError,
) async {
  // onError 任意方法
  onError(Exception('invalid url'));
  onError(404, 'file not found');
}

class FirstOrNull<T> {
  FirstOrNull(this.predicate);

  final bool Function(T a) predicate;

  T? get(Iterable<T> list) {
    var it = list.where(predicate).iterator;
    if (it.moveNext()) {
      return it.current;
    }
    return null;
  }
}
