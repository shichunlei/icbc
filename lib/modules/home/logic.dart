import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeLogic extends GetxController with GetSingleTickerProviderStateMixin {
  late ScrollController controller;

  late TabController tabController;

  var selectIndex = 0.obs;

  var appBarOpacity = .0.obs;

  var isTop = true.obs;

  HomeLogic() {
    controller = ScrollController()
      ..addListener(() {
        double offset = controller.offset;
        double opacity = (offset / 100).clamp(0.0, 1.0);
        appBarOpacity.value = opacity;

        isTop.value = controller.position.pixels <= 0;
      });

    tabController = TabController(length: 2, vsync: this)
      ..addListener(() {
        selectIndex.value = tabController.index;
      });
  }

  List<String> four = ["活钱生利", "低波稳健", "进取投资", "安心保障"];

  var selectFourIndex = 0.obs;

  @override
  void onClose() {
    controller.dispose();
    tabController.dispose();
    super.onClose();
  }
}
