import 'package:diana/app/common/constant.dart';
import 'package:get/get.dart';

import '../videos_model.dart';

class VideosProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return Videos.fromJson(map);
      if (map is List) return map.map((item) => Videos.fromJson(item)).toList();
    };
    httpClient.baseUrl = 'YOUR-API-URL';
  }

  //////
  /// 获取电影信息
  //////
  Future<Videos?> getVideos(
      String text, String category, String year) async {
    // 发送请求
    final response = await get(
        'http://${dianaServerAddress}/video/?text=${text}&category=${category}&year=${year}&size=9&page=1');
    print(response.body);
    // 网络数据转换为模型
    Videos videos = Videos.fromJson(response.body);
    return videos;
  }

}
