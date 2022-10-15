import 'package:diana/app/common/constant.dart';
import 'package:get/get.dart';

import '../version_model.dart';

//////
/// 版本提供程序
//////
class VersionProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return Version.fromJson(map);
      if (map is List)
        return map.map((item) => Version.fromJson(item)).toList();
    };
    httpClient.baseUrl = 'YOUR-API-URL';
  }

  /// 获取所有版本
  Future<Version?> getAllVersion() async {
    /// 发送请求
    final response =
        await get('http://${dianaServerAddress}/version/?text=&size=1&page=1');
    print(response.body);

    /// 网络数据转换为模型
    Version version = Version.fromJson(response.body);
    return version;
  }
}
