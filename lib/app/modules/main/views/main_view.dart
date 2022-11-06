import 'package:diana/app/common/themes.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/main_controller.dart';

class MainView extends GetView<MainController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //////
      // 底部导航方案一，初始化当前索引的页面
      //////
      // body: GetBuilder<MainController>(
      //   init: MainController(),
      //   builder: ((controller) {
      //     return PageView(
      //       physics: const NeverScrollableScrollPhysics(),
      //       controller: controller.pageController,
      //       children: controller.pages,
      //     );
      //   }),
      // ),

      //////
      // 底部导航方案二，初始化所有页面
      //////
      body: GetBuilder<MainController>(
          init: MainController(),
          builder: ((controller) {
            return IndexedStack(
              index: controller.pageIndex.value,
              children: controller.pages,
            );
          })),

      //////
      // 底部导航选项
      //////
      bottomNavigationBar: GetBuilder<MainController>(
          init: MainController(),
          builder: ((controller) {
            return BottomNavigationBar(
              elevation: 0,
              type: BottomNavigationBarType.fixed,
              unselectedItemColor: Colors.grey,
              selectedItemColor:
                  Get.isDarkMode ? lightPrimaryColor : lightPrimaryColor,
              selectedFontSize: 12,
              unselectedFontSize: 12,
              currentIndex: controller.pageIndex.value,
              //////
              // 底部导航方案一，改变页面
              //////
              // onTap: (value) {
              //   // 改变页面索引
              //   controller.pageIndex.value = value;
              //   // 跳转页面
              //   controller.pageController.jumpToPage(value);
              //   // 更新界面
              //   controller.update();
              // },

              //////
              // 底部导航方案二，改变页面
              //////
              onTap: (value) {
                // 改变页面索引
                controller.pageIndex.value = value;
                // 更新界面
                controller.update();
              },
              items: [
                // 首页选项
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home_outlined,
                    color: Colors.grey,
                    size: 33,
                  ),
                  activeIcon: Icon(
                    Icons.home_rounded,
                    color:
                        Get.isDarkMode ? lightPrimaryColor : lightPrimaryColor,
                    size: 33,
                  ),
                  label: 'bottombars_home'.tr,
                ),
                // 搜索选项
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.live_tv_outlined,
                    color: Colors.grey,
                    size: 33,
                  ),
                  activeIcon: Icon(
                    Icons.live_tv_rounded,
                    color:
                        Get.isDarkMode ? lightPrimaryColor : lightPrimaryColor,
                    size: 33,
                  ),
                  label: 'bottombars_type'.tr,
                ),
                // 我的选项
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.person_outlined,
                    color: Colors.grey,
                    size: 33,
                  ),
                  activeIcon: Icon(
                    Icons.person_rounded,
                    color:
                        Get.isDarkMode ? lightPrimaryColor : lightPrimaryColor,
                    size: 33,
                  ),
                  label: 'bottombars_my'.tr,
                ),
              ],
            );
          })),
    );
  }
}
