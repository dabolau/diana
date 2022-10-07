import 'package:flutter/material.dart';

//////
/// 自定义主题
//////
class Themes {
  //////
  /// 浅色模式
  //////
  static final light = ThemeData.light().copyWith(
    //////
    /// 导航条主题
    //////
    appBarTheme: AppBarTheme(
      // 字体颜色
      titleTextStyle: TextStyle(
        color: Color(0xFF000000),
        fontSize: 18,
      ),
      // 图标
      iconTheme: IconThemeData(
        color: Color(0xFF000000),
        size: 18,
      ),
      // 图标
      actionsIconTheme: IconThemeData(
        color: Color(0xFF000000),
        size: 18,
      ),
      // 背景颜色
      backgroundColor: Color(0xFFFFEB3B),
    ),
    // 悬浮按钮主题
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      foregroundColor: Color(0xFF000000),
      backgroundColor: Color(0xFFFFEB3B),
    ),
    // 文本按钮主题
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        // 形状
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0),
          ),
        ),
        // 前景颜色
        foregroundColor: MaterialStateProperty.all(
          Color(0xFF000000),
        ),
        // 背景颜色
        backgroundColor: MaterialStateProperty.all(
          Color(0xFFFFFFFF),
        ),
        // 覆盖颜色
        overlayColor: MaterialStateProperty.all(
          Color(0xFFFFFFFF),
        ),
      ),
    ),
    // 字体主题
    textTheme: TextTheme(
      bodyLarge: TextStyle(
        color: Color(0xFF000000),
      ),
      bodyMedium: TextStyle(
        color: Color(0xFF000000),
      ),
      bodySmall: TextStyle(
        color: Color(0xFF000000),
      ),
    ),

    // 背景颜色
    scaffoldBackgroundColor: Colors.grey.shade100,
  );

  //////
  /// 深色模式
  //////
  static final dark = ThemeData.dark().copyWith(
    //////
    /// 导航条主题
    //////
    appBarTheme: AppBarTheme(
      // 字体颜色
      titleTextStyle: TextStyle(
        color: Color(0xFFE6E1E5),
        fontSize: 18,
      ),
      // 图标
      iconTheme: IconThemeData(
        color: Color(0xFFE6E1E5),
        size: 18,
      ),
      // 图标
      actionsIconTheme: IconThemeData(
        color: Color(0xFFE6E1E5),
        size: 18,
      ),
      // 背景颜色
      backgroundColor: Color(0xFF1C1B20),
    ),
    // 悬浮按钮主题
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      foregroundColor: Color(0xFFE6E1E5),
      backgroundColor: Color(0xFF1C1B20),
    ),
    // 文本按钮主题
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        // 形状
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0),
          ),
        ),
        // 前景颜色
        foregroundColor: MaterialStateProperty.all(
          Color(0xFFE6E1E5),
        ),
        // 背景颜色
        backgroundColor: MaterialStateProperty.all(
          Color(0xFF393939),
        ),
        // 覆盖颜色
        overlayColor: MaterialStateProperty.all(
          Color(0xFF393939),
        ),
      ),
    ),
    // 字体主题
    textTheme: TextTheme(
      bodyLarge: TextStyle(
        color: Color(0xFFE6E1E5),
      ),
      bodyMedium: TextStyle(
        color: Color(0xFFE6E1E5),
      ),
      bodySmall: TextStyle(
        color: Color(0xFFE6E1E5),
      ),
    ),

    //////
    /// 背景颜色
    //////
    scaffoldBackgroundColor: Color(0xFF303030),
  );
}
