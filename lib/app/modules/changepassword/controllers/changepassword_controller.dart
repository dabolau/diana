import 'package:diana/app/modules/changepassword/providers/changepassword_provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChangepasswordController extends GetxController {
  /// 用户名
  var username = ''.obs;

  /// 密码
  var password = ''.obs;

  /// 新的密码
  var newPassword = ''.obs;

  /// 确认密码
  var confirmPassword = ''.obs;

  /// 修改密码
  void register() async {
    print("用户名 ${username.value}");
    print("密码 ${password.value}");
    print("新的密码 ${newPassword.value}");
    print("确认密码 ${confirmPassword.value}");

    /// 定义数据模型
    Map<String, dynamic> changepasswordBody = {
      "username": username.value,
      "password": password.value,
      "newpassword": newPassword.value,
      "confirmpassword": confirmPassword.value,
    };

    /// 发送请求
    try {
      var changepassword =
          await ChangepasswordProvider().postChangepassword(changepasswordBody);
      if (changepassword?.statusCode == 200) {
        /// 修改成功
        Get.snackbar(
          "提示信息",
          "修改成功",
          margin: EdgeInsets.only(
            left: 10,
            top: 10,
            right: 10,
            bottom: 0,
          ),
        );
      } else {
        /// 修改失败
        Get.snackbar(
          "提示信息",
          "修改失败",
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
