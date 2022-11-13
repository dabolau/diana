import 'package:diana/app/common/all_row_button.dart';
import 'package:diana/app/common/url.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/about_controller.dart';

class AboutView extends GetView<AboutController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('appbars_about'.tr),
        centerTitle: true,
        elevation: 0,
      ),
      body: Container(
        child: ListView(
          children: [
            //////
            // 间隔
            //////
            SizedBox(
              height: 10,
            ),
            //////
            // 官方网站
            //////
            AllRowButton(
              onPressed: () {
                print('官方网站');
                openUrl(uri: 'https://www.abc.com');
              },
              leftChild: Container(
                margin: EdgeInsets.only(left: 5),
                child: Text(
                  '官网',
                ),
              ),
              rightChild: Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(right: 10),
                    child: Text('https://www.abc.com'),
                  ),
                  Icon(
                    Icons.keyboard_arrow_right,
                    size: 20,
                  ),
                ],
              ),
            ),

            //////
            // 间隔
            //////
            SizedBox(
              height: 1,
            ),
            //////
            // 用户交流群
            //////
            AllRowButton(
              onPressed: () {
                print('用户交流群');
                openUrl(uri: 'https://t.me/hello');
              },
              leftChild: Container(
                margin: EdgeInsets.only(left: 5),
                child: Text(
                  '用户交流群',
                ),
              ),
              rightChild: Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(right: 10),
                    child: Text(
                      'https://t.me/abc',
                    ),
                  ),
                  Icon(
                    Icons.keyboard_arrow_right,
                    size: 20,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
