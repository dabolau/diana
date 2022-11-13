import 'package:diana/app/modules/type/providers/videos_provider.dart';
import 'package:diana/app/modules/type/videos_model.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class TypeController extends GetxController {
  /// 类别名称和索引
  var filterCategoryIndex = 0.obs;
  var filterCategory = [
    "全部",
    "电视剧",
    "电影",
    "动漫",
    "综艺",
  ].obs;

  /// 分类名称和索引
  var filterTypeIndex = 0.obs;
  var filterType = [
    "全部",
    "爱情",
    "科幻",
    "喜剧",
    "动作",
    "动画",
    "恐怖",
    "犯罪",
    "惊悚",
    "悬疑",
    "剧情",
    "伦理",
    "言情",
    "神话",
    "穿越",
    "罪案",
    "谍战",
    "青春",
    "家庭",
    "军旅",
    "商战",
    "宫廷",
    "历史",
    "古装",
    "武侠",
    "偶像",
    "年代",
    "都市",
    "网络",
    "播报",
    "音乐",
    "相亲",
    "职场",
    "脱口秀",
    "少儿",
    "美食",
    "曲艺",
    "晚会",
    "情感",
    "时尚",
    "选秀",
    "游戏",
    "搞笑",
    "访谈",
    "真人秀",
    "战争",
    "热血",
    "格斗",
    "体育",
    "宠物",
    "冒险",
    "少女",
    "奇幻",
    "推理",
    "竞技",
    "机战",
    "百合",
    "纪录片",
    "校园",
    "灾难",
    "经典",
    "儿童",
    "恋爱",
    "魔幻",
    "财经",
    "旅游",
    "治愈",
  ].obs;

  /// 地区名称和索引
  var filterAreaIndex = 0.obs;
  var filterArea = [
    "全部",
    "大陆",
    "香港",
    "台湾",
    "美国",
    "韩国",
    "日本",
    "泰国",
    "新加坡",
    "马来西亚",
    "印度",
    "英国",
    "法国",
    "加拿大",
    "西班牙",
    "俄罗斯",
  ].obs;

  /// 语言名称和索引
  var filterLanguageIndex = 0.obs;
  var filterLanguage = [
    "全部",
    "普通话",
    "粤语",
    "英语",
    "韩语",
    "日语",
    "泰语",
    "越南语",
    "法语",
    "德语",
    "闽南语",
    "西班牙语",
    "俄语",
  ].obs;

  /// 年份名称和索引
  var filterYearIndex = 0.obs;
  var filterYear = [
    "全部",
    "2022",
    "2021",
    "2020",
    "2019",
    "2018",
    "2017",
    "2016",
    "2015",
    "2014",
    "2013",
    "2012",
    "2010",
  ].obs;

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
  Videos? videos;

  //////
  /// 获取分类内容
  //////
  void getTypeVideos() async {
    /// 分类内容
    print('分类内容 ${text.value} ${category} ${type} ${area} ${language} ${year}');

    /// 发送请求
    videos = await VideosProvider().getVideos(
        text: text.value,
        category: category.value,
        type: type.value,
        area: area.value,
        language: language.value,
        year: year.value,
        size: size.value.toString(),
        page: page.value.toString());

    /// 判断数据为空直接返回
    if (videos?.datas == null) {
      /// 更新界面
      update();
      return;
    }

    /// 获取到的数据
    print('获取到 ${videos?.datas?.length} 条数据');
    for (var video in (videos?.datas)!) {
      print(video.name);
    }

    /// 更新界面
    update();
  }

  /// 上拉加载下拉刷新控制器
  var refreshController = RefreshController(initialRefresh: false);

  /// 加载次数
  var loadCount = 1.obs;

  /// 下拉刷新
  void onRefresh() async {
    /// 监视网络数据
    await Future.delayed(Duration(milliseconds: 1000));

    /// 刷新数据
    loadCount.value = 1;
    size.value = 9;
    page.value = 1;
    print('获取内容为 ${text.value} 的 ${size.value} 条数据，第 ${page.value} 页');
    getTypeVideos();

    /// 刷新成功
    refreshController.refreshCompleted();
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
    getTypeVideos();

    /// 加载成功
    refreshController.loadComplete();
  }

  @override
  void onInit() {
    super.onInit();

    /// 获取分类内容
    getTypeVideos();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
