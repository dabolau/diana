import 'package:get/get.dart';

import '../version_model.dart';

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
}
