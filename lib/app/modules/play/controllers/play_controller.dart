import 'package:chewie/chewie.dart';
import 'package:diana/app/modules/play/providers/video_provider.dart';
import 'package:diana/app/modules/play/video_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';
import 'package:wakelock/wakelock.dart';

class PlayController extends GetxController {
  /// 播放器控制器
  VideoPlayerController? videoPlayerController;

  /// 播放器控制器
  ChewieController? chewieController;

  /// 视频信息
  dynamic videoArguments;

  /// 视频名称
  var name = ''.obs;

  /// 视频地址
  var url = ''.obs;

  /// 显示广告
  var showAds = true.obs;

  /// 播放视频
  void playVideo() async {
    /// 销毁控制器
    videoPlayerController?.dispose();

    /// 销毁控制器
    chewieController?.dispose();

    /// 获取视频集数和视频地址
    print("########");
    print("### ${name} ${url}");
    print("########");

    /// 初始化控制器
    videoPlayerController = VideoPlayerController.network(url.value);

    /// 初始化控制器
    chewieController = ChewieController(
      videoPlayerController: videoPlayerController!,
      // 比例
      aspectRatio: 16 / 9,
      // 自动播放
      autoPlay: true,
      // 循环
      looping: true,
    );

    /// 保持屏幕不息屏
    Wakelock.enable();
    bool wakelockEnabled = await Wakelock.enabled;
    print('屏幕常亮 ${wakelockEnabled}');
  }

  // //////
  // /// 获取视频信息
  // //////
  // void getVideo(String id) async {
  //   /// 发送请求
  //   var video = await VideoProvider().getVideo(id);
  //   print(video?.data?.id);
  //   print(video?.data?.name);
  //   print(video?.data?.picture);
  //   print(video?.data?.urls);
  //   // print(video?.data?.urls?[0].name);
  //   // print(video?.data?.urls?[0].url);

  //   /// 判断资源为空直接返回
  //   if (video?.data?.urls == null) {
  //     return;
  //   }

  //   /// 资源不为空循序出所有资源信息
  //   for (var url in (video?.data?.urls)!) {
  //     print(url.name);
  //     print(url.url);
  //   }
  // }

  @override
  void onInit() async {
    super.onInit();

    /// 初始化控制器
    videoPlayerController = VideoPlayerController.network(url.value);

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

    /// 获取页面传递的视频数据
    videoArguments = Get.arguments;
    print(videoArguments);
    print("########");
    print("### 共有 ${videoArguments["URLs"].length} 集");
    print("########");

    /// 判断数据是否为空
    if (videoArguments != null) {
      /// 当数据不为空时
      print('不为空');

      /// 赋值
      name.value = videoArguments['URLs'][0]['Name'];
      url.value = videoArguments['URLs'][0]['URL'];

      /// 关闭广告
      showAds.value = false;

      /// 播放视频
      playVideo();
    }

    print('初始化就绪');
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
