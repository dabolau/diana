import 'package:diana/app/common/themes.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/my_controller.dart';

class MyView extends GetView<MyController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('我的'),
        centerTitle: true,
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // 默认主题切换
          // Get.changeTheme(
          //     Get.isDarkMode ? ThemeData.light() : ThemeData.dark());
          // 自定义主图切换
          Get.changeTheme(Get.isDarkMode ? Themes.light : Themes.dark);
        },
        elevation: 0,
        child: Icon(Icons.add),
      ),
      body: Container(
        child: ListView(
          children: [
            //////
            // 间隔
            //////
            SizedBox(
              height: 10,
            ),
            //////
            // 账号资料
            //////
            Container(
              width: double.infinity,
              height: 50,
              // color: Color(0xFFFFEB3B),
              child: TextButton(
                onPressed: () {},
                child: Row(
                  // 主轴间隔显示
                  mainAxisAlignment: MainAxisAlignment.center,
                  // 辅轴居中显示
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // 左边组件
                    Text(
                      '账号信息',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                      ),
                    ),
                    // 中间组件
                    Spacer(),
                    // 右边组件
                    Icon(
                      Icons.keyboard_arrow_right,
                      color: Colors.black,
                      size: 20,
                    ),
                  ],
                ),
              ),
            ),
            //////
            // 间隔
            //////
            SizedBox(
              height: 1,
            ),
            //////
            // 安全隐私
            //////
            Container(
              // padding: EdgeInsets.symmetric(horizontal: 15),
              width: double.infinity,
              height: 50,
              // color: Color(0xFFFFEB3B),
              child: TextButton(
                onPressed: () {},
                child: Row(
                  // 主轴间隔显示
                  mainAxisAlignment: MainAxisAlignment.center,
                  // 辅轴居中显示
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // 左边组件
                    Text(
                      '安全隐私',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                      ),
                    ),
                    // 中间组件
                    Spacer(),
                    // 右边组件
                    Icon(
                      Icons.keyboard_arrow_right,
                      color: Colors.black,
                      size: 20,
                    ),
                  ],
                ),
              ),
            ),
            //////
            // 间隔
            //////
            SizedBox(
              height: 10,
            ),

            //////
            // 多国语言
            //////
            Container(
              // padding: EdgeInsets.symmetric(horizontal: 15),
              width: double.infinity,
              height: 50,
              // color: Color(0xFFFFEB3B),
              child: TextButton(
                onPressed: () {},
                child: Row(
                  // 主轴间隔显示
                  mainAxisAlignment: MainAxisAlignment.center,
                  // 辅轴居中显示
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // 左边组件
                    Text(
                      '多国语言',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                      ),
                    ),
                    // 中间组件
                    // Container(),
                    Spacer(),
                    // 右边组件
                    Text(
                      '简体中文',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                      ),
                    ),
                    Icon(
                      Icons.keyboard_arrow_right,
                      color: Colors.black,
                      size: 20,
                    ),
                  ],
                ),
              ),
            ),
            //////
            // 间隔
            //////
            SizedBox(
              height: 1,
            ),

            //////
            // 主题样式
            //////
            Container(
              // padding: EdgeInsets.symmetric(horizontal: 15),
              width: double.infinity,
              height: 50,
              // color: Color(0xFFFFEB3B),
              child: TextButton(
                onPressed: () {
                  // 更换主题
                  Get.changeTheme(Get.isDarkMode ? Themes.light : Themes.dark);
                },
                child: Row(
                  // 主轴间隔显示
                  mainAxisAlignment: MainAxisAlignment.center,
                  // 辅轴居中显示
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // 左边组件
                    Text(
                      '主题样式',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                      ),
                    ),
                    // 中间组件
                    Spacer(),
                    // 右边组件
                    Text(
                      '浅色模式',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                      ),
                    ),
                    Icon(
                      Icons.keyboard_arrow_right,
                      color: Colors.black,
                      size: 20,
                    ),
                  ],
                ),
              ),
            ),
            //////
            // 间隔
            //////
            SizedBox(
              height: 10,
            ),
            //////
            // 封面广告
            //////
            Container(
              width: double.infinity,
              height: 50,
              // color: Color(0xFFFFEB3B),
              child: TextButton(
                onPressed: () {},
                child: Row(
                  // 主轴间隔显示
                  mainAxisAlignment: MainAxisAlignment.center,
                  // 辅轴居中显示
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // 左边组件
                    Text(
                      '封面广告',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                      ),
                    ),
                    // 中间组件
                    Spacer(),
                    // 右边组件
                    Icon(
                      Icons.keyboard_arrow_right,
                      color: Colors.black,
                      size: 20,
                    ),
                  ],
                ),
              ),
            ),

            //////
            // 间隔
            //////
            SizedBox(
              height: 10,
            ),
            //////
            // 版本更新
            //////
            Container(
              width: double.infinity,
              height: 50,
              // color: Color(0xFFFFEB3B),
              child: TextButton(
                onPressed: () {},
                child: Row(
                  // 主轴间隔显示
                  mainAxisAlignment: MainAxisAlignment.center,
                  // 辅轴居中显示
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // 左边组件
                    Text(
                      '版本更新',
                      style: TextStyle(
                        // color: Colors.black,
                        fontSize: 14,
                      ),
                    ),
                    // 中间组件
                    Spacer(),
                    // 右边组件
                    Text(
                      '1.0.0',
                      style: TextStyle(
                        // color: Colors.black,
                        fontSize: 12,
                      ),
                    ),
                    Icon(
                      Icons.keyboard_arrow_right,
                      // color: Colors.black,
                      size: 20,
                    ),
                  ],
                ),
              ),
            ),
            //////
            // 间隔
            //////
            SizedBox(
              height: 1,
            ),
            //////
            // 意见反馈
            //////
            Container(
              // padding: EdgeInsets.symmetric(horizontal: 15),
              width: double.infinity,
              height: 50,
              // color: Color(0xFFFFEB3B),
              child: TextButton(
                onPressed: () {
                  Get.toNamed("/feedback");
                },
                child: Row(
                  // 主轴间隔显示
                  mainAxisAlignment: MainAxisAlignment.center,
                  // 辅轴居中显示
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // 左边组件
                    Text(
                      '意见反馈',
                      style: TextStyle(
                    
                        fontSize: 14,
                      ),
                    ),
                    // 中间组件
                    Spacer(),
                    // 右边组件
                    Icon(
                      Icons.keyboard_arrow_right,
              
                      size: 20,
                    ),
                  ],
                ),
              ),
            ),

            //////
            // 间隔
            //////
            SizedBox(
              height: 10,
            ),
            //////
            // 退出登录
            //////
            Container(
              width: double.infinity,
              height: 50,
              child: TextButton(
                onPressed: () {},
                child: Text(
                  '退出登录',
                  // style: TextStyle(
                  // color: Colors.red,
                  // fontSize: 14,
                  // ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
