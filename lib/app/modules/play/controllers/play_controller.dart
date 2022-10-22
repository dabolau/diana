import 'package:chewie/chewie.dart';
import 'package:diana/app/modules/play/providers/video_provider.dart';
import 'package:diana/app/modules/play/video_model.dart';
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
  void getVideo(String id) async {
    /// 发送请求
    var video = await VideoProvider().getVideo(id);
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
  void onInit() async {
    super.onInit();

    var arguments = Get.arguments;
    print(arguments);
    if (arguments == null) {
      print('空的');

      /// 初始化控制器
      videoPlayerController = VideoPlayerController.network(
          '');

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
    } else {
      print(arguments['ID']);
      print(arguments['Name']);
      for (var url in arguments['URLs']) {
        print(url['Name']);
        print(url['URL']);
      }

      /// 初始化控制器
      videoPlayerController = VideoPlayerController.network(
          arguments['URLs'][0]['URL']);

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

    print('初始化就绪');

    // /// 初始化控制器
    // videoPlayerController = VideoPlayerController.network(
    //     'https://wolongzywcdn3.com:65/eyQ9nWRE/index.m3u8');

    // /// 初始化控制器
    // chewieController = ChewieController(
    //   videoPlayerController: videoPlayerController!,
    //   // 比例
    //   aspectRatio: 16 / 9,
    //   // 自动播放
    //   // autoPlay: true,
    //   // 循环
    //   looping: true,
    // );
  }

  @override
  void onReady() {
    super.onReady();
    print('准备就绪');
  }

  @override
  void onClose() {
    /// 销毁控制器
    videoPlayerController?.dispose();

    /// 销毁控制器
    chewieController?.dispose();
  }
}
