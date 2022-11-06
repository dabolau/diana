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
  /// 获取视频信息
  //////
  Future<Videos?> getVideos({
    String text = '',
    String category = '',
    String type = '',
    String area = '',
    String language = '',
    String year = '',
    String size = '3',
    String page = '1',
  }) async {
    // 发送请求
    final response = await get(
        'http://${dianaServerAddress}/video/?text=${text}&category=${category}&type=${type}&area=${area}&language=${language}&year=${year}&size=${size}&page=${page}');
    print(response.body);
    // 网络数据转换为模型
    Videos videos = Videos.fromJson(response.body);
    return videos;
  }
}
