import 'package:flutter/material.dart';

import 'package:get/get.dart';

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
          // 获取视频信息
          controller.getVideo();
        },
        child: Icon(Icons.add),
        elevation: 0,
      ),
      body: Center(
        child: Text(
          'PlayView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
