import 'package:diana/app/modules/home/providers/videos_provider.dart';
import 'package:diana/app/modules/home/videos_model.dart';
import 'package:diana/app/modules/main/controllers/main_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class HomeController extends GetxController {
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

    /// 设置类别
    category.value = '电影';

    /// 发送请求
    movieVideos = await VideosProvider().getVideos(
      text: text.value,
      category: category.value,
      type: type.value,
      area: area.value,
      language: language.value,
      year: year.value,
      size: size.value.toString(),
      page: page.value.toString(),
    );

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

    /// 设置类别
    category.value = '电视剧';

    /// 发送请求
    tvVideos = await VideosProvider().getVideos(
      text: text.value,
      category: category.value,
      type: type.value,
      area: area.value,
      language: language.value,
      year: year.value,
      size: size.value.toString(),
      page: page.value.toString(),
    );

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

    /// 设置类别
    category.value = '动漫';

    /// 发送请求
    animeVideos = await VideosProvider().getVideos(
      text: text.value,
      category: category.value,
      type: type.value,
      area: area.value,
      language: language.value,
      year: year.value,
      size: size.value.toString(),
      page: page.value.toString(),
    );

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

    /// 设置类别
    category.value = '综艺';

    /// 发送请求
    varietyVideos = await VideosProvider().getVideos(
      text: text.value,
      category: category.value,
      type: type.value,
      area: area.value,
      language: language.value,
      year: year.value,
      size: size.value.toString(),
      page: page.value.toString(),
    );

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

  /// 下拉刷新
  void onRefresh() async {
    /// 监视网络数据
    await Future.delayed(Duration(milliseconds: 1000));

    /// 刷新数据
    /// 获取电影
    getMovieVideos();

    /// 获取电视剧
    getTvVideos();

    /// 获取动漫
    getAnimeVideos();

    /// 获取综艺
    getVarietyVideos();

    refreshController.refreshCompleted();

    // /// 更新界面
    // update();
  }

  /// 上拉加载
  void onLoading() async {
    /// 监视网络数据
    await Future.delayed(Duration(milliseconds: 1000));

    /// 加载数据
    /// 获取电影
    getMovieVideos();

    /// 获取电视剧
    getTvVideos();

    /// 获取动漫
    getAnimeVideos();

    /// 获取综艺
    getVarietyVideos();

    /// 加载成功
    refreshController.loadComplete();

    // /// 更新界面
    // update();
  }

  @override
  void onInit() {
    super.onInit();

    /// 获取电影
    getMovieVideos();

    /// 获取电视剧
    getTvVideos();

    /// 获取动漫
    getAnimeVideos();

    /// 获取综艺
    getVarietyVideos();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
