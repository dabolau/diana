import 'package:diana/app/modules/search/providers/videos_provider.dart';
import 'package:diana/app/modules/search/videos_model.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class SearchController extends GetxController {
  /// 上拉加载下拉刷新控制器
  var refreshController = RefreshController(initialRefresh: false);

  /// 获取内容
  var text = ''.obs; // 名称
  var category = ''.obs; // 类别
  var type = ''.obs; // 类型
  var area = ''.obs; // 地区
  var language = ''.obs; // 语言
  var year = ''.obs; // 年份

  /// 分页内容
  var size = 9.obs; // 分页大小
  var page = 1.obs; // 分页页码

  /// 加载次数
  var loadCount = 1.obs;

  /// 视频模型
  Videos? videos;

  //////
  /// 搜索内容
  //////
  void search() async {
    /// 搜索内容
    print('搜索内容 ${text.value}');

    /// 发送请求
    videos = await VideosProvider().getVideos(
        text: text.value,
        category: category.value,
        type: type.value,
        area: area.value,
        language: language.value,
        year: year.value,
        size: (size.value).toString(),
        page: (page.value).toString());

    /// 判断数据为空直接返回
    if (videos?.datas == null) {
      /// 更新界面
      update();
      return;
    }

    /// 搜索到的数据
    print('搜索到 ${videos?.datas?.length} 条数据');
    for (var video in (videos?.datas)!) {
      print(video.name);
    }

    /// 更新界面
    update();
  }

  /// 下拉刷新
  void onRefresh() async {
    /// 监视网络数据
    await Future.delayed(Duration(milliseconds: 1000));

    /// 刷新数据
    loadCount.value = 1;
    size.value = 9;
    page.value = 1;
    print('获取内容为 ${text.value} 的 ${size.value} 条数据，第 ${page.value} 页');
    search();

    refreshController.refreshCompleted();

    // /// 更新界面
    // update();
  }

  /// 上拉加载
  void onLoading() async {
    /// 监视网络数据
    await Future.delayed(Duration(milliseconds: 1000));

    /// 加载数据
    loadCount.value++;
    size.value = 9 * loadCount.value;
    page.value = 1;
    print('获取内容为 ${text.value} 的 ${size.value} 条数据，第 ${page.value} 页');
    search();

    /// 加载成功
    refreshController.loadComplete();

    // /// 更新界面
    // update();
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
