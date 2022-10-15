import 'package:diana/app/modules/login/providers/login_provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  /// 用户名
  var username = ''.obs;

  /// 密码
  var password = ''.obs;

  /// 账号登录
  void login() async {
    print("用户名 ${username.value}");
    print("密码 ${password.value}");

    /// 定义数据模型
    Map<String, dynamic> loginBody = {
      "username": username.value,
      "password": password.value,
    };

    /// 发送请求
    try {
      var login = await LoginProvider().postLogin(loginBody);
      if (login?.statusCode == 200) {
        /// 登录成功
        Get.snackbar(
          "提示信息",
          "登录成功",
          margin: EdgeInsets.only(
            left: 10,
            top: 10,
            right: 10,
            bottom: 0,
          ),
        );
      } else {
        /// 登录失败
        Get.snackbar(
          "提示信息",
          "登录失败",
          margin: EdgeInsets.only(
            left: 10,
            top: 10,
            right: 10,
            bottom: 0,
          ),
        );
      }
    } catch (e) {
      print(e);

      /// 网络错误
      Get.snackbar(
        "提示信息",
        "网络错误",
        margin: EdgeInsets.only(
          left: 10,
          top: 10,
          right: 10,
          bottom: 0,
        ),
      );
    }
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
