import 'package:diana/app/common/datetimes.dart';

import 'package:diana/app/modules/feedback/providers/feedback_provider.dart';
import 'package:get/get.dart';

class FeedbackController extends GetxController {
  // 定义变量
  var name = ''.obs;
  var description = ''.obs;
  var email = ''.obs;

  // 获取数据
  void getFeedback() async {
    // 发送请求
    var feedback =
        await FeedbackProvider().getFeedback('633d7878519e180f23751a28');
    print('*1');
    print(feedback?.data?.name);
    print(feedback?.data?.description);
    print(feedback?.data?.email);
    print('*1');
  }

// 添加数据
  void postFeedback() async {
    // 获取当前时间
    name.value = dbGetYearMonthDayHourMinuteSecond();

    print("#1");
    print(name.value);
    print(description.value);
    print(email.value);
    print("#2");
    // 定义数据模型
    Map<String, dynamic> feedbackBody = {
      "name": name.value,
      "description": description.value,
      "email": email.value,
    };
    // 发送请求
    try {
      var feedback = await FeedbackProvider().postFeedback(feedbackBody);
      if (feedback?.statusCode == 200) {
        Get.snackbar("提示信息", "提交成功");
      } else {
        Get.snackbar("提示信息", "提交失败");
      }
    } catch (e) {
      print(e);
      Get.snackbar("提示信息", "网络错误");
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
