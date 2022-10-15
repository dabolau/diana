import 'package:diana/app/common/constant.dart';
import 'package:diana/app/modules/my/providers/version_provider.dart';
import 'package:get/get.dart';

class MyController extends GetxController {
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
      Get.snackbar('提示信息', '获取到最新版本，版本号为${version?.datas?[0].version}');
    } else {
      /// 当应用程序版本与网络版本相同时
      Get.snackbar('提示信息', '当前版本为最新版本');
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
