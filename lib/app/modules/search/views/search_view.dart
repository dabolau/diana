import 'package:diana/app/common/themes.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../controllers/search_controller.dart';

class SearchView extends GetView<SearchController> {
  /// 搜索控制器
  var textController = TextEditingController();

  /// 搜索内容
  String text = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 防止键盘覆盖内容
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: GetBuilder<SearchController>(
          init: SearchController(),
          builder: (controller) {
            return Container(
              padding: EdgeInsets.only(
                left: 0,
                top: 0,
                right: 0,
                bottom: 0,
              ),
              height: 40,
              decoration: BoxDecoration(
                color: Color(0xFFF4F4F4),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  //////
                  /// 间隔
                  //////
                  SizedBox(
                    width: 15,
                  ),

                  //////
                  // 搜索输入框
                  //////
                  Expanded(
                    child: Container(
                      height: 40,
                      child: TextField(
                        controller: textController,
                        maxLines: 1,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(0), // 控制输入框文本垂直居中
                          border: OutlineInputBorder(
                              borderSide: BorderSide.none), // 控制输入框文本垂直居中
                        ),
                        style: TextStyle(
                          // fontSize: 14,
                          textBaseline: TextBaseline.alphabetic, // 控制输入框文本垂直居中
                          color: Get.isDarkMode
                              ? darkTextPrimaryColor
                              : lightTextPrimaryColor,
                        ),
                        onChanged: (value) {
                          text = value;

                          /// 更新界面
                          controller.update();
                        },
                      ),
                    ),
                  ),

                  //////
                  /// 间隔
                  //////
                  SizedBox(
                    width: 10,
                  ),

                  //////
                  /// 清空按钮
                  //////
                  Offstage(
                    /// 当组件为true时隐藏，为false时显示
                    offstage: text.isEmpty ? true : false,
                    child: GestureDetector(
                      onTap: () {
                        /// 清空搜索内容
                        text = '';

                        /// 清空搜索控制器
                        textController.clear();

                        /// 更新界面
                        controller.update();
                      },
                      child: Container(
                        width: 20,
                        height: 20,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Icon(
                          Icons.close_outlined,
                          color: Colors.black,
                          size: 15,
                        ),
                      ),
                    ),
                  ),

                  //////
                  /// 间隔
                  //////
                  SizedBox(
                    width: 10,
                  ),

                  //////
                  /// 搜索按钮
                  //////
                  Container(
                    width: 70,
                    height: 34,
                    child: TextButton(
                      onPressed: () {
                        print('搜索');

                        if (text.isEmpty) {
                          print('输入框为空');
                        } else {
                          print('提交');
                          // 获取表单中的值并赋给控制器
                          controller.text.value = text;
                          // 获取数据
                          controller.getSearchVideos();
                        }
                      },
                      child: Text(
                        'buttons_search'.tr,
                        // style: TextStyle(fontSize: 14,),
                      ),
                      style: ButtonStyle(
                        // 清除内边距
                        minimumSize: MaterialStateProperty.all(Size.zero),
                        padding: MaterialStateProperty.all(EdgeInsets.zero),
                        // 形状
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                        ),
                        // 前景颜色
                        foregroundColor: MaterialStateProperty.all(
                          Color(0xFF000000),
                        ),
                        // 背景颜色
                        backgroundColor: MaterialStateProperty.all(
                          Color(0xFFFFEB3B),
                        ),
                        // 覆盖颜色
                        overlayColor: MaterialStateProperty.all(
                          Color(0xFFFFEB3B),
                        ),
                      ),
                    ),
                  ),

                  //////
                  /// 间隔
                  //////
                  SizedBox(
                    width: 3,
                  ),
                ],
              ),
            );
          },
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: GetBuilder<SearchController>(
        init: SearchController(),
        builder: (controller) {
          // return Text('${controller.videos?.datas?.length}');
          if (controller.videos?.datas?.length == null) {
            /// 当没有数据时
            return Container(
              child: Center(
                child: Text(
                  '在忙，也要记得看看视频放松下喔',
                ),
              ),
            );
          } else {
            /// 当有数据时
            return Container(
              /// 上拉加载下拉刷新
              child: SmartRefresher(
                enablePullUp: true, // 激活上拉
                enablePullDown: true, // 激活下拉
                controller: controller.refreshController, // 控制器
                onRefresh: controller.onRefresh, // 上拉刷新
                onLoading: controller.onLoading, // 下拉加载
                header: ClassicHeader(
                  // 上拉刷新显示样式
                  idleText: '下拉加载',
                  releaseText: '松开刷新',
                  refreshingText: '玩命刷新中',
                  completeText: '刷新成功',
                  failedText: '刷新失败',
                ),
                footer: ClassicFooter(
                  // 下拉加载显示样式
                  idleText: '上拉加载',
                  canLoadingText: '松开，加载更多',
                  loadingText: '玩命加载中',
                  noDataText: '没有更多数据了',
                  failedText: '加载失败',
                ),
                child: ListView.builder(
                  itemCount: controller.videos?.datas?.length,
                  itemBuilder: ((context, index) {
                    // return Text('${controller.videos?.datas?[index].name}');
                    return Container(
                      margin: EdgeInsets.only(
                          left: 10, top: 10, right: 10, bottom: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          /// 左边
                          Container(
                            width:
                                (MediaQuery.of(context).size.width / 16 * 9) /
                                    2,
                            height:
                                (MediaQuery.of(context).size.width / 16 * 16) /
                                    2,
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(8),
                              image: DecorationImage(
                                image: NetworkImage(
                                    '${controller.videos?.datas?[index].picture}'),
                                fit: BoxFit.cover,
                              ),
                            ),
                            // child: Center(child: Image.network('${controller.videos?.datas?[index].picture}')),
                          ),

                          //////
                          /// 间隔
                          //////
                          SizedBox(
                            width: 10,
                          ),

                          /// 右边
                          Expanded(
                            child: Container(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  /// 视频名称
                                  Text(
                                    '${controller.videos?.datas?[index].name}',
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style:
                                        TextStyle(fontWeight: FontWeight.w800),
                                  ),

                                  //////
                                  /// 间隔
                                  //////
                                  SizedBox(
                                    height: 10,
                                  ),

                                  /// 视频状态
                                  Text(
                                    '${controller.videos?.datas?[index].status}',
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),

                                  //////
                                  /// 间隔
                                  //////
                                  SizedBox(
                                    height: 10,
                                  ),

                                  /// 视频介绍
                                  Text(
                                    '${controller.videos?.datas?[index].description}',
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),

                                  //////
                                  /// 间隔
                                  //////
                                  SizedBox(
                                    height: 10,
                                  ),

                                  /// 播放按钮
                                  Container(
                                    width: 70,
                                    height: 34,
                                    child: TextButton(
                                      onPressed: () {
                                        /// 数据模型转换为JSON
                                        var videosJsonString =
                                            controller.videos?.toJson();
                                        // print(videosJsonString?['Datas'][index]);
                                        Get.toNamed(
                                          '/play',
                                          arguments: videosJsonString?['Datas']
                                              [index],
                                        );
                                      },
                                      child: Text(
                                        '播放',
                                        // style: TextStyle(fontSize: 14,),
                                      ),
                                      style: ButtonStyle(
                                        // 清除内边距
                                        minimumSize: MaterialStateProperty.all(
                                            Size.zero),
                                        padding: MaterialStateProperty.all(
                                            EdgeInsets.zero),
                                        // 形状
                                        shape: MaterialStateProperty.all(
                                          RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(25),
                                          ),
                                        ),
                                        // 前景颜色
                                        foregroundColor:
                                            MaterialStateProperty.all(
                                          Color(0xFF000000),
                                        ),
                                        // 背景颜色
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                          Color(0xFFFFEB3B),
                                        ),
                                        // 覆盖颜色
                                        overlayColor: MaterialStateProperty.all(
                                          Color(0xFFFFEB3B),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
