import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:icbc/beans/category_bean.dart';

class CategoryLogic extends GetxController with GetSingleTickerProviderStateMixin {
  late TabController tabController;

  Rx<CategoryBean?> categoryBean = Rx<CategoryBean?>(null);

  CategoryLogic() {
    getCategory();
  }

  Future getCategory() async {
    String response = await rootBundle.loadString("assets/data/category.json");
    categoryBean.value = CategoryBean.fromJson(json.decode(response));
    tabController = TabController(length: categoryBean.value!.category.length, vsync: this);
    if (categoryBean.value != null) {
      print(categoryBean.value!.toJson());
    }
  }

  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }
}
