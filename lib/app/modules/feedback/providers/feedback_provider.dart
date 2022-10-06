import 'package:diana/app/modules/feedback/controllers/feedback_controller.dart';
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

  // 获取数据
  Future<Feedback?> getFeedback(String id) async {
    // 发送请求
    final response = await get(
        'http://localhost:8081/feedback/detail/?id=633d7878519e180f23751a28');
    // 响应数据转换为模型
    Feedback feedback = Feedback.fromJson(response.body);
    return feedback;
  }

  // 添加数据
  Future<Feedback?> postFeedback(Map<String, dynamic> feedbackBody) async {
    // 发送请求
    final response =
        await post('http://localhost:8081/feedback/add', feedbackBody);
    print(response.body);
    // 响应数据转换为模型
    Feedback feedback = Feedback.fromJson(response.body);
    return feedback;
  }

  Future<Response> deleteFeedback(int id) async => await delete('feedback/$id');
}
