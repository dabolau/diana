import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

import '../controllers/play_controller.dart';

class PlayView extends GetView<PlayController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('播放器'),
        centerTitle: true,
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          /// 获取视频信息
          controller.getVideo('63399f858d53569f22dfa43b');
        },
        child: Icon(Icons.add),
        elevation: 0,
      ),
      body: Container(
        child: ListView(
          children: [
            //////
            /// 播放器
            //////
            Container(
              color: Colors.grey,

              /// 宽高比16:9
              width: MediaQuery.of(context).size.width / 16 * 16,
              height: MediaQuery.of(context).size.width / 16 * 9,
              child: Stack(children: [
                /// 播放器
                Positioned(
                  left: 0,
                  top: 0,
                  right: 0,
                  bottom: 0,
                  child: Chewie(controller: controller.chewieController!),
                ),

                // /// 广告
                // Positioned(
                //   left: 0,
                //   top: 0,
                //   right: 0,
                //   bottom: 0,
                //   child: Container(
                //     color: Colors.black,
                //     child: Text('广告'),
                //   ),
                // ),
              ]),
            ),

            //////
            /// 间隔
            //////
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
