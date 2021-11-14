import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ume/flutter_ume.dart'; // UME 框架
import 'package:flutter_ume_kit_analysis/flutter_ume_kit_analysis.dart'; // 自定义分析插件
import 'package:flutter_ume_kit_console/flutter_ume_kit_console.dart'; // debugPrint 插件包
import 'package:flutter_ume_kit_device/flutter_ume_kit_device.dart'; // 设备信息插件包
import 'package:flutter_ume_kit_dio/flutter_ume_kit_dio.dart'; // Dio 网络请求调试工具
import 'package:flutter_ume_kit_perf/flutter_ume_kit_perf.dart'; // 性能插件包
import 'package:flutter_ume_kit_show_code/flutter_ume_kit_show_code.dart'; // 代码查看插件包
import 'package:flutter_ume_kit_ui/flutter_ume_kit_ui.dart'; // UI 插件包

import 'dio.dart';

Widget wrapUME(Widget app) {
  if (kDebugMode) {
    // 注册插件
    PluginManager.instance
      ..register(const WidgetInfoInspector()) // Widget信息，位置、尺寸
      ..register(const WidgetDetailInspector()) // Widget详情，描述、结构
      ..register(const ColorSucker()) // 颜色吸管
      ..register(AlignRuler()) // 对齐标尺
      ..register(Performance()) // 性能浮窗
      ..register(const ShowCode()) // 源码
      ..register(const MemoryInfoPage()) // 内存信息
      ..register(CpuInfoPage()) // CPU信息
      ..register(const DeviceInfoPanel()) // 设备信息
      ..register(Console()) // 日志
      ..register(AnalysisRobot()) // 分析机器人
      ..register(DioInspector(dio: DioClient.defaultClient)); // Dio网络调试工具，传入Dio实例
    return injectUMEWidget(child: app, enable: true); // 初始化
  }
  return app;
}
