import 'package:diana/app/common/themes.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  /// 表单全局秘钥
  final formKey = GlobalKey<FormState>();

  /// 用户名
  String username = '';

  /// 密码
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 防止键盘覆盖内容
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('appbars_login'.tr),
        centerTitle: true,
        elevation: 0,
      ),
      body: Container(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              //////
              // 间隔
              //////
              SizedBox(
                height: 10,
              ),
              //////
              // 用户名输入框
              //////
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                color: Colors.white,
                child: TextFormField(
                  // 表单文本框初始值
                  // initialValue: "hello1",
                  decoration: InputDecoration(
                    hintText: '请输入用户名',
                    border: InputBorder.none,
                  ),
                  style: TextStyle(
                    // color: lightTextPrimaryColor,
                    color: Get.isDarkMode
                        ? darkTextPrimaryColor
                        : lightTextPrimaryColor,
                  ),
                  // 验证数据
                  validator: (value) {
                    // return value!.trim().length > 6 ? null : '请输入有效的用户名';
                    return (GetUtils.isUsername(value!.trim()) &&
                            value.trim().length > 5)
                        ? null
                        : '请输入有效的用户名';
                  },
                  // 需要调用formKey.currentState!.save();才能生效
                  onSaved: (value) {
                    username = value!;
                  },
                ),
              ),
              //////
              // 间隔
              //////
              SizedBox(
                height: 10,
              ),
              //////
              // 密码输入框
              //////
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                color: Colors.white,
                child: TextFormField(
                  // 表单文本框初始值
                  // initialValue: "123456",
                  decoration: InputDecoration(
                    hintText: '请输入密码',
                    border: InputBorder.none,
                  ),
                  style: TextStyle(
                    // color: lightTextPrimaryColor,
                    color: Get.isDarkMode
                        ? darkTextPrimaryColor
                        : lightTextPrimaryColor,
                  ),
                  // 验证数据
                  validator: (value) {
                    // return value!.trim().length > 6 ? null : '请输入有效的密码';
                    return (GetUtils.isUsername(value!.trim()) &&
                            value.trim().length > 5)
                        ? null
                        : '请输入有效的密码';
                  },
                  // 需要调用formKey.currentState!.save();才能生效
                  onSaved: (value) {
                    password = value!;
                  },
                ),
              ),
              //////
              // 间隔
              //////
              SizedBox(
                height: 10,
              ),
              // Spacer(),
              //////
              // 登录按钮
              //////
              Container(
                width: double.infinity,
                height: 44,
                // color: Color(0xFFFFEB3B),
                child: TextButton(
                  onPressed: () {
                    print(formKey.currentState!.validate());
                    // 通过验证后提交数据
                    if (formKey.currentState!.validate()) {
                      // 保存表单数据
                      formKey.currentState!.save();
                      // 获取表单中的值并赋给控制器
                      controller.username.value = username;
                      controller.password.value = password;
                      // 提交数据到服务器
                      controller.login();
                      // 更新界面
                      controller.update();
                    }
                  },
                  child: Text(
                    'buttons_login'.tr,
                    style: TextStyle(
                      color: Get.isDarkMode
                          ? darkTextPrimaryColor
                          : lightTextPrimaryColor,
                      // fontSize: 12,
                    ),
                  ),
                  style: ButtonStyle(
                    // 按钮形状
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0),
                      ),
                    ),
                    // 背景颜色
                    backgroundColor: MaterialStateProperty.all(
                      Get.isDarkMode ? lightPrimaryColor : lightPrimaryColor,
                    ),
                    // 覆盖颜色
                    overlayColor: MaterialStateProperty.all(
                      Get.isDarkMode ? lightPrimaryColor : lightPrimaryColor,
                    ),
                  ),
                ),
              ),
              //////
              // 间隔
              //////
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
