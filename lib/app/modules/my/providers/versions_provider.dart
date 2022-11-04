import 'package:diana/app/common/constant.dart';
import 'package:get/get.dart';

import '../versions_model.dart';

class VersionsProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return Versions.fromJson(map);
      if (map is List)
        return map.map((item) => Versions.fromJson(item)).toList();
    };
    httpClient.baseUrl = 'YOUR-API-URL';
  }

  /// 获取所有版本
  Future<Versions?> getVersions({
    String text = '',
    String size = '3',
    String page = '1',
  }) async {
    /// 发送请求
    final response = await get(
        'http://${dianaServerAddress}/version/?text=${text}&size=${size}&page=${page}');
    print(response.body);

    /// 网络数据转换为模型
    Versions versions = Versions.fromJson(response.body);
    return versions;
  }
}
