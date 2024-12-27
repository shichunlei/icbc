import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WealthLogic extends GetxController with GetSingleTickerProviderStateMixin {
  late ScrollController controller;

  var appBarOpacity = .0.obs;

  late TabController tabController;

  WealthLogic() {
    controller = ScrollController()
      ..addListener(() {
        double offset = controller.offset;
        double opacity = (offset / 100).clamp(0.0, 1.0);
        appBarOpacity.value = opacity;
      });

    tabController = TabController(length: 4, vsync: this);
  }

  List<String> tags = ["为您挑选", "随心快餐", "乐享系列", "基金精选", "换金投资"];

  var selectTagIndex = 0.obs;

  List<String> four = ["活钱生利", "低波稳健", "进取投资", "安心保障"];

  var selectFourIndex = 0.obs;

  List<Tab> tabs = [Tab(text: "看市场"), Tab(text: "短视频"), Tab(text: "学知识"), Tab(text: "财富号")];

  List<String> titles = ["稳健投资也会波动吗？","解码指数基金（上）","活钱理财产品怎么选？"];

  @override
  void onClose() {
    controller.dispose();
    tabController.dispose();
    super.onClose();
  }
}
