// ignore_for_file: unused_import, directives_ordering

// dart 标准库 stdlib.h
import 'dart:math';

// 三方库
import 'package:flutter/material.dart';

// 项目自身文件
import 'package:gallery/app.dart';
import '../app.dart';

// 指定引用
import 'dart:async' show Stream;
import 'dart:convert' show jsonEncode;
import 'dart:io' show pid;

// 剔除引用
import 'dart:async' hide AsyncError;
import 'dart:convert' hide jsonDecode;
import 'dart:io' hide exitCode;

// 定义别名
import 'package:http/http.dart' as http;

// 懒加载
import 'package:gallery/studies/rally/app.dart' deferred as rally;

Future<Widget> rallyApp() async {
  await rally.loadLibrary();
  return rally.RallyApp();
}

