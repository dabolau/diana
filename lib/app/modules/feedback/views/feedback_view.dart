import 'package:diana/app/common/themes.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/feedback_controller.dart';

class FeedbackView extends GetView<FeedbackController> {
  /// 表单全局秘钥
  final formKey = GlobalKey<FormState>();

  /// 反馈描述
  String description = '';

  /// 反馈邮箱
  String email = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('意见反馈'),
          centerTitle: true,
          elevation: 0,
        ),
        // floatingActionButton: FloatingActionButton(
        //   onPressed: () async {
        //     // 默认主题切换
        //     // Get.changeTheme(
        //     //     Get.isDarkMode ? ThemeData.light() : ThemeData.dark());
        //     // 自定义主图切换
        //     Get.changeTheme(Get.isDarkMode ? Themes.light : Themes.dark);
        //     // 获取数据
        //     // controller.getFeedback();
        //     // 添加数据
        //     // controller.postFeedback();
        //   },
        //   elevation: 0,
        //   child: Icon(Icons.add),
        // ),
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
                // 描述输入框
                //////
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  color: Colors.white,
                  child: TextFormField(
                    maxLines: 6,
                    maxLength: 200,
                    // 表单文本框初始值
                    initialValue: "1234567890",
                    decoration: InputDecoration(
                      hintText: '请输入您的意见或建议',
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
                      return value!.trim().length > 9 ? null : '请输入有效的意见或建议';
                    },
                    // 需要调用formKey.currentState!.save();才能生效
                    onSaved: (value) {
                      description = value!;
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
                // 邮箱输入框
                //////
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  color: Colors.white,
                  child: TextFormField(
                    // 表单文本框初始值
                    initialValue: "d@qq.com",
                    decoration: InputDecoration(
                      hintText: '请输入您的邮箱，我们会联系您',
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
                      return GetUtils.isEmail(value!.trim())
                          ? null
                          : '请输入有效的邮箱地址';
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
                // 界面刷新显示数据
                GetBuilder<FeedbackController>(
                  init: FeedbackController(),
                  builder: (controller) {
                    return Text('${controller.description}');
                  },
                ),
                //////
                // 提交按钮
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
                        controller.description.value = description;
                        controller.email.value = email;
                        // 提交数据到服务器
                        controller.postFeedback();
                        // 更新界面
                        controller.update();
                      }
                    },
                    child: Text(
                      '提交',
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
              ],
            ),
          ),
        ));
  }
}
