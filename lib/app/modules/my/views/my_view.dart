import 'package:diana/app/common/themes.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/my_controller.dart';

class MyView extends GetView<MyController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MyView'),
        centerTitle: true,
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
      body: Center(
        child: Text(
          'MyView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
