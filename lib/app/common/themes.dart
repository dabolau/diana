import 'package:flutter/material.dart';

/// 自定义主题
class Themes {
  /// 白天模式
  static final light = ThemeData.light().copyWith(
    // 导航条
    appBarTheme: AppBarTheme(
      titleTextStyle: TextStyle(
        color: Color(0xFF000000),
        fontSize: 18,
      ),
      backgroundColor: Color(0xFFFFEB3B),
    ),
    // 悬浮按钮
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      foregroundColor: Color(0xFF000000),
      backgroundColor: Color(0xFFFFEB3B),
    ),
    // 字体
    textTheme: TextTheme(
      bodyMedium: TextStyle(
        color: Color(0xFF000000),
      ),
    ),
    // 背景
    scaffoldBackgroundColor: Colors.grey.shade100,
  );
  // 黑夜模式
  static final dark = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: Colors.yellowAccent,
  );
}
