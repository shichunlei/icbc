import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icbc/router/router.dart';

class LaunchLogic extends GetxController {
  final AssetImage image = const AssetImage("assets/images/loading_icbcbank_bg.webp");

  @override
  void onInit() {
    super.onInit();

    Future.delayed(const Duration(seconds: 1), () {
      Get.offAllNamed(AppRouter().indexRoute.name);
    });
  }
}
