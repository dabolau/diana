import 'package:diana/app/common/constant.dart';
import 'package:get/get.dart';

import '../changepassword_model.dart';

class ChangepasswordProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return Changepassword.fromJson(map);
      if (map is List)
        return map.map((item) => Changepassword.fromJson(item)).toList();
    };
    httpClient.baseUrl = 'YOUR-API-URL';
  }

  /// 修改密码
  Future<Changepassword?> postChangepassword(
      Map<String, dynamic> changepasswordBody) async {
    /// 发送请求
    final response = await post(
        'http://${dianaServerAddress}/account/changepassword',
        changepasswordBody);
    print(response.body);

    /// 网络数据转换为模型
    Changepassword changepassword = Changepassword.fromJson(response.body);
    return changepassword;
  }
}
