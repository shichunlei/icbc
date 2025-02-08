import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icbc/beans/category_bean.dart';

class MineLogic extends GetxController {
  late ScrollController controller;

  var appBarOpacity = .0.obs;

  late List<ItemsEntity> items;

  MineLogic() {
    controller = ScrollController()
      ..addListener(() {
        double offset = controller.offset;
        double opacity = (offset / 100).clamp(0.0, 1.0);
        appBarOpacity.value = opacity;
      });

    items = const [
      ItemsEntity(title: "月度账单", imagePath: "assets/images/icons/icon_月度账单.png", routeName: "", id: ""),
      ItemsEntity(title: "订单", imagePath: "assets/images/icons/icon_订单.png", routeName: "", id: ""),
      ItemsEntity(title: "成长嘉年华", imagePath: "assets/images/icons/icon_成长嘉年华.png", routeName: "", id: ""),
      ItemsEntity(title: "投诉咨询", imagePath: "assets/images/icons/icon_投诉咨询.png", routeName: "", id: ""),
      ItemsEntity(title: "信用报告", imagePath: "assets/images/icons/icon_信用报告.png", routeName: "", id: ""),
      ItemsEntity(title: "办理进度", imagePath: "assets/images/icons/icon_办理进度.png", routeName: "", id: ""),
      ItemsEntity(title: "数字藏品", imagePath: "assets/images/icons/icon_数字藏品.png", routeName: "", id: ""),
      ItemsEntity(title: "产品足迹", imagePath: "assets/images/icons/icon_产品足迹.png", routeName: "", id: ""),
      ItemsEntity(title: "分享有礼", imagePath: "assets/images/icons/icon_分享有礼.png", routeName: "", id: ""),
      ItemsEntity(title: "评价与反馈", imagePath: "assets/images/icons/icon_评价与反馈.png", routeName: "", id: ""),
      ItemsEntity(title: "用印信息\n验证", imagePath: "assets/images/icons/icon_用印信息验证.png", routeName: "", id: ""),
      ItemsEntity(title: "云保管", imagePath: "assets/images/icons/icon_云保管.png", routeName: "", id: ""),
      ItemsEntity(title: "电子发票\n申请", imagePath: "assets/images/icons/icon_电子发票申请.png", routeName: "", id: ""),
      ItemsEntity(title: "涉外收入\n申报", imagePath: "assets/images/icons/icon_涉外收入申报.png", routeName: "", id: "")
    ];
  }

  /// 是否显示本月支出金额
  var showExpenditureValue = false.obs;

  /// 是否显示资产负债金额
  var showAssetsValue = false.obs;

  var showAssetsMore = true.obs;

  var showLeftButton = true.obs;
  var showRightButton = false.obs;

  var time = DateTime.now().obs;

  @override
  void onClose() {
    controller.dispose();
    super.onClose();
  }
}
