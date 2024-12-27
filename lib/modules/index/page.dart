import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icbc/modules/credit/page.dart';
import 'package:icbc/modules/home/page.dart';
import 'package:icbc/modules/index/logic.dart';
import 'package:icbc/modules/life/page.dart';
import 'package:icbc/modules/mine/page.dart';
import 'package:icbc/modules/wealth/page.dart';

class IndexPage extends StatelessWidget {
  const IndexPage({super.key});

  IndexLogic get logic => Get.find<IndexLogic>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PageView(
            physics: const NeverScrollableScrollPhysics(),
            controller: logic.pageController,
            children: const [HomePage(), CreditPage(), WealthPage(), LifePage(), MinePage()]),
        bottomNavigationBar: Obx(() {
          return BottomNavigationBar(
              // 底部导航
              items: [
                BottomNavigationBarItem(
                    icon: Image.asset("assets/images/all_8_favor.png", width: 25, height: 25),
                    label: "首页",
                    activeIcon: Image.asset("assets/images/sta_8_favor_press.png", width: 25, height: 25)),
                BottomNavigationBarItem(
                    icon: Image.asset("assets/images/all_8_credit.png", width: 25, height: 25),
                    label: "信用卡",
                    activeIcon: Image.asset("assets/images/sta_8_credit_press.png", width: 25, height: 25)),
                BottomNavigationBarItem(
                    icon: Image.asset("assets/images/all_8_caifu.png", width: 25, height: 25),
                    label: "财富",
                    activeIcon: Image.asset("assets/images/sta_8_caifu_press.png", width: 25, height: 25)),
                BottomNavigationBarItem(
                    icon: Image.asset("assets/images/all_8_life.png", width: 25, height: 25),
                    label: "生活",
                    activeIcon: Image.asset("assets/images/sta_8_life_press.png", width: 25, height: 25)),
                BottomNavigationBarItem(
                    icon: Image.asset("assets/images/all_8_mine.png", width: 25, height: 25),
                    label: "我的",
                    activeIcon: Image.asset("assets/images/sta_8_mine_press.png", width: 25, height: 25)),
              ],
              selectedLabelStyle: const TextStyle(fontSize: 12, color: Color(0xffCF0001)),
              unselectedLabelStyle: const TextStyle(fontSize: 12, color: Color(0xff333333)),
              currentIndex: logic.currentIndex.value,
              type: BottomNavigationBarType.fixed,
              fixedColor: Theme.of(context).primaryColor,
              useLegacyColorScheme: false,
              onTap: (index) {
                logic.currentIndex.value = index;
                logic.pageController.jumpToPage(index);
              });
        }));
  }
}
