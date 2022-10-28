import 'package:diana/app/common/themes.dart';
import 'package:diana/generated/locales.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:get/get.dart';

import 'app/routes/app_pages.dart';

void main() {
  runApp(
    /// 全局设置点击空白区域隐藏键盘
    KeyboardDismissOnTap(
      /// 全局状态管理、智能依赖注入和路由管理
      child: GetMaterialApp(
        /// 程序标题
        title: "Diana",

        /// 调试模式
        debugShowCheckedModeBanner: false,

        /// 多国语言，解决输入框中语言切换问题
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: [
          const Locale('zh', 'CN'),
          const Locale('en', 'US'),
        ],

        /// 多国语言
        translationsKeys: AppTranslation.translations, // 多国语言配置
        locale: Locale('zh', 'CN'), // 默认语言
        fallbackLocale: Locale('en', 'US'), // 配置错误时使用的语言

        /// 默认主题样式
        /// theme: ThemeData.light(),
        /// darkTheme: ThemeData.dark(),

        /// 自定义主题样式
        theme: Themes.light,
        darkTheme: Themes.dark,

        /// 主题模式
        themeMode: ThemeMode.light,

        /// 路由
        initialRoute: AppPages.INITIAL,

        /// 全部路由
        getPages: AppPages.routes,
      ),
    ),
  );
}
