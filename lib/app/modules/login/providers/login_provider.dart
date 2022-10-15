import 'package:diana/app/common/constant.dart';
import 'package:get/get.dart';

import '../login_model.dart';

class LoginProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return Login.fromJson(map);
      if (map is List) return map.map((item) => Login.fromJson(item)).toList();
    };
    httpClient.baseUrl = 'YOUR-API-URL';
  }

  /// 账号登录
  Future<Login?> postLogin(Map<String, dynamic> loginBody) async {
    /// 发送请求
    final response =
        await post('http://${dianaServerAddress}/account/login', loginBody);
    print(response.body);

    /// 网络数据转换为模型
    Login login = Login.fromJson(response.body);
    return login;
  }
}
