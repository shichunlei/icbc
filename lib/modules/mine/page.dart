import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icbc/global/tools.dart';
import 'package:icbc/main.dart';
import 'package:icbc/modules/more/page.dart';
import 'package:icbc/modules/webview/page.dart';
import 'package:icbc/router/router.dart';
import 'package:icbc/widgets/appbar.dart';
import 'package:icbc/widgets/icon_text.dart';
import 'package:intl/intl.dart';

import 'logic.dart';

class MinePage extends StatefulWidget {
  const MinePage({super.key});

  @override
  createState() => _MinePageState();
}

class _MinePageState extends State<MinePage> with AutomaticKeepAliveClientMixin {
  MineLogic get logic => Get.find<MineLogic>();

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
        body: Stack(children: [
      Image.asset("assets/images/mine/mine_personalinfo_bg.webp", width: double.infinity, fit: BoxFit.fitWidth),
      SingleChildScrollView(
          controller: logic.controller,
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Obx(() {
              return Get.find<GlobalController>().isLogin.value
                  ? Container(
                      padding: const EdgeInsets.only(top: 10, left: 8, right: 8),
                      child: Column(children: [
                        SizedBox(height: kToolbarHeight + ScreenUtils.statusBarHeight + 10),
                        Row(children: [
                          const SizedBox(width: 15),
                          ClipOval(
                              child: Image.network(
                                  "https://img1.baidu.com/it/u=332990366,707058763&fm=253&fmt=auto&app=138&f=JPEG?w=380&h=380",
                                  width: 60,
                                  height: 60)),
                          const SizedBox(width: 10),
                          Expanded(
                              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                            Row(children: [
                              const Text("*汉林", style: TextStyle(fontSize: 15, color: Colors.black)),
                              const SizedBox(width: 5),
                              Image.asset("assets/images/icbc_arrow_right.webp", width: 10)
                            ]),
                            const SizedBox(height: 7),
                            Text(
                                "上次登录:${DateFormat("yyyy-MM-dd HH:mm:ss").format(Get.find<GlobalController>().loginTime.value!)}",
                                style: const TextStyle(fontSize: 10, color: Color(0xff666666)))
                          ]))
                        ]),
                        Container(
                            margin: const EdgeInsets.only(top: 20, left: 8, right: 8),
                            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.white),
                            child: Column(children: [
                              const Row(children: [
                                Expanded(
                                    child: Column(children: [
                                  Text("银行卡", style: TextStyle(color: Color(0xff999999), fontSize: 10)),
                                  SizedBox(height: 7),
                                  Text("0", style: TextStyle(color: Colors.black, fontSize: 20))
                                ])),
                                Expanded(
                                    child: Column(children: [
                                  Text("优惠券", style: TextStyle(color: Color(0xff999999), fontSize: 10)),
                                  SizedBox(height: 7),
                                  Text("0", style: TextStyle(color: Colors.black, fontSize: 20))
                                ])),
                                Expanded(
                                    child: Column(children: [
                                  Text("积分", style: TextStyle(color: Color(0xff999999), fontSize: 10)),
                                  SizedBox(height: 7),
                                  Text("0", style: TextStyle(color: Colors.black, fontSize: 20))
                                ])),
                                Expanded(
                                    child: Column(children: [
                                  Text("立减金", style: TextStyle(color: Color(0xff999999), fontSize: 10)),
                                  SizedBox(height: 7),
                                  Text("0", style: TextStyle(color: Colors.black, fontSize: 20))
                                ])),
                                Expanded(
                                    child: Column(children: [
                                  Text("绿色能量", style: TextStyle(color: Color(0xff999999), fontSize: 10)),
                                  SizedBox(height: 7),
                                  Text("0", style: TextStyle(color: Colors.black, fontSize: 20))
                                ]))
                              ]),
                              Container(
                                  margin: const EdgeInsets.only(top: 10),
                                  width: double.infinity,
                                  child: Image.asset("assets/images/mine/icon_level.png",
                                      width: double.infinity, fit: BoxFit.fitWidth))
                            ]))
                      ]))
                  : Container(
                      alignment: Alignment.center,
                      child: Column(children: [
                        SizedBox(height: kToolbarHeight + ScreenUtils.statusBarHeight + 10),
                        Image.asset("assets/images/mine/mine_info_icon.webp", width: 60, height: 60),
                        const Padding(
                            padding: EdgeInsets.all(5),
                            child: Text("登陆后可查看您的资产情况", style: TextStyle(fontSize: 13, color: Color(0xff999999)))),
                        Center(
                            child: GestureDetector(
                                onTap: () {
                                  Get.find<GlobalController>().login();
                                },
                                child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        border: Border.all(width: .5, color: const Color(0xff8E100B))),
                                    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 7),
                                    child:
                                        const Text("点击登录", style: TextStyle(fontSize: 15, color: Color(0xff8E100B)))))),
                        const SizedBox(height: 10)
                      ]));
            }),
            Container(
                margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                padding: const EdgeInsets.only(top: 10, left: 8, right: 8),
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.white),
                child: Row(children: [
                  const IconTextView(text: "月度账单", imagePath: "assets/images/icons/icon_月度账单.png"),
                  const IconTextView(text: "订单", imagePath: "assets/images/icons/icon_订单.png"),
                  IconTextView(
                      text: "成长嘉年华",
                      imagePath: "assets/images/icons/icon_成长嘉年华.png",
                      onTap: () {
                        Get.to(() => WebViewPage(
                            url: "https://m.icbc.com.cn/column/1004789036822515713.html?shareuser=040800048542241",
                            title: "成长嘉年华"));
                      }),
                  const IconTextView(text: "投诉咨询", imagePath: "assets/images/icons/icon_投诉咨询.png"),
                  IconTextView(
                      text: "更多",
                      imagePath: "assets/images/icons/icon_更多.png",
                      onTap: () {
                        Get.to(() => CardMorePage(list: logic.items));
                      })
                ])),
            Obx(() => Get.find<GlobalController>().isLogin.value
                ? Column(children: [buildAssetsAndLiabilities(), buildMonthExpenditure()])
                : const SizedBox(height: 10)),
            Container(
                margin: const EdgeInsets.symmetric(horizontal: 15),
                padding: const EdgeInsets.only(top: 10, left: 8, right: 8, bottom: 10),
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.white),
                child: Column(children: [
                  SizedBox(
                      height: 40,
                      child: Row(children: [
                        const Text("安全中心",
                            style: TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.w500)),
                        Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            child: Image.asset("assets/images/mine/security_center_tip.png", width: 17)),
                        const Text("实时保护中", style: TextStyle(color: Color(0xff006748), fontSize: 13)),
                        const Spacer(),
                        const Text("更多", style: TextStyle(color: Color(0xff999999), fontSize: 13))
                      ])),
                  Stack(children: [
                    Image.asset("assets/images/mine/safe_center_detect_after.png",
                        width: double.infinity, fit: BoxFit.fitWidth),
                    Container(
                        padding: const EdgeInsets.only(left: 15),
                        height: (1.sw - 46) / 975 * 225,
                        alignment: Alignment.centerLeft,
                        child: const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text("安全监测 安心保障", style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500)),
                              SizedBox(height: 5),
                              Text("建议每周监测", style: TextStyle(color: Color(0xff999999), fontSize: 12))
                            ]))
                  ]),
                  const SizedBox(height: 10),
                  const Row(children: [
                    IconTextView(text: "登录管理", imagePath: "assets/images/icons/icon_登录管理.png", size: Size(40, 40)),
                    IconTextView(
                        text: "安全介质\n管理", imagePath: "assets/images/icons/icon_安全介质管理.png", size: Size(40, 40)),
                    IconTextView(text: "支付限额", imagePath: "assets/images/icons/icon_支付限额.png", size: Size(40, 40)),
                    IconTextView(text: "账户安全锁", imagePath: "assets/images/icons/icon_账户安全锁.png", size: Size(40, 40)),
                  ])
                ])),
            const SizedBox(height: 20)
          ])),
      Obx(() => CustomAppBar(
          opacity: logic.appBarOpacity.value,
          imagePathB: "assets/images/set_mine_black.png",
          imagePathW: "assets/images/set_mine_light.png",
          isMine: true))
    ]));
  }

  @override
  bool get wantKeepAlive => true;

  /// 本月支出
  Widget buildMonthExpenditure() {
    return Container(
        margin: const EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 10),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10)),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(children: [
            const Text("本月支出", textAlign: TextAlign.start, style: TextStyle(color: Colors.black, fontSize: 15)),
            const SizedBox(width: 5),
            Image.asset("assets/images/tip_image_blue.png", width: 15),
            const SizedBox(width: 10),
            GestureDetector(onTap: () {
              logic.showExpenditureValue.toggle();
            }, child: Obx(() {
              return Image.asset(
                  logic.showExpenditureValue.value ? "assets/images/eye_open.png" : "assets/images/eye_close.png",
                  width: 18);
            }))
          ]),
          const SizedBox(height: 10),
          const Row(children: [
            Expanded(
                child: Text("本月收入(元)",
                    textAlign: TextAlign.start, style: TextStyle(color: Color(0xff999999), fontSize: 12))),
            Expanded(
                child:
                    Text("本月支出(元)", textAlign: TextAlign.end, style: TextStyle(color: Color(0xff999999), fontSize: 12)))
          ]),
          const SizedBox(height: 5),
          Obx(() {
            return Row(children: [
              Expanded(
                  child: Text(logic.showExpenditureValue.value ? "${logic.inComeMoney}" : "****",
                      textAlign: TextAlign.start, style: const TextStyle(color: Colors.black, fontSize: 20))),
              Expanded(
                  child: Text(logic.showExpenditureValue.value ? "${logic.expenditureMoney}" : "****",
                      textAlign: TextAlign.end, style: const TextStyle(color: Colors.black, fontSize: 20)))
            ]);
          }),
          logic.showExpenditureValue.value
              ? Container(
                  margin: const EdgeInsets.symmetric(vertical: 5),
                  height: 2,
                  width: double.infinity,
                  color: const Color(0xffCD0000),
                  child: Row(children: [
                    Container(
                        height: 2,
                        width: (1.sw - 50) / (logic.inComeMoney + logic.expenditureMoney) * logic.inComeMoney,
                        color: const Color(0xffCD0000)),
                    Expanded(child: Container(height: 2, width: double.infinity, color: const Color(0xff378179)))
                  ]))
              : const SizedBox.shrink(),
          logic.showExpenditureValue.value
              ? Align(
                  alignment: Alignment.centerRight,
                  child: RichText(
                      text: TextSpan(children: [
                    const TextSpan(text: "本月结余 "),
                    TextSpan(
                        text: (logic.inComeMoney - logic.expenditureMoney).toStringAsFixed(2),
                        style: TextStyle(
                            color: logic.inComeMoney - logic.expenditureMoney > 0
                                ? const Color(0xffCD0000)
                                : const Color(0xff378179),
                            fontSize: 14))
                  ], style: const TextStyle(color: Color(0xff999999), fontSize: 12))))
              : const SizedBox.shrink()
        ]));
  }

  /// 资产负债
  Widget buildAssetsAndLiabilities() {
    return Container(
        padding: const EdgeInsets.only(bottom: 15),
        margin: const EdgeInsets.symmetric(horizontal: 15),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.white),
        child: Column(children: [
          Container(
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
                  gradient: LinearGradient(colors: [Color(0xffF5F6F7), Color(0xffF5F6F8)])),
              padding: const EdgeInsets.only(left: 10, top: 5, bottom: 5),
              alignment: Alignment.centerLeft,
              child: Text("时间:${DateFormat("yyyy-MM-dd HH:mm:ss").format(logic.time.value)}",
                  style: const TextStyle(fontSize: 10, color: Color(0xff999999)))),
          Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
              child: Row(children: [
                const Text("资产负债", textAlign: TextAlign.start, style: TextStyle(color: Colors.black, fontSize: 15)),
                const SizedBox(width: 5),
                Image.asset("assets/images/tip_image_blue.png", width: 15),
                const SizedBox(width: 10),
                GestureDetector(onTap: () {
                  logic.showAssetsValue.toggle();
                }, child: Obx(() {
                  return Image.asset(
                      logic.showAssetsValue.value ? "assets/images/eye_open.png" : "assets/images/eye_close.png",
                      width: 18);
                })),
                const Spacer(),
                GestureDetector(
                    onTap: () {
                      Get.toNamed(AppRouter.minePages.assetsRoute.name);
                    },
                    child: const Text("详情", style: TextStyle(color: Color(0xff999999), fontSize: 12)))
              ])),
          Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  gradient: const LinearGradient(
                      colors: [Colors.white, Color(0xffF7F7F7)],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter)),
              margin: const EdgeInsets.only(left: 10, right: 10, top: 10),
              child: Obx(() {
                return Stack(clipBehavior: Clip.none, children: [
                  Positioned(
                      left: 0,
                      right: 0,
                      top: -10,
                      child: logic.showLeftButton.value && logic.showAssetsMore.value
                          ? Image.asset("assets/images/mine/icon_assets_floor_left_bg.png")
                          : const SizedBox.shrink()),
                  Positioned(
                      left: 0,
                      right: 0,
                      top: -10,
                      child: logic.showRightButton.value && logic.showAssetsMore.value
                          ? Image.asset("assets/images/mine/icon_assets_floor_right_bg.png")
                          : const SizedBox.shrink()),
                  Column(children: [
                    Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                      const SizedBox(width: 10),
                      Expanded(
                          child: GestureDetector(
                              onTap: () {
                                logic.showRightButton.value = false;
                                logic.showLeftButton.value = true;
                                logic.showAssetsMore.value = true;
                              },
                              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                                const Padding(
                                    padding: EdgeInsets.only(left: 5),
                                    child: Text("总资产(元)",
                                        textAlign: TextAlign.start,
                                        style: TextStyle(color: Color(0xff999999), fontSize: 12))),
                                const SizedBox(height: 5),
                                Padding(
                                    padding: const EdgeInsets.only(left: 5),
                                    child: Text(
                                        logic.showAssetsValue.value
                                            ? "${Get.find<GlobalController>().balanceStr}"
                                            : "****",
                                        textAlign: TextAlign.start,
                                        style: const TextStyle(color: Colors.black, fontSize: 20))),
                                Visibility(
                                    maintainSize: true,
                                    maintainAnimation: true,
                                    maintainState: true,
                                    visible: logic.showLeftButton.value &&
                                        logic.showAssetsMore.value &&
                                        logic.showAssetsValue.value,
                                    child: Row(mainAxisSize: MainAxisSize.min, children: [
                                      Container(
                                          height: 20,
                                          padding: const EdgeInsets.only(left: 5, right: 5, bottom: 1),
                                          alignment: Alignment.bottomCenter,
                                          decoration: const BoxDecoration(
                                              image: DecorationImage(
                                                  fit: BoxFit.fill,
                                                  image: AssetImage(
                                                      "assets/images/mine/icon_assets_floor__asset_unit.9.png"))),
                                          child: const Text("十万",
                                              style: TextStyle(color: Color(0xffCD0000), fontSize: 10)))
                                    ]))
                              ]))),
                      Expanded(
                          child: GestureDetector(
                              behavior: HitTestBehavior.translucent,
                              onTap: () {
                                logic.showRightButton.value = true;
                                logic.showLeftButton.value = false;
                                logic.showAssetsMore.value = true;
                              },
                              child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
                                const Text("总负债(元)",
                                    textAlign: TextAlign.end, style: TextStyle(color: Color(0xff999999), fontSize: 12)),
                                const SizedBox(height: 5),
                                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                                  Padding(
                                      padding: const EdgeInsets.only(left: 5),
                                      child: Text(logic.showAssetsValue.value ? "1,000.02" : "****",
                                          textAlign: TextAlign.end,
                                          style: const TextStyle(color: Colors.black, fontSize: 20))),
                                  Visibility(
                                      maintainSize: true,
                                      maintainAnimation: true,
                                      maintainState: true,
                                      visible: logic.showRightButton.value &&
                                          logic.showAssetsMore.value &&
                                          logic.showAssetsValue.value,
                                      child: Row(mainAxisSize: MainAxisSize.min, children: [
                                        Container(
                                            height: 20,
                                            padding: const EdgeInsets.only(left: 5, right: 5, bottom: 1),
                                            alignment: Alignment.bottomCenter,
                                            decoration: const BoxDecoration(
                                                image: DecorationImage(
                                                    fit: BoxFit.fill,
                                                    image: AssetImage(
                                                        "assets/images/mine/icon_assets_floor_debt_unit.9.png"))),
                                            child: const Text("千",
                                                style: TextStyle(color: Color(0xff378179), fontSize: 10)))
                                      ]))
                                ])
                              ]))),
                      const SizedBox(width: 15)
                    ]),
                    ...logic.showAssetsMore.value
                        ? [
                            const SizedBox(height: 15),
                            logic.showLeftButton.value
                                ? Container(
                                    padding: const EdgeInsets.only(left: 20, right: 20),
                                    child: Column(mainAxisSize: MainAxisSize.min, children: [
                                      Row(children: [
                                        const Text("存款"),
                                        const Spacer(),
                                        Text(logic.showAssetsValue.value
                                            ? "${Get.find<GlobalController>().balanceStr}"
                                            : "****"),
                                        Image.asset("assets/images/icbc_arrow_right.webp", width: 15)
                                      ]),
                                      Row(children: [
                                        Text(logic.showAssetsValue.value ? "100.00%" : "****",
                                            style: const TextStyle(color: Color(0xffCD0000), fontSize: 12)),
                                        const SizedBox(width: 5),
                                        Expanded(
                                            child: Container(
                                                height: 2,
                                                width: double.infinity,
                                                color: logic.showAssetsValue.value
                                                    ? const Color(0xffCD0000)
                                                    : const Color(0xffdddddd)))
                                      ])
                                    ]))
                                : Container(
                                    alignment: Alignment.center,
                                    child: Text(logic.showAssetsValue.value ? "您在我行暂无负债" : "****")),
                          ]
                        : [],
                    const SizedBox(height: 10),
                    const Divider(height: 0, color: Color(0xffeeeeee)),
                    Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                        child: Row(children: [
                          Image.asset("assets/images/mine/icon_mine_assets_diagnosis.png", width: 25),
                          const SizedBox(width: 3),
                          const Expanded(
                              child: Text("给资产做个诊断，实现财富增值", style: TextStyle(color: Color(0xff999999), fontSize: 12))),
                          Container(
                              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(width: .5, color: const Color(0xffA60000))),
                              child: const Text("去诊断", style: TextStyle(color: Color(0xffA60000), fontSize: 12)))
                        ]))
                  ]),
                  Positioned(
                      bottom: -10,
                      left: 0,
                      right: 0,
                      child: Center(
                          child: GestureDetector(
                              onTap: () {
                                logic.showAssetsMore.toggle();
                              },
                              child: Container(
                                  width: 20,
                                  height: 20,
                                  decoration:
                                      BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20)),
                                  child: Obx(() {
                                    return Image.asset(
                                        !logic.showAssetsMore.value
                                            ? "assets/images/rdproduct_down_9.webp"
                                            : "assets/images/rdproduct_up_9.webp",
                                        width: 10);
                                  })))))
                ]);
              }))
        ]));
  }
}
