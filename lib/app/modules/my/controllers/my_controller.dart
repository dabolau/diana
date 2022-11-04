import 'package:diana/app/common/constant.dart';
import 'package:diana/app/common/url.dart';
import 'package:diana/app/modules/my/providers/versions_provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class MyController extends GetxController {
  /// 多国语言名称
  var localeName = '简体中文'.obs;

  /// 主题名称
  var themeName = '浅色模式'.obs;

  /// 获取内容
  var text = ''.obs; // 名称

  /// 分页内容
  var size = 1.obs; // 分页大小
  var page = 1.obs; // 分页页码

  /// 获取所有版本信息
  void getAllVersion() async {
    /// 发送请求
    var versions = await VersionsProvider().getVersions(
      text: text.value,
      size: size.value.toString(),
      page: size.value.toString(),
    );
    print(versions?.datas?[0].name);
    print(versions?.datas?[0].version);
    print(versions?.datas?[0].url);

    /// 判断版本号是否相同
    if (dianaVersion != versions?.datas?[0].version) {
      /// 获取到最新版本时
      openUrl(uri: '${versions?.datas?[0].url}');

      /// 当应用程序版本与网络版本不相同时
      Get.snackbar(
        '提示信息',
        '获取到新版本，版本号为${versions?.datas?[0].version}',
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
