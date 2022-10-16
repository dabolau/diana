import 'package:diana/app/common/constant.dart';
import 'package:diana/app/modules/my/providers/version_provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyController extends GetxController {
  /// 多国语言名称
  var localeName = '简体中文'.obs;

  /// 主题名称
  var themeName = '浅色模式'.obs;

  /// 获取所有版本信息
  void getAllVersion() async {
    /// 发送请求
    var version = await VersionProvider().getAllVersion();
    print(version?.datas?[0].name);
    print(version?.datas?[0].version);
    print(version?.datas?[0].url);

    /// 判断版本号是否相同
    if (dianaVersion != version?.datas?[0].version) {
      /// 当应用程序版本与网络版本不相同时
      Get.snackbar(
        '提示信息',
        '获取到最新版本，版本号为${version?.datas?[0].version}',
        margin: EdgeInsets.only(
          left: 10,
          top: 10,
          right: 10,
          bottom: 0,
        ),
      );
    } else {
      /// 当应用程序版本与网络版本相同时
      Get.snackbar(
        '提示信息',
        '当前版本为最新版本',
        margin: EdgeInsets.only(
          left: 10,
          top: 10,
          right: 10,
          bottom: 0,
        ),
      );
    }
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
