import 'package:diana/app/modules/home/views/home_view.dart';
import 'package:diana/app/modules/my/views/my_view.dart';
import 'package:diana/app/modules/type/views/type_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainController extends GetxController {
  /// 页面控制器
  var pageController = PageController();

  /// 当前页面索引
  var pageIndex = 0.obs;

  /// 所有页面
  var pages = [
    HomeView(),
    TypeView(),
    MyView(),
  ];

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    /// 销毁页面控制器
    pageController.dispose();
  }
}
