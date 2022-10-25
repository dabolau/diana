import 'package:diana/app/modules/home/providers/videos_provider.dart';
import 'package:diana/app/modules/home/videos_model.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  /// 获取内容
  var text = ''.obs; // 名称
  var year = '2022'.obs; // 年份

  /// 视频模型
  Videos? movieVideos;
  Videos? tvVideos;
  Videos? animeVideos;
  Videos? varietyVideos;

  //////
  /// 获取电影信息
  //////
  void getMovieVideos() async {
    /// 获取数据
    print('获取数据 ${text.value}');

    /// 发送请求
    movieVideos =
        await VideosProvider().getVideos(text.value, '电影', year.value);

    /// 判断数据为空时
    if (movieVideos?.datas == null) {
      /// 更新界面
      update();
      return;
    }

    /// 判断数据不为空时
    print('获取到电影 ${movieVideos?.datas?.length} 条');
    for (var video in (movieVideos?.datas)!) {
      print(video.name);
    }

    /// 更新界面
    update();
  }

  //////
  /// 获取电视剧信息
  //////
  void getTvVideos() async {
    /// 获取数据
    print('获取数据 ${text.value}');

    /// 发送请求
    tvVideos = await VideosProvider().getVideos(text.value, '电视剧', year.value);

    /// 判断数据为空时
    if (tvVideos?.datas == null) {
      /// 更新界面
      update();
      return;
    }

    /// 判断数据不为空时
    print('获取到电视剧 ${tvVideos?.datas?.length} 条');
    for (var video in (tvVideos?.datas)!) {
      print(video.name);
    }

    /// 更新界面
    update();
  }

  //////
  /// 获取动漫信息
  //////
  void getAnimeVideos() async {
    /// 获取数据
    print('获取数据 ${text.value}');

    /// 发送请求
    animeVideos =
        await VideosProvider().getVideos(text.value, '电视剧', year.value);

    /// 判断数据为空时
    if (animeVideos?.datas == null) {
      /// 更新界面
      update();
      return;
    }

    /// 判断数据不为空时
    print('获取到动漫 ${animeVideos?.datas?.length} 条');
    for (var video in (animeVideos?.datas)!) {
      print(video.name);
    }

    /// 更新界面
    update();
  }

  //////
  /// 获取综艺信息
  //////
  void getVarietyVideos() async {
    /// 获取数据
    print('获取数据 ${text.value}');

    /// 发送请求
    varietyVideos =
        await VideosProvider().getVideos(text.value, '电视剧', year.value);

    /// 判断数据为空时
    if (varietyVideos?.datas == null) {
      /// 更新界面
      update();
      return;
    }

    /// 判断数据不为空时
    print('获取到综艺 ${varietyVideos?.datas?.length} 条');
    for (var video in (varietyVideos?.datas)!) {
      print(video.name);
    }

    /// 更新界面
    update();
  }

  @override
  void onInit() {
    super.onInit();

    getMovieVideos();
    getTvVideos();
    getAnimeVideos();
    getVarietyVideos();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
