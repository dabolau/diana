import 'package:diana/app/modules/play/providers/video_provider.dart';
import 'package:get/get.dart';

class PlayController extends GetxController {
  //////
  /// 获取视频信息
  //////
  void getVideo() async {
    // 发送请求
    var video = await VideoProvider().getVideo("63399f858d53569f22dfa43b");
    print("*1");
    print(video?.data?.id);
    print(video?.data?.name);
    print(video?.data?.picture);
    print(video?.data?.urls);
    // print(video?.data?.urls?[0].name);
    // print(video?.data?.urls?[0].url);

    // 判断资源为空直接返回
    if (video?.data?.urls == null) {
      return;
    }
    // 资源不为空循序出所有资源信息
    for (var url in (video?.data?.urls)!) {
      print(url.name);
      print(url.url);
    }

    print("*1");
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
