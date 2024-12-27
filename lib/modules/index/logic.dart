import 'package:flutter/material.dart';
import 'package:get/get.dart';

class IndexLogic extends GetxController{

  final PageController pageController = PageController(initialPage: 0);

  static int tabId = 1;

  ///当前页面索引
  var currentIndex = 0.obs;

}