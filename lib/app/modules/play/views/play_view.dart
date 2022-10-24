import 'package:chewie/chewie.dart';
import 'package:diana/app/common/themes.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

import '../controllers/play_controller.dart';

class PlayView extends GetView<PlayController> {
  /// 标签控制器
  // TabController? tabController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('播放器'),
        centerTitle: true,
        elevation: 0,
      ),

      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     /// 获取视频信息
      //     controller.getVideo('63399f858d53569f22dfa43b');
      //   },
      //   child: Icon(Icons.add),
      //   elevation: 0,
      // ),

      body: GetBuilder<PlayController>(
        init: PlayController(),
        builder: (controller) {
          return Container(
            // margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
            child: Column(
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

                    /// 返回按钮
                    Positioned(
                      left: 0,
                      top: 0,
                      // right: 0,
                      // bottom: 0,
                      child: IconButton(
                        onPressed: (() {
                          /// 返回
                          Get.back();
                        }),
                        icon: Icon(
                          Icons.keyboard_arrow_left,
                          color: Colors.white,
                          size: 35,
                        ),
                      ),
                    ),
                  ]),
                ),

                //////
                /// 标签信息，剧集，简介
                //////
                DefaultTabController(
                  length: 2,
                  child: Column(
                    children: [
                      //////
                      /// 标签选项
                      //////
                      Container(
                        // color: Colors.red,
                        height: 60,
                        child: TabBar(
                          // 允许滑动
                          isScrollable: true,
                          // 标签颜色
                          labelColor: Get.isDarkMode
                              ? Color(0xFFE6E1E5)
                              : Color(0xFF000000),
                          // 覆盖颜色
                          overlayColor: MaterialStateProperty.all(Get.isDarkMode
                              ? darkBackgroundColor
                              : lightBackgroundColor),
                          // 标签滑块
                          indicatorColor: Get.isDarkMode
                              ? lightPrimaryColor
                              : lightPrimaryColor, // 颜色
                          indicatorWeight: 2, // 高度
                          indicatorSize: TabBarIndicatorSize.label, // 长度
                          tabs: [
                            Tab(
                              text: '剧集',
                            ),
                            Tab(
                              text: '简介',
                            ),
                          ],
                        ),
                      ),

                      //////
                      /// 标签内容
                      //////
                      Container(
                        // color: Colors.yellow,
                        // 标签内容高度=屏幕高度-状态栏高度-应用程序栏高度-播放器高度-标签高度
                        height: MediaQuery.of(context).size.height -
                            MediaQuery.of(context).padding.top -
                            56 -
                            (MediaQuery.of(context).size.width / 16 * 9) -
                            60,
                        child: TabBarView(
                          children: [
                            //////
                            /// 剧集内容
                            //////
                            Container(
                              child: ListView(
                                shrinkWrap:true,
                                physics:NeverScrollableScrollPhysics(),
                                children: [
                                  //////
                                  /// 选集导航栏
                                  //////
                                  Container(
                                    margin: EdgeInsets.only(
                                      left: 10,
                                      top: 10,
                                      right: 10,
                                      bottom: 10,
                                    ),
                                    // color: Colors.red,
                                    child: Row(
                                      children: [
                                        Text('选集'),
                                        Spacer(),
                                        IconButton(
                                          onPressed: (() {}),
                                          icon:
                                              Icon(Icons.keyboard_arrow_right),
                                        ),
                                        // Icon(Icons.keyboard_arrow_right),
                                      ],
                                    ),
                                  ),
                                  //////
                                  /// 选集按钮
                                  //////
                                  Container(
                                    margin: EdgeInsets.only(
                                      left: 10,
                                      top: 0,
                                      right: 10,
                                      bottom: 10,
                                    ),
                                    // color: Colors.black,
                                    height: 40,
                                    child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount: controller
                                          .videoArguments["URLs"].length,
                                      itemBuilder: ((context, index) {
                                        return Container(
                                          // 第一个项目不添加左侧外边距
                                          margin: index == 0
                                              ? EdgeInsets.only(left: 0)
                                              : EdgeInsets.only(left: 10),
                                          child: TextButton(
                                            onPressed: () {
                                              /// 赋值给控制器
                                              controller.name.value = controller
                                                      .videoArguments["URLs"]
                                                  [index]["Name"];
                                              controller.url.value = controller
                                                      .videoArguments["URLs"]
                                                  [index]["URL"];

                                              /// 播放视频
                                              controller.playVideo();

                                              /// 更新界面
                                              controller.update();
                                            },
                                            child: Text(
                                                '${controller.videoArguments["URLs"][index]["Name"]}'),
                                            style: ButtonStyle(
                                              // 形状
                                              shape: MaterialStateProperty.all(
                                                RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(3),
                                                ),
                                              ),
                                              // 前景颜色
                                              foregroundColor:
                                                  MaterialStateProperty.all(
                                                Get.isDarkMode
                                                    ? Color(0xFFE6E1E5)
                                                    : Color(0xFF000000),
                                              ),
                                              // 背景颜色
                                              backgroundColor:
                                                  MaterialStateProperty.all(
                                                Get.isDarkMode
                                                    ? Color(0xFF1C1B20)
                                                    : Color(0xFFFFFFFF),
                                              ),
                                              // 覆盖颜色
                                              overlayColor:
                                                  MaterialStateProperty.all(
                                                Get.isDarkMode
                                                    ? Color(0xFF1C1B20)
                                                    : Color(0xFFFFFFFF),
                                              ),
                                            ),
                                          ),
                                        );
                                      }),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            //////
                            /// 简介内容
                            //////
                            Container(
                              child: ListView(
                                shrinkWrap:true,
                                physics:NeverScrollableScrollPhysics(),
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(
                                      left: 10,
                                      top: 10,
                                      right: 10,
                                      bottom: 10,
                                    ),
                                    child: Text(
                                        '片名：${controller.videoArguments["Name"]}'),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(
                                      left: 10,
                                      top: 0,
                                      right: 10,
                                      bottom: 10,
                                    ),
                                    child: Text(
                                        '简介：${controller.videoArguments["Description"]}'),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(
                                      left: 10,
                                      top: 0,
                                      right: 10,
                                      bottom: 10,
                                    ),
                                    child: Text(
                                        '导演：${controller.videoArguments["Director"]}'),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(
                                      left: 10,
                                      top: 0,
                                      right: 10,
                                      bottom: 10,
                                    ),
                                    child: Text(
                                        '演员：${controller.videoArguments["Actor"]}'),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(
                                      left: 10,
                                      top: 0,
                                      right: 10,
                                      bottom: 10,
                                    ),
                                    child: Text(
                                        '类别：${controller.videoArguments["Category"]}'),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(
                                      left: 10,
                                      top: 0,
                                      right: 10,
                                      bottom: 10,
                                    ),
                                    child: Text(
                                        '类型：${controller.videoArguments["Type"]}'),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(
                                      left: 10,
                                      top: 0,
                                      right: 10,
                                      bottom: 10,
                                    ),
                                    child: Text(
                                        '地区：${controller.videoArguments["Area"]}'),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(
                                      left: 10,
                                      top: 0,
                                      right: 10,
                                      bottom: 10,
                                    ),
                                    child: Text(
                                        '语言：${controller.videoArguments["Language"]}'),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(
                                      left: 10,
                                      top: 0,
                                      right: 10,
                                      bottom: 10,
                                    ),
                                    child: Text(
                                        '年份：${controller.videoArguments["Year"]}'),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(
                                      left: 10,
                                      top: 0,
                                      right: 10,
                                      bottom: 10,
                                    ),
                                    child: Text(
                                        '评分：${controller.videoArguments["Score"]}'),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(
                                      left: 10,
                                      top: 0,
                                      right: 10,
                                      bottom: 10,
                                    ),
                                    child: Text(
                                        '状态：${controller.videoArguments["Status"]}'),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
