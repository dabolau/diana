import 'package:diana/app/common/themes.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../controllers/type_controller.dart';

class TypeView extends GetView<TypeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('分类'),
      //   centerTitle: true,
      //   elevation: 0,
      // ),
      appBar: AppBar(
        title: GetBuilder<TypeController>(
          init: TypeController(),
          builder: (controller) {
            return GestureDetector(
              onTap: () {
                Get.toNamed('/search');
              },
              child: Container(
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
                child: Center(
                  child: Text(
                    'texts_search'.tr,
                    style: TextStyle(
                      color: Get.isDarkMode ? Colors.grey : Colors.grey,
                    ),
                  ),
                ),
              ),
            );
          },
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: GetBuilder<TypeController>(
        init: TypeController(),
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
                  /// 类别
                  //////
                  Container(
                    margin: EdgeInsets.only(
                      left: 10,
                      top: 10,
                      right: 10,
                      bottom: 0,
                    ),
                    height: 40,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: controller.filterCategory.value.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: index == 0
                              ? EdgeInsets.only(left: 0) // 首个组件不设置外边距
                              : EdgeInsets.only(left: 10), // 其它组件设置外边距
                          child: ChoiceChip(
                            elevation: 0,
                            pressElevation: 0,
                            selectedColor: lightPrimaryColor,
                            backgroundColor: Colors.white,
                            label: Text(
                              '${controller.filterCategory.value[index]}',
                              style: TextStyle(
                                color: Get.isDarkMode
                                    ? lightTextPrimaryColor
                                    : lightTextPrimaryColor,
                              ),
                            ),
                            selected:
                                controller.filterCategoryIndex.value == index,
                            onSelected: (value) {
                              // 选中组件索引
                              controller.filterCategoryIndex.value = index;
                              // 获取类别
                              if (controller.filterCategory.value[index] ==
                                  '全部') {
                                controller.category.value = '';
                              } else {
                                controller.category.value =
                                    controller.filterCategory.value[index];
                              }
                              // 获取数据
                              controller.getTypeVideos();
                            },
                          ),
                        );
                      },
                    ),
                  ),

                  //////
                  /// 分类
                  //////
                  Container(
                    margin: EdgeInsets.only(
                      left: 10,
                      top: 0,
                      right: 10,
                      bottom: 0,
                    ),
                    height: 40,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: controller.filterType.value.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: index == 0
                              ? EdgeInsets.only(left: 0) // 首个组件不设置外边距
                              : EdgeInsets.only(left: 10), // 其它组件设置外边距
                          child: ChoiceChip(
                            elevation: 0,
                            pressElevation: 0,
                            selectedColor: lightPrimaryColor,
                            backgroundColor: Colors.white,
                            label: Text(
                              '${controller.filterType.value[index]}',
                              style: TextStyle(
                                color: Get.isDarkMode
                                    ? lightTextPrimaryColor
                                    : lightTextPrimaryColor,
                              ),
                            ),
                            selected: controller.filterTypeIndex.value == index,
                            onSelected: (value) {
                              // 选中组件索引
                              controller.filterTypeIndex.value = index;
                              // 获取分类
                              if (controller.filterType.value[index] == '全部') {
                                controller.type.value = '';
                              } else {
                                controller.type.value =
                                    controller.filterType.value[index];
                              }
                              // 获取数据
                              controller.getTypeVideos();
                            },
                          ),
                        );
                      },
                    ),
                  ),

                  //////
                  /// 地区
                  //////
                  Container(
                    margin: EdgeInsets.only(
                      left: 10,
                      top: 0,
                      right: 10,
                      bottom: 0,
                    ),
                    height: 40,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: controller.filterArea.value.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: index == 0
                              ? EdgeInsets.only(left: 0) // 首个组件不设置外边距
                              : EdgeInsets.only(left: 10), // 其它组件设置外边距
                          child: ChoiceChip(
                            elevation: 0,
                            pressElevation: 0,
                            selectedColor: lightPrimaryColor,
                            backgroundColor: Colors.white,
                            label: Text(
                              '${controller.filterArea.value[index]}',
                              style: TextStyle(
                                color: Get.isDarkMode
                                    ? lightTextPrimaryColor
                                    : lightTextPrimaryColor,
                              ),
                            ),
                            selected: controller.filterAreaIndex.value == index,
                            onSelected: (value) {
                              // 选中组件索引
                              controller.filterAreaIndex.value = index;
                              // 获取地区
                              if (controller.filterArea.value[index] == '全部') {
                                controller.area.value = '';
                              } else {
                                controller.area.value =
                                    controller.filterArea.value[index];
                              }
                              // 获取数据
                              controller.getTypeVideos();
                            },
                          ),
                        );
                      },
                    ),
                  ),

                  //////
                  /// 语言
                  //////
                  Container(
                    margin: EdgeInsets.only(
                      left: 10,
                      top: 0,
                      right: 10,
                      bottom: 0,
                    ),
                    height: 40,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: controller.filterLanguage.value.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: index == 0
                              ? EdgeInsets.only(left: 0) // 首个组件不设置外边距
                              : EdgeInsets.only(left: 10), // 其它组件设置外边距
                          child: ChoiceChip(
                            elevation: 0,
                            pressElevation: 0,
                            selectedColor: lightPrimaryColor,
                            backgroundColor: Colors.white,
                            label: Text(
                              '${controller.filterLanguage.value[index]}',
                              style: TextStyle(
                                color: Get.isDarkMode
                                    ? lightTextPrimaryColor
                                    : lightTextPrimaryColor,
                              ),
                            ),
                            selected:
                                controller.filterLanguageIndex.value == index,
                            onSelected: (value) {
                              // 选中组件索引
                              controller.filterLanguageIndex.value = index;
                              // 获取语言
                              if (controller.filterLanguage.value[index] ==
                                  '全部') {
                                controller.language.value = '';
                              } else {
                                controller.language.value =
                                    controller.filterLanguage.value[index];
                              }
                              // 获取数据
                              controller.getTypeVideos();
                            },
                          ),
                        );
                      },
                    ),
                  ),

                  //////
                  /// 年份
                  //////
                  Container(
                    margin: EdgeInsets.only(
                      left: 10,
                      top: 0,
                      right: 10,
                      bottom: 0,
                    ),
                    height: 40,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: controller.filterYear.value.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: index == 0
                              ? EdgeInsets.only(left: 0) // 首个组件不设置外边距
                              : EdgeInsets.only(left: 10), // 其它组件设置外边距
                          child: ChoiceChip(
                            elevation: 0,
                            pressElevation: 0,
                            selectedColor: lightPrimaryColor,
                            backgroundColor: Colors.white,
                            label: Text(
                              '${controller.filterYear.value[index]}',
                              style: TextStyle(
                                color: Get.isDarkMode
                                    ? lightTextPrimaryColor
                                    : lightTextPrimaryColor,
                              ),
                            ),
                            selected: controller.filterYearIndex.value == index,
                            onSelected: (value) {
                              // 选中组件索引
                              controller.filterYearIndex.value = index;
                              // 获取年份
                              if (controller.filterYear.value[index] == '全部') {
                                controller.year.value = '';
                              } else {
                                controller.year.value =
                                    controller.filterYear.value[index];
                              }
                              // 获取数据
                              controller.getTypeVideos();
                            },
                          ),
                        );
                      },
                    ),
                  ),

                  //////
                  // 分类内容
                  //////
                  controller.videos?.datas?.length == null
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
                            itemCount: controller.videos?.datas?.length,
                            itemBuilder: ((context, index) {
                              return GestureDetector(
                                onTap: () {
                                  print(index);

                                  /// 数据模型转换为JSON
                                  var videosJsonString =
                                      controller.videos?.toJson();
                                  Get.toNamed(
                                    '/play',
                                    arguments: videosJsonString?['Datas']
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
                                                '${controller.videos?.datas?[index].picture}'),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      '${controller.videos?.datas?[index].name}',
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
