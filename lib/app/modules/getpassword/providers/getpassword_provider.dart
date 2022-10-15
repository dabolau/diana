import 'package:diana/app/common/constant.dart';
import 'package:get/get.dart';

import '../getpassword_model.dart';

class GetpasswordProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return Getpassword.fromJson(map);
      if (map is List)
        return map.map((item) => Getpassword.fromJson(item)).toList();
    };
    httpClient.baseUrl = 'YOUR-API-URL';
  }

  /// 找回密码
  Future<Getpassword?> postGetpassword(
      Map<String, dynamic> getpasswordBody) async {
    /// 发送请求
    final response = await post(
        'http://${dianaServerAddress}/account/getpassword', getpasswordBody);
    print(response.body);

    /// 网络数据转换为模型
    Getpassword getpassword = Getpassword.fromJson(response.body);
    return getpassword;
  }
}
