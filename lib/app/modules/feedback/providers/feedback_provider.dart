import 'package:diana/app/common/constant.dart';
import 'package:get/get.dart';

import '../feedback_model.dart';

class FeedbackProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return Feedback.fromJson(map);
      if (map is List)
        return map.map((item) => Feedback.fromJson(item)).toList();
    };
    httpClient.baseUrl = 'YOUR-API-URL';
  }

  /// 添加反馈信息
  Future<Feedback?> postFeedback(Map<String, dynamic> feedbackBody) async {
    /// 发送请求
    final response =
        await post('http://${dianaServerAddress}/feedback/add', feedbackBody);
    print(response.body);

    /// 网络数据转换为模型
    Feedback feedback = Feedback.fromJson(response.body);
    return feedback;
  }
}
