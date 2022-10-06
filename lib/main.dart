import 'package:diana/app/common/themes.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'app/routes/app_pages.dart';

void main() {
  runApp(
    GetMaterialApp(
      // 程序标题
      title: "Diana",
      // 调试模式
      debugShowCheckedModeBanner: false,
      // 默认主题样式
      // theme: ThemeData.light(),
      // darkTheme: ThemeData.dark(),
      // 自定义主题样式
      theme: Themes.light,
      darkTheme: Themes.dark,
      // 主题模式
      themeMode: ThemeMode.light,
      // 路由
      initialRoute: AppPages.INITIAL,
      // 全部路由
      getPages: AppPages.routes,
    ),
  );
}
