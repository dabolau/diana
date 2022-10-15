import 'package:diana/app/modules/register/providers/register_provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  /// 用户名
  var username = ''.obs;

  /// 邮箱
  var email = ''.obs;

  /// 移动电话
  var phone = ''.obs;

  /// 密码
  var password = ''.obs;

  /// 账号注册
  void register() async {
    print("用户名 ${username.value}");
    print("邮箱 ${email.value}");
    print("移动电话 ${phone.value}");
    print("密码 ${password.value}");

    /// 定义数据模型
    Map<String, dynamic> loginBody = {
      "username": username.value,
      "email": email.value,
      "phone": phone.value,
      "password": password.value,
    };

    /// 发送请求
    try {
      var login = await RegisterProvider().postRegister(loginBody);
      if (login?.statusCode == 200) {
        /// 注册成功
        Get.snackbar(
          "提示信息",
          "注册成功",
          margin: EdgeInsets.only(
            left: 10,
            top: 10,
            right: 10,
            bottom: 0,
          ),
        );
      } else {
        /// 注册失败
        Get.snackbar(
          "提示信息",
          "注册失败",
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
