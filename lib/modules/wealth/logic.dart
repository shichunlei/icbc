import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icbc/beans/category_bean.dart';

class WealthLogic extends GetxController with GetSingleTickerProviderStateMixin {
  late ScrollController controller;

  var appBarOpacity = .0.obs;

  late TabController tabController;

  late List<ItemsEntity> items;

  WealthLogic() {
    controller = ScrollController()
      ..addListener(() {
        double offset = controller.offset;
        double opacity = (offset / 100).clamp(0.0, 1.0);
        appBarOpacity.value = opacity;
      });

    tabController = TabController(length: 4, vsync: this);

    items = const [
      ItemsEntity(title: "风险能力\n评测", imagePath: "assets/images/icons/icon_风险能力评测.png", routeName: "", id: ""),
      ItemsEntity(title: "存款", imagePath: "assets/images/icons/icon_存款.png", routeName: "", id: ""),
      ItemsEntity(title: "理财", imagePath: "assets/images/icons/icon_理财.png", routeName: "", id: ""),
      ItemsEntity(title: "基金", imagePath: "assets/images/icons/icon_基金.png", routeName: "", id: ""),
      ItemsEntity(title: "贵金属", imagePath: "assets/images/icons/icon_贵金属.png", routeName: "", id: ""),
      ItemsEntity(title: "保险", imagePath: "assets/images/icons/icon_保险.png", routeName: "", id: ""),
      ItemsEntity(title: "结售汇", imagePath: "assets/images/icons/icon_结售汇.png", routeName: "", id: ""),
      ItemsEntity(title: "外币兑换", imagePath: "assets/images/icons/icon_外币兑换.png", routeName: "", id: ""),
      ItemsEntity(title: "证券", imagePath: "assets/images/icons/icon_证券.png", routeName: "", id: ""),
      ItemsEntity(title: "储蓄国债", imagePath: "assets/images/icons/icon_储蓄国债.png", routeName: "", id: ""),
      ItemsEntity(title: "资产诊断", imagePath: "assets/images/icons/icon_资产诊断.png", routeName: "", id: ""),
      ItemsEntity(title: "柜台债券", imagePath: "assets/images/icons/icon_柜台债券.png", routeName: "", id: ""),
      ItemsEntity(title: "实物贵金属", imagePath: "assets/images/icons/icon_实物贵金属.png", routeName: "", id: ""),
      ItemsEntity(title: "账户能源", imagePath: "assets/images/icons/icon_账户能源.png", routeName: "", id: ""),
      ItemsEntity(title: "AI投", imagePath: "assets/images/icons/icon_AI投.png", routeName: "", id: ""),
      ItemsEntity(title: "产品信息\n查询", imagePath: "assets/images/icons/icon_产品信息查询.png", routeName: "", id: ""),
      ItemsEntity(title: "外汇买卖", imagePath: "assets/images/icons/icon_外汇买卖.png", routeName: "", id: ""),
      ItemsEntity(title: "积存贵金属", imagePath: "assets/images/icons/icon_积存贵金属.png", routeName: "", id: ""),
      ItemsEntity(title: "账户基本\n金属", imagePath: "assets/images/icons/icon_账户基本金属.png", routeName: "", id: ""),
      ItemsEntity(title: "账户外汇", imagePath: "assets/images/icons/icon_账户外汇.png", routeName: "", id: ""),
      ItemsEntity(title: "账户农产品", imagePath: "assets/images/icons/icon_账户农产品.png", routeName: "", id: ""),
    ];
  }

  List<String> tags = ["为您挑选", "随心快餐", "乐享系列", "基金精选", "换金投资"];

  var selectTagIndex = 0.obs;

  List<String> four = ["活钱生利", "低波稳健", "进取投资", "安心保障"];

  var selectFourIndex = 0.obs;

  List<Tab> tabs = const [Tab(text: "看市场"), Tab(text: "短视频"), Tab(text: "学知识"), Tab(text: "财富号")];

  List<String> titles = ["稳健投资也会波动吗？", "解码指数基金（上）", "活钱理财产品怎么选？"];

  @override
  void onClose() {
    controller.dispose();
    tabController.dispose();
    super.onClose();
  }
}
