import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('appbars_home'.tr),
        centerTitle: true,
        elevation: 0,
      ),
      body: GetBuilder<HomeController>(
        init: HomeController(),
        builder: ((controller) {
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
              child: ListView(
                children: [
                  //////
                  // 电影推荐
                  //////
                  controller.movieVideos?.datas?.length == null
                      ? Container()
                      : Container(
                          // color: Colors.grey,
                          margin: EdgeInsets.only(
                            left: 10,
                            top: 10,
                            right: 0,
                            bottom: 0,
                          ),
                          child: Row(
                            children: [
                              Text('推荐电影'),
                              Spacer(),
                              IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.keyboard_arrow_right,
                                ),
                              ),
                            ],
                          ),
                        ),
                  controller.movieVideos?.datas?.length == null
                      ? Container()
                      : Container(
                          margin: EdgeInsets.only(
                            left: 10,
                            top: 10,
                            right: 10,
                            bottom: 10,
                          ),
                          child: GridView.builder(
                            // 加载所有组件
                            shrinkWrap: true,
                            // 禁止滑动
                            physics: NeverScrollableScrollPhysics(),
                            // 构建固定数量的组件
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              // 横轴元素
                              crossAxisCount: 3,
                              // 横轴间距
                              crossAxisSpacing: 10,
                              // 纵轴间距
                              mainAxisSpacing: 10,
                              // 组件宽高比率
                              childAspectRatio:
                                  (MediaQuery.of(context).size.width / 16 * 9) /
                                      (MediaQuery.of(context).size.width /
                                          16 *
                                          17),
                            ),
                            itemCount: controller.movieVideos?.datas?.length,
                            itemBuilder: ((context, index) {
                              return GestureDetector(
                                onTap: () {
                                  print(index);

                                  /// 数据模型转换为JSON
                                  var movieVideosJsonString =
                                      controller.movieVideos?.toJson();
                                  Get.toNamed(
                                    '/play',
                                    arguments: movieVideosJsonString?['Datas']
                                        [index],
                                  );
                                },
                                child: Container(
                                  // color: Colors.grey,
                                  child: Column(children: [
                                    Expanded(
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: Colors.grey,
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          image: DecorationImage(
                                            image: NetworkImage(
                                                '${controller.movieVideos?.datas?[index].picture}'),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      '${controller.movieVideos?.datas?[index].name}',
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ]),
                                ),
                              );
                            }),
                          ),
                        ),

                  //////
                  // 电视剧推荐
                  //////
                  controller.tvVideos?.datas?.length == null
                      ? Container()
                      : Container(
                          // color: Colors.grey,
                          margin: EdgeInsets.only(
                            left: 10,
                            top: 10,
                            right: 0,
                            bottom: 0,
                          ),
                          child: Row(
                            children: [
                              Text('推荐电视剧'),
                              Spacer(),
                              IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.keyboard_arrow_right,
                                ),
                              ),
                            ],
                          ),
                        ),
                  controller.tvVideos?.datas?.length == null
                      ? Container()
                      : Container(
                          margin: EdgeInsets.only(
                            left: 10,
                            top: 10,
                            right: 10,
                            bottom: 10,
                          ),
                          child: GridView.builder(
                            // 加载所有组件
                            shrinkWrap: true,
                            // 禁止滑动
                            physics: NeverScrollableScrollPhysics(),
                            // 构建固定数量的组件
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              // 横轴元素
                              crossAxisCount: 3,
                              // 横轴间距
                              crossAxisSpacing: 10,
                              // 纵轴间距
                              mainAxisSpacing: 10,
                              // 组件宽高比率
                              childAspectRatio:
                                  (MediaQuery.of(context).size.width / 16 * 9) /
                                      (MediaQuery.of(context).size.width /
                                          16 *
                                          17),
                            ),
                            itemCount: controller.tvVideos?.datas?.length,
                            itemBuilder: ((context, index) {
                              return GestureDetector(
                                onTap: () {
                                  print(index);

                                  /// 数据模型转换为JSON
                                  var tvVideosJsonString =
                                      controller.tvVideos?.toJson();
                                  Get.toNamed(
                                    '/play',
                                    arguments: tvVideosJsonString?['Datas']
                                        [index],
                                  );
                                },
                                child: Container(
                                  // color: Colors.grey,
                                  child: Column(children: [
                                    Expanded(
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: Colors.grey,
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          image: DecorationImage(
                                            image: NetworkImage(
                                                '${controller.tvVideos?.datas?[index].picture}'),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      '${controller.tvVideos?.datas?[index].name}',
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ]),
                                ),
                              );
                            }),
                          ),
                        ),

                  //////
                  // 动漫推荐
                  //////
                  controller.animeVideos?.datas?.length == null
                      ? Container()
                      : Container(
                          // color: Colors.grey,
                          margin: EdgeInsets.only(
                            left: 10,
                            top: 10,
                            right: 0,
                            bottom: 0,
                          ),
                          child: Row(
                            children: [
                              Text('推荐动漫'),
                              Spacer(),
                              IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.keyboard_arrow_right,
                                ),
                              ),
                            ],
                          ),
                        ),
                  controller.animeVideos?.datas?.length == null
                      ? Container()
                      : Container(
                          margin: EdgeInsets.only(
                            left: 10,
                            top: 10,
                            right: 10,
                            bottom: 10,
                          ),
                          child: GridView.builder(
                            // 加载所有组件
                            shrinkWrap: true,
                            // 禁止滑动
                            physics: NeverScrollableScrollPhysics(),
                            // 构建固定数量的组件
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              // 横轴元素
                              crossAxisCount: 3,
                              // 横轴间距
                              crossAxisSpacing: 10,
                              // 纵轴间距
                              mainAxisSpacing: 10,
                              // 组件宽高比率
                              childAspectRatio:
                                  (MediaQuery.of(context).size.width / 16 * 9) /
                                      (MediaQuery.of(context).size.width /
                                          16 *
                                          17),
                            ),
                            itemCount: controller.animeVideos?.datas?.length,
                            itemBuilder: ((context, index) {
                              return GestureDetector(
                                onTap: () {
                                  print(index);

                                  /// 数据模型转换为JSON
                                  var animeVideosJsonString =
                                      controller.animeVideos?.toJson();
                                  Get.toNamed(
                                    '/play',
                                    arguments: animeVideosJsonString?['Datas']
                                        [index],
                                  );
                                },
                                child: Container(
                                  // color: Colors.grey,
                                  child: Column(children: [
                                    Expanded(
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: Colors.grey,
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          image: DecorationImage(
                                            image: NetworkImage(
                                                '${controller.animeVideos?.datas?[index].picture}'),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      '${controller.animeVideos?.datas?[index].name}',
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ]),
                                ),
                              );
                            }),
                          ),
                        ),

                  //////
                  // 综艺推荐
                  //////
                  controller.varietyVideos?.datas?.length == null
                      ? Container()
                      : Container(
                          // color: Colors.grey,
                          margin: EdgeInsets.only(
                            left: 10,
                            top: 10,
                            right: 0,
                            bottom: 0,
                          ),
                          child: Row(
                            children: [
                              Text('推荐综艺'),
                              Spacer(),
                              IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.keyboard_arrow_right,
                                ),
                              ),
                            ],
                          ),
                        ),
                  controller.varietyVideos?.datas?.length == null
                      ? Container()
                      : Container(
                          margin: EdgeInsets.only(
                            left: 10,
                            top: 10,
                            right: 10,
                            bottom: 10,
                          ),
                          child: GridView.builder(
                            // 加载所有组件
                            shrinkWrap: true,
                            // 禁止滑动
                            physics: NeverScrollableScrollPhysics(),
                            // 构建固定数量的组件
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              // 横轴元素
                              crossAxisCount: 3,
                              // 横轴间距
                              crossAxisSpacing: 10,
                              // 纵轴间距
                              mainAxisSpacing: 10,
                              // 组件宽高比率
                              childAspectRatio:
                                  (MediaQuery.of(context).size.width / 16 * 9) /
                                      (MediaQuery.of(context).size.width /
                                          16 *
                                          17),
                            ),
                            itemCount: controller.varietyVideos?.datas?.length,
                            itemBuilder: ((context, index) {
                              return GestureDetector(
                                onTap: () {
                                  print(index);

                                  /// 数据模型转换为JSON
                                  var varietyVideosJsonString =
                                      controller.varietyVideos?.toJson();
                                  Get.toNamed(
                                    '/play',
                                    arguments: varietyVideosJsonString?['Datas']
                                        [index],
                                  );
                                },
                                child: Container(
                                  // color: Colors.grey,
                                  child: Column(children: [
                                    Expanded(
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: Colors.grey,
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          image: DecorationImage(
                                            image: NetworkImage(
                                                '${controller.varietyVideos?.datas?[index].picture}'),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      '${controller.varietyVideos?.datas?[index].name}',
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ]),
                                ),
                              );
                            }),
                          ),
                        ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
