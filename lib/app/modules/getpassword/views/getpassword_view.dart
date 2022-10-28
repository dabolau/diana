import 'package:diana/app/common/themes.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/getpassword_controller.dart';

class GetpasswordView extends GetView<GetpasswordController> {
  /// 表单全局秘钥
  final formKey = GlobalKey<FormState>();

  /// 邮箱
  String email = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 防止键盘覆盖内容
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('找回密码'),
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
              // 邮箱输入框
              //////
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                color: Colors.white,
                child: TextFormField(
                  // 表单文本框初始值
                  // initialValue: "hello1@qq.com",
                  decoration: InputDecoration(
                    hintText: '请输入邮箱',
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
                    // return value!.trim().length > 6 ? null : '请输入有效的邮箱';
                    return GetUtils.isEmail(value!.trim()) ? null : '请输入有效的邮箱';
                  },
                  // 需要调用formKey.currentState!.save();才能生效
                  onSaved: (value) {
                    email = value!;
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
              /// 找回密码按钮
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
                      controller.email.value = email;
                      // 提交数据到服务器
                      controller.getpassword();
                      // 更新界面
                      controller.update();
                    }
                  },
                  child: Text(
                    '找回密码',
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
