import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('首页'),
        centerTitle: true,
        elevation: 0,
      ),
      body: GetBuilder<HomeController>(
        init: HomeController(),
        builder: ((controller) {
          return Container(
            child: ListView(
              children: [
                //////
                // 电影推荐
                //////
                Container(
                  // color: Colors.grey,
                  margin: EdgeInsets.only(
                    left: 10,
                    top: 10,
                    right: 0,
                    bottom: 0,
                  ),
                  child: Row(
                    children: [
                      Text('电影推荐'),
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
                          itemCount: 9,
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
                                        borderRadius: BorderRadius.circular(8),
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
                Container(
                  // color: Colors.grey,
                  margin: EdgeInsets.only(
                    left: 10,
                    top: 10,
                    right: 0,
                    bottom: 0,
                  ),
                  child: Row(
                    children: [
                      Text('电视剧推荐'),
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
                          itemCount: 9,
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
                                        borderRadius: BorderRadius.circular(8),
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
                Container(
                  // color: Colors.grey,
                  margin: EdgeInsets.only(
                    left: 10,
                    top: 10,
                    right: 0,
                    bottom: 0,
                  ),
                  child: Row(
                    children: [
                      Text('动漫推荐'),
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
                          itemCount: 9,
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
                                        borderRadius: BorderRadius.circular(8),
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
                Container(
                  // color: Colors.grey,
                  margin: EdgeInsets.only(
                    left: 10,
                    top: 10,
                    right: 0,
                    bottom: 0,
                  ),
                  child: Row(
                    children: [
                      Text('综艺推荐'),
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
                          itemCount: 9,
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
                                        borderRadius: BorderRadius.circular(8),
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
          );
        }),
      ),
    );
  }
}
