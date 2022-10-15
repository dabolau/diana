import 'package:diana/app/common/constant.dart';
import 'package:get/get.dart';

import '../register_model.dart';

class RegisterProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return Register.fromJson(map);
      if (map is List)
        return map.map((item) => Register.fromJson(item)).toList();
    };
    httpClient.baseUrl = 'YOUR-API-URL';
  }

  /// 账号注册
  Future<Register?> postRegister(Map<String, dynamic> registerBody) async {
    /// 发送请求
    final response = await post(
        'http://${dianaServerAddress}/account/register', registerBody);
    print(response.body);

    /// 网络数据转换为模型
    Register register = Register.fromJson(response.body);
    return register;
  }
}
