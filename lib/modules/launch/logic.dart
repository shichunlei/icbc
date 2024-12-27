import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icbc/router/router.dart';

class LaunchLogic extends GetxController {
  final AssetImage image = AssetImage("assets/images/sta_8_caifu_press.png");

  @override
  void onInit() {
    super.onInit();

    Future.delayed(Duration(seconds: 1), () {
      Get.offAllNamed(AppRouter().indexRoute.name);
    });
  }
}
