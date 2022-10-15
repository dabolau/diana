import 'package:diana/app/common/datetimes.dart';

import 'package:diana/app/modules/feedback/providers/feedback_provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FeedbackController extends GetxController {
  /// 反馈名称
  var name = ''.obs;

  /// 反馈描述
  var description = ''.obs;

  /// 反馈邮箱
  var email = ''.obs;

  /// 获取反馈信息
  void getFeedback() async {
    /// 发送请求
    var feedback =
        await FeedbackProvider().getFeedback('633d7878519e180f23751a28');
    print('*1');
    print(feedback?.data?.name);
    print(feedback?.data?.description);
    print(feedback?.data?.email);
    print('*1');
  }

  /// 添加反馈信息
  void postFeedback() async {
    /// 获取当前时间
    name.value = dbGetYearMonthDayHourMinuteSecond();
    print("#1");
    print(name.value);
    print(description.value);
    print(email.value);
    print("#2");

    /// 定义数据模型
    Map<String, dynamic> feedbackBody = {
      "name": name.value,
      "description": description.value,
      "email": email.value,
    };

    /// 发送请求
    try {
      var feedback = await FeedbackProvider().postFeedback(feedbackBody);
      if (feedback?.statusCode == 200) {
        /// 提交成功
        Get.snackbar(
          "提示信息",
          "提交成功",
          margin: EdgeInsets.only(
            left: 10,
            top: 10,
            right: 10,
            bottom: 0,
          ),
        );
      } else {
        /// 提交失败
        Get.snackbar(
          "提示信息",
          "提交失败",
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

    print(name.value);
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
