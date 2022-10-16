import 'package:chewie/chewie.dart';
import 'package:diana/app/modules/play/providers/video_provider.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class PlayController extends GetxController {
  /// 播放器控制器
  VideoPlayerController? videoPlayerController;

  /// 播放器控制器
  ChewieController? chewieController;

  //////
  /// 获取视频信息
  //////
  void getVideo() async {
    /// 发送请求
    var video = await VideoProvider().getVideo("63399f858d53569f22dfa43b");
    print(video?.data?.id);
    print(video?.data?.name);
    print(video?.data?.picture);
    print(video?.data?.urls);
    // print(video?.data?.urls?[0].name);
    // print(video?.data?.urls?[0].url);

    /// 判断资源为空直接返回
    if (video?.data?.urls == null) {
      return;
    }

    /// 资源不为空循序出所有资源信息
    for (var url in (video?.data?.urls)!) {
      print(url.name);
      print(url.url);
    }
  }

  @override
  void onInit() {
    super.onInit();

    /// 初始化控制器
    videoPlayerController = VideoPlayerController.network(
        'https://wolongzywcdn3.com:65/eyQ9nWRE/index.m3u8');

    /// 初始化控制器
    chewieController = ChewieController(
      videoPlayerController: videoPlayerController!,
      // 比例
      aspectRatio: 16 / 9,
      // 自动播放
      // autoPlay: true,
      // 循环
      looping: true,
    );
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    /// 销毁控制器
    videoPlayerController?.dispose();

    /// 销毁控制器
    chewieController?.dispose();
  }
}
