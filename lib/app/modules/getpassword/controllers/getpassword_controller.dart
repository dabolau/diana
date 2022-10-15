import 'package:diana/app/modules/getpassword/providers/getpassword_provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GetpasswordController extends GetxController {
  /// 邮箱
  var email = ''.obs;

  /// 找回密码
  void getpassword() async {
    print("邮箱 ${email.value}");

    /// 定义数据模型
    Map<String, dynamic> loginBody = {
      "email": email.value,
    };

    /// 发送请求
    try {
      var login = await GetpasswordProvider().postGetpassword(loginBody);
      if (login?.statusCode == 200) {
        /// 找回成功
        Get.snackbar(
          "提示信息",
          "找回成功，请在您的电子邮箱中查收用户名和密码",
          margin: EdgeInsets.only(
            left: 10,
            top: 10,
            right: 10,
            bottom: 0,
          ),
        );
      } else {
        /// 找回失败
        Get.snackbar(
          "提示信息",
          "找回失败",
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
