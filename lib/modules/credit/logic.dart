import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreditLogic extends GetxController {
  late ScrollController controller;

  var appBarOpacity = .0.obs;

  List<Map<String, dynamic>> list = [
    {"title": "申请办卡", "imagePath": "assets/images/icons/icon_申请办卡.png"},
    {"title": "申请进度", "imagePath": "assets/images/icons/icon_申请进度.png"},
    {"title": "卡片启用", "imagePath": "assets/images/icons/icon_卡片启用.png"},
    {"title": "支付聚惠", "imagePath": "assets/images/icons/icon_支付聚惠.png"},
    {"title": "家装分期", "imagePath": "assets/images/icons/icon_家装分期.png"},
    {"title": "分期付款", "imagePath": "assets/images/icons/icon_分期付款.png"},
    {"title": "现金分期", "imagePath": "assets/images/icons/icon_现金分期.png"},
    {"title": "卡片权益", "imagePath": "assets/images/icons/icon_卡片权益.png"},
    {"title": "一键绑卡", "imagePath": "assets/images/icons/icon_一键绑卡.png"},
    {"title": "积分兑换", "imagePath": "assets/images/icons/icon_积分兑换.png"},
    {"title": "自动还款", "imagePath": "assets/images/icons/icon_自动还款.png"},
    {"title": "数字卡", "imagePath": "assets/images/icons/icon_数字卡.png"},
    {"title": "账户安全锁", "imagePath": "assets/images/icons/icon_账户安全锁.png"},
    {"title": "查额度", "imagePath": "assets/images/icons/icon_查额度.png"},
    {"title": "年费查询", "imagePath": "assets/images/icons/icon_年费查询.png"},
    {"title": "急用钱", "imagePath": "assets/images/icons/icon_急用钱.png"},
    {"title": "e分期", "imagePath": "assets/images/icons/icon_e分期.png"},
    {"title": "信用报告", "imagePath": "assets/images/icons/icon_信用报告.png"},
    {"title": "分期甄选", "imagePath": "assets/images/icons/icon_分期甄选.png"},
    {"title": "云闪付", "imagePath": "assets/images/icons/icon_云闪付.png"},
    {"title": "智行天下", "imagePath": "assets/images/icons/icon_智行天下.png"},
    {"title": "申请副卡", "imagePath": "assets/images/icon_申请副卡.png"},
    {"title": "升级线上\n支付", "imagePath": "assets/images/icon_升级线上支付.png"},
    {"title": "预约换卡", "imagePath": "assets/images/icon_预约换卡.png"},
    {"title": "密码管理", "imagePath": "assets/images/icon_密码管理.png"}
  ];

  CreditLogic() {
    controller = ScrollController()
      ..addListener(() {
        double offset = controller.offset;
        double opacity = (offset / 100).clamp(0.0, 1.0);
        appBarOpacity.value = opacity;
      });
  }

  @override
  void onClose() {
    controller.dispose();
    super.onClose();
  }
}
