import 'dart:async';
import 'dart:developer' show log;
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

void startUp(VoidCallback block) {
  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();

    GoogleFonts.config.allowRuntimeFetching = false;

    // 沉浸式状态栏
    if (Platform.isAndroid) {
      // 以下两行 设置android状态栏为透明的沉浸。
      // 写在组件渲染之后，是为了在渲染后进行set赋值，覆盖状态栏
      // 写在渲染之前MaterialApp组件会覆盖掉这个值。
      var systemUiOverlayStyle =
          const SystemUiOverlayStyle(statusBarColor: Colors.transparent);
      SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
    }

    FlutterError.onError = _onError;

    block();
  }, (error, stack) {
    _onError(FlutterErrorDetails(exception: error, stack: stack));
  });
}

/// 错误打印
void _onError(FlutterErrorDetails details) {
  log(details.exceptionAsString(),
      error: details.exception, stackTrace: details.stack);
  if (kReleaseMode) exit(1);
}
