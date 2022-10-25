import 'package:diana/app/modules/search/providers/videos_provider.dart';
import 'package:diana/app/modules/search/videos_model.dart';
import 'package:get/get.dart';

class SearchController extends GetxController {
  /// 搜索内容
  var text = ''.obs;

  /// 视频模型
  Videos? videos;

  //////
  /// 搜索内容
  //////
  void search() async {
    /// 搜索内容
    print('搜索内容 ${text.value}');

    /// 发送请求
    videos = await VideosProvider().getVideos(text.value);

    /// 判断数据为空直接返回
    if (videos?.datas == null) {
      /// 更新界面
      update();
      return;
    }

    /// 搜索到的数据
    print('搜索到 ${videos?.datas?.length} 条数据');
    for (var video in (videos?.datas)!) {
      print(video.name);
    }

    /// 更新界面
    update();
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
