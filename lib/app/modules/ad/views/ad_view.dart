import 'package:diana/app/common/themes.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/ad_controller.dart';

class AdView extends GetView<AdController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('AdView'),
      //   centerTitle: true,
      //   elevation: 0,
      // ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Get.isDarkMode ? darkBackgroundColor : lightBackgroundColor,
        child: Stack(
          children: [
            //////
            /// 广告图片
            //////
            Positioned(
              top: 0,
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                child: Image.network(
                  'https://img.wolongimg.com:65/upload/vod/20221009-1/c2c293d72a12e88da552c2080bfec404.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            //////
            /// 跳过按钮
            //////
            Positioned(
              top: MediaQuery.of(context).padding.top + 20,
              right: 20,
              child: Container(
                width: 80,
                height: 40,
                child: TextButton(
                  onPressed: () {
                    print('跳过');
                    // 跳回上页
                    Get.back();
                  },
                  child: Text('跳过 3'),
                  style: ButtonStyle(
                    // 形状
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                    // 前景颜色
                    foregroundColor: MaterialStateProperty.all(
                      Color(0xFFE6E1E5),
                    ),
                    // 背景颜色
                    backgroundColor: MaterialStateProperty.all(
                      Color(0x99393939),
                    ),
                    // 覆盖颜色
                    overlayColor: MaterialStateProperty.all(
                      Color(0x99393939),
                    ),
                  ),
                ),
              ),
            ),
            //////
            /// 跳进广告内容按钮
            //////
            Positioned(
              bottom: 80,
              left: (MediaQuery.of(context).size.width / 3) - 70,
              right: (MediaQuery.of(context).size.width / 3) - 70,
              child: Container(
                width: 70,
                height: 50,
                child: TextButton(
                  onPressed: () {
                    print('跳过');
                  },
                  child: Text('点击跳转详情页或至第三方应用'),
                  style: ButtonStyle(
                    // 形状
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                    // 前景颜色
                    foregroundColor: MaterialStateProperty.all(
                      Color(0xFFE6E1E5),
                    ),
                    // 背景颜色
                    backgroundColor: MaterialStateProperty.all(
                      Color(0x99393939),
                    ),
                    // 覆盖颜色
                    overlayColor: MaterialStateProperty.all(
                      Color(0x99393939),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
