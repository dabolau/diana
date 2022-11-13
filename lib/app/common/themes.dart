import 'package:flutter/material.dart';

/// 浅色主要颜色
const lightPrimaryColor = Color(0xFFFFEB3B);

/// 浅色主要文字颜色
const lightTextPrimaryColor = Color(0xFF000000);

/// 浅色背景颜色
var lightBackgroundColor = Color(0xFFF4F4F4);

/// 深色主要颜色
const darkPrimaryColor = Color(0xFF1C1B20);

/// 深色主要文字颜色
const darkTextPrimaryColor = Color(0xFF000000);

/// 深色背景颜色
var darkBackgroundColor = Color(0xFF000000);

/// 自定义主题
class Themes {
  /// 浅色模式
  static final light = ThemeData.light().copyWith(
    /// 导航条主题
    appBarTheme: AppBarTheme(
      /// 字体颜色
      titleTextStyle: TextStyle(
        color: Color(0xFF000000),
        fontSize: 18,
      ),

      /// 图标
      iconTheme: IconThemeData(
        color: Color(0xFF000000),
        size: 18,
      ),

      /// 图标
      actionsIconTheme: IconThemeData(
        color: Color(0xFF000000),
        size: 18,
      ),

      /// 背景颜色
      backgroundColor: Color(0xFFFFFFFF),
    ),

    /// 悬浮按钮主题
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      foregroundColor: Color(0xFF000000),
      backgroundColor: Color(0xFFFFFFFF),
    ),

    /// 输入框主题
    inputDecorationTheme: InputDecorationTheme(
      /// 占位文本
      hintStyle: TextStyle(
        color: Color(0xFF393939),
      ),
    ),

    /// 文本按钮主题
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        /// 形状
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0),
          ),
        ),

        /// 前景颜色
        foregroundColor: MaterialStateProperty.all(
          Color(0xFF000000),
        ),

        /// 背景颜色
        backgroundColor: MaterialStateProperty.all(
          Color(0xFFFFFFFF),
        ),

        /// 覆盖颜色
        overlayColor: MaterialStateProperty.all(
          Color(0xFFFFFFFF),
        ),
      ),
    ),

    /// 图标颜色
    iconTheme: IconThemeData(
      color: Color(0xFF000000),
    ),

    /// 字体主题
    textTheme: TextTheme(
      /// 大型标题字体
      titleLarge: TextStyle(
        color: Color(0xFF000000),
      ),

      /// 中型标题字体
      titleMedium: TextStyle(
        color: Color(0xFF000000),
      ),

      /// 小型标题字体
      titleSmall: TextStyle(
        color: Color(0xFF000000),
      ),

      /// 大型字体
      bodyLarge: TextStyle(
        color: Color(0xFF000000),
      ),

      /// 中型字体
      bodyMedium: TextStyle(
        color: Color(0xFF000000),
      ),

      /// 小型字体
      bodySmall: TextStyle(
        color: Color(0xFF000000),
      ),
    ),

    /// 背景颜色
    scaffoldBackgroundColor: Color(0xFFF4F4F4),
  );

  /// 深色模式
  static final dark = ThemeData.dark().copyWith(
    /// 导航条主题
    appBarTheme: AppBarTheme(
      /// 字体颜色
      titleTextStyle: TextStyle(
        color: Color(0xFFE6E1E5),
        fontSize: 18,
      ),

      /// 图标
      iconTheme: IconThemeData(
        color: Color(0xFFE6E1E5),
        size: 18,
      ),

      /// 图标
      actionsIconTheme: IconThemeData(
        color: Color(0xFFE6E1E5),
        size: 18,
      ),

      /// 背景颜色
      backgroundColor: Color(0xFF1C1B20),
    ),

    /// 悬浮按钮主题
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      foregroundColor: Color(0xFFE6E1E5),
      backgroundColor: Color(0xFF1C1B20),
    ),

    /// 输入框主题
    inputDecorationTheme: InputDecorationTheme(
      /// 占位文本
      hintStyle: TextStyle(
        color: Color(0xFF393939),
      ),
    ),

    /// 文本按钮主题
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        /// 形状
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0),
          ),
        ),

        /// 前景颜色
        foregroundColor: MaterialStateProperty.all(
          Color(0xFFE6E1E5),
        ),

        /// 背景颜色
        backgroundColor: MaterialStateProperty.all(
          Color(0xFF1C1B20),
        ),

        /// 覆盖颜色
        overlayColor: MaterialStateProperty.all(
          Color(0xFF1C1B20),
        ),
      ),
    ),

    /// 图标颜色
    iconTheme: IconThemeData(
      color: Color(0xFFE6E1E5),
    ),

    /// 字体主题
    textTheme: TextTheme(
      /// 大型标题字体
      titleLarge: TextStyle(
        color: Color(0xFFE6E1E5),
      ),

      /// 中型标题字体
      titleMedium: TextStyle(
        color: Color(0xFFE6E1E5),
      ),

      /// 小型标题字体
      titleSmall: TextStyle(
        color: Color(0xFFE6E1E5),
      ),

      /// 大型字体
      bodyLarge: TextStyle(
        color: Color(0xFFE6E1E5),
      ),

      /// 中型字体
      bodyMedium: TextStyle(
        color: Color(0xFFE6E1E5),
      ),

      /// 小型字体
      bodySmall: TextStyle(
        color: Color(0xFFE6E1E5),
      ),
    ),

    /// 背景颜色
    scaffoldBackgroundColor: Color(0xFF000000),
  );
}
