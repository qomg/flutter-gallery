import 'package:dokit/kit/apm/apm.dart';
import 'package:dokit/kit/kit.dart';
import 'package:flutter/material.dart';

class MyDoKit extends ApmKit {
  @override
  Widget createDisplayPage() {
    // TODO: implement createDisplayPage
    throw UnimplementedError();
  }

  @override
  IStorage createStorage() {
    // TODO: implement createStorage
    throw UnimplementedError();
  }

  @override
  String getIcon() {
    // TODO: implement getIcon
    throw UnimplementedError();
  }

  @override
  String getKitName() {
    return 'mydokit';
  }

  @override
  void start() {
    // TODO: implement start
  }

  @override
  void stop() {
    // TODO: implement stop
  }

}

void addBiz() {
  // 注册新的第三方业务入口，不可重复注册，否则报错
  ApmKitManager.instance.addKit('mydokit', MyDoKit());

  /* // 通过注册的key来手动通过代码打开一个业务入口对应的页面
  Future.delayed(Duration(seconds: 1), () {
    ApmKitManager.instance.open('biz1_goBizPage1');
    // 安全打开一个kitPage，和open的区别在于不会报错
    // ApmKitManager.instance.safeOpen();
  });

  // 隐藏kitPage，不会删除上一次的打开记录
  ApmKitManager.instance.hide();
  // 关闭kitPage，会删除上一次的打开记录
  ApmKitManager.instance.close();

  // 如果传入的kitBuilder中的widget层级中没有包含Navigator（MaterialApp、WidgetApp等组件默认包含Navigator），则推荐使用，否则无法关闭
  Navigator.of(context).pop(); */
}