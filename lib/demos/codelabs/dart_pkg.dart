// ignore_for_file: avoid_void_async, unused_local_variable, avoid_print

import 'dart:collection';
import 'dart:convert';
import 'dart:io';

import 'package:path/path.dart' as path;

void combineCollection() async {
  // 合并集合
  Future<List<int>> mock() => Future.value([6, 7, 8]);

  var more = true;

  var combineList = <int>[
    0,
    1,
    ...[2, 3],
    if (more) ...[4, 5],
    ...await mock()
  ]; // [0,1,2,3,4,5,6,7,8]

  var combineSet = {
    0,
    1,
    ...{1, 2}
  }; // {0,1,2}

  var combineMap = <String, int>{
    ...{'a': 0, 'b': 2},
    ...{'a': 1, 'c': 3},
  }; // {'a':1,'b':2,'c':3}
}

void queue() {
  var q = Queue<int>();
  q.add(1);
  q.addFirst(0);
  q.addLast(2);
  print(q); // 0,1,2
  print(q.first); // 0
  print(q.last); // 2
  q.removeFirst();
  print(q); // 1,2
  q.removeLast();
  print(q); // 1
  // 遍历
  for (var i in q) {
    print(i);
  }
}

void set() {
  var s = Set<int>.identity();
  s.add(0);
  s.add(1);
  s.add(2);
  s.add(2);
  print(s); // 0,1,2
  s.union({1, 0, 5});
  print(s); // 0,1,2,5
  // 遍历
  for (var i in s) {
    print(i);
  }
}

void readFile() async {
  var tempDir = Directory.current.path;
  var file = File(path.join(tempDir, 'sample_code.dart'));
  await file.writeAsString('''
    // 类型检查
    1.runtimeType == int;// true
    3.14 is num;//true

    // 空值赋值
    void foo(num? money)
      money ??= 0.0;
    }
    ''');

  await file
      .openRead()
      .transform(utf8.decoder)
      .transform(const LineSplitter())
      .forEach((line) {
    print(line);
  });

  await file.readAsString();
}
