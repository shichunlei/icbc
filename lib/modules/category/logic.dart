import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icbc/beans/category_bean.dart';

class CategoryLogic extends GetxController with GetSingleTickerProviderStateMixin {
  late TabController tabController;

  CategoryBean? categoryBean = null;

  CategoryLogic() {
    tabController = TabController(length: 0, vsync: this);

    getCategory();
  }

  Future getCategory() async {}

  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }
}
