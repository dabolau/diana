import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/account_controller.dart';

class AccountView extends GetView<AccountController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('账号信息'),
        centerTitle: true,
        elevation: 0,
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
            // 账号登录
            //////
            Container(
              width: double.infinity,
              height: 50,
              // color: Color(0xFFFFEB3B),
              child: TextButton(
                onPressed: () {
                  Get.toNamed("/login");
                  // Get.toNamed("/register");
                  // Get.toNamed("/changepassword");
                  // Get.toNamed("/getpassword");
                },
                child: Row(
                  // 主轴间隔显示
                  mainAxisAlignment: MainAxisAlignment.center,
                  // 辅轴居中显示
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // 左边组件
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      '账号登录',
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
              height: 1,
            ),
            //////
            // 账号注册
            //////
            Container(
              width: double.infinity,
              height: 50,
              // color: Color(0xFFFFEB3B),
              child: TextButton(
                onPressed: () {
                  Get.toNamed("/register");
                },
                child: Row(
                  // 主轴间隔显示
                  mainAxisAlignment: MainAxisAlignment.center,
                  // 辅轴居中显示
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // 左边组件
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      '账号注册',
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
              height: 1,
            ),
            //////
            // 修改密码
            //////
            Container(
              width: double.infinity,
              height: 50,
              // color: Color(0xFFFFEB3B),
              child: TextButton(
                onPressed: () {
                  Get.toNamed("/changepassword");
                },
                child: Row(
                  // 主轴间隔显示
                  mainAxisAlignment: MainAxisAlignment.center,
                  // 辅轴居中显示
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // 左边组件
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      '修改密码',
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
              height: 1,
            ),
            //////
            // 找回密码
            //////
            Container(
              width: double.infinity,
              height: 50,
              // color: Color(0xFFFFEB3B),
              child: TextButton(
                onPressed: () {
                  Get.toNamed("/getpassword");
                },
                child: Row(
                  // 主轴间隔显示
                  mainAxisAlignment: MainAxisAlignment.center,
                  // 辅轴居中显示
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // 左边组件
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      '找回密码',
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
              height: 1,
            ),
          ],
        ),
      ),
    );
  }
}
