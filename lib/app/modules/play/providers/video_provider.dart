import 'package:diana/app/common/constant.dart';
import 'package:get/get.dart';

import '../video_model.dart';

class VideoProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return Video.fromJson(map);
      if (map is List) return map.map((item) => Video.fromJson(item)).toList();
    };
    httpClient.baseUrl = 'YOUR-API-URL';
  }

  //////
  /// 获取视频信息
  //////
  Future<Video?> getVideo(String id) async {
    // 发送请求
    final response =
        await get('http://${dianaServerAddress}/video/detail/?id=${id}');
    print(response.body);
    // 网络数据转换为模型
    Video video = Video.fromJson(response.body);
    return video;
  }

  //////
  /// 添加视频信息
  //////
  Future<Response<Video>> postVideo(Video video) async =>
      await post('video', video);

  //////
  /// 删除视频信息
  //////
  Future<Response> deleteVideo(int id) async => await delete('video/$id');
}
