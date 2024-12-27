import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LifeLogic extends GetxController with GetSingleTickerProviderStateMixin {
  late ScrollController controller;

  var appBarOpacity = .0.obs;

  late TabController tabController;

  LifeLogic() {
    controller = ScrollController()
      ..addListener(() {
        double offset = controller.offset;
        double opacity = (offset / 100).clamp(0.0, 1.0);
        appBarOpacity.value = opacity;
      });
    tabController = TabController(length: 3, vsync: this);
  }

  @override
  void onClose() {
    controller.dispose();
    tabController.dispose();
    super.onClose();
  }
}
