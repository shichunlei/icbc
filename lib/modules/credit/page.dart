import 'package:flutter/material.dart';
import 'package:flutter_swiper_null_safety_flutter3/flutter_swiper_null_safety_flutter3.dart';
import 'package:get/get.dart';
import 'package:icbc/modules/more/page.dart';
import 'package:icbc/modules/webview/page.dart';
import 'package:icbc/widgets/appbar.dart';
import 'package:icbc/widgets/icon_text.dart';
import 'package:icbc/widgets/rect_indicator.dart';

import 'logic.dart';

class CreditPage extends StatefulWidget {
  const CreditPage({super.key});

  @override
  createState() => _CreditPageState();
}

class _CreditPageState extends State<CreditPage> with AutomaticKeepAliveClientMixin {
  CreditLogic get logic => Get.find<CreditLogic>();

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
        backgroundColor: const Color(0xffF3F4F6),
        body: Stack(children: [
          SingleChildScrollView(
              controller: logic.controller,
              child: Column(children: [
                Column(mainAxisSize: MainAxisSize.min, children: [
                  Stack(children: [
                    Image.asset("assets/images/card/creditpage_top_bg.webp",
                        fit: BoxFit.fitWidth, width: double.infinity),
                    Positioned(
                        bottom: 0,
                        left: 20,
                        right: 20,
                        child:
                            Image.asset("assets/images/card/bg_信用卡.png", width: double.infinity, fit: BoxFit.fitWidth))
                  ]),
                  Container(
                      height: 200,
                      color: Colors.white,
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      alignment: Alignment.bottomCenter,
                      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                        const Text("真回馈、真减费、真让利"),
                        const SizedBox(height: 5),
                        const Text("多平台消费立减"),
                        Container(
                            margin: const EdgeInsets.only(top: 20),
                            width: 200,
                            height: 40,
                            decoration:
                                BoxDecoration(color: const Color(0xffCD0200), borderRadius: BorderRadius.circular(40)),
                            alignment: Alignment.center,
                            child: const Text("申请信用卡", style: TextStyle(color: Colors.white)))
                      ]))
                ]),
                Container(
                    padding: const EdgeInsets.only(top: 10, bottom: 10),
                    width: double.infinity,
                    height: 170,
                    margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.white),
                    child: Swiper(
                        loop: false,
                        pagination: SwiperCustomPagination(
                            builder: (BuildContext context, SwiperPluginConfig config) => Container(
                                alignment: Alignment.bottomCenter,
                                child: RectIndicator(
                                    count: 2,
                                    height: 3,
                                    position: config.activeIndex,
                                    width: 3,
                                    gap: 5,
                                    activeWidth: 10,
                                    color: const Color(0xff999999),
                                    activeColor: const Color(0xffCD0200)))),
                        itemBuilder: (_, index) {
                          return index == 0
                              ? const Column(children: [
                                  Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                                    IconTextView(text: "申请办卡", imagePath: "assets/images/icons/icon_申请办卡.png"),
                                    IconTextView(text: "申请进度", imagePath: "assets/images/icons/icon_申请进度.png"),
                                    IconTextView(text: "卡片启用", imagePath: "assets/images/icons/icon_卡片启用.png"),
                                    IconTextView(text: "支付聚惠", imagePath: "assets/images/icons/icon_支付聚惠.png"),
                                    IconTextView(text: "家装分期", imagePath: "assets/images/icons/icon_家装分期.png")
                                  ]),
                                  SizedBox(height: 8),
                                  Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                                    IconTextView(text: "分期付款", imagePath: "assets/images/icons/icon_分期付款.png"),
                                    IconTextView(text: "现金分期", imagePath: "assets/images/icons/icon_现金分期.png"),
                                    IconTextView(text: "卡片权益", imagePath: "assets/images/icons/icon_卡片权益.png"),
                                    IconTextView(text: "一键绑卡", imagePath: "assets/images/icons/icon_一键绑卡.png"),
                                    IconTextView(text: "积分兑换", imagePath: "assets/images/icons/icon_积分兑换.png")
                                  ])
                                ])
                              : Column(children: [
                                  const Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                                    IconTextView(text: "自动还款", imagePath: "assets/images/icons/icon_自动还款.png"),
                                    IconTextView(text: "数字卡", imagePath: "assets/images/icons/icon_数字卡.png"),
                                    IconTextView(text: "账户安全锁", imagePath: "assets/images/icons/icon_账户安全锁.png"),
                                    IconTextView(text: "查额度", imagePath: "assets/images/icons/icon_查额度.png"),
                                    IconTextView(text: "年费查询", imagePath: "assets/images/icons/icon_年费查询.png")
                                  ]),
                                  const SizedBox(height: 8),
                                  Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                                    const IconTextView(text: "急用钱", imagePath: "assets/images/icons/icon_急用钱.png"),
                                    const IconTextView(text: "e分期", imagePath: "assets/images/icons/icon_e分期.png"),
                                    const IconTextView(text: "信用报告", imagePath: "assets/images/icons/icon_信用报告.png"),
                                    const IconTextView(text: "分期甄选", imagePath: "assets/images/icons/icon_分期甄选.png"),
                                    IconTextView(
                                        text: "更多",
                                        imagePath: "assets/images/icons/icon_更多.png",
                                        onTap: () {
                                          Get.to(() => CardMorePage(list: logic.items));
                                        })
                                  ])
                                ]);
                        },
                        itemCount: 2)),
                Container(
                    padding: const EdgeInsets.only(top: 20, bottom: 20, left: 15, right: 15),
                    width: double.infinity,
                    margin: const EdgeInsets.symmetric(horizontal: 15),
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.white),
                    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                      const Text("借款专区",
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Colors.black)),
                      Container(
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage("assets/images/card/bg_111.png"), fit: BoxFit.fitWidth)),
                          margin: const EdgeInsets.only(top: 15, bottom: 15),
                          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                          child: Row(children: [
                            const Expanded(
                                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                              Text("账单分期",
                                  style: TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.w600)),
                              Text("还款无忧 最长60期", style: TextStyle(color: Colors.black, fontSize: 12))
                            ])),
                            Container(
                                height: 25,
                                width: 80,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    color: const Color(0xffF1B878), borderRadius: BorderRadius.circular(30)),
                                child: const Text("立即办理",
                                    style: TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.w600))),
                          ])),
                      Row(children: [
                        Expanded(
                            child: Column(children: [
                          Row(children: [
                            Image.asset("assets/images/card/现金分期.png", width: 20),
                            const SizedBox(width: 10),
                            const Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                              Text("现金分期",
                                  style: TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.w600)),
                              Text("最高5万元", style: TextStyle(color: Color(0xff666666), fontSize: 10))
                            ])
                          ]),
                          const SizedBox(height: 15),
                          Row(children: [
                            Image.asset("assets/images/card/一键家装.png", width: 20),
                            const SizedBox(width: 10),
                            const Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                              Text("一键家装",
                                  style: TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.w600)),
                              Text("尊享服务 利率优惠", style: TextStyle(color: Color(0xff666666), fontSize: 10))
                            ])
                          ])
                        ])),
                        Container(width: .5, height: 80, color: Colors.grey, margin: const EdgeInsets.only(right: 15)),
                        Expanded(
                            child: Column(children: [
                          Row(children: [
                            Image.asset("assets/images/card/e分期.png", width: 20),
                            const SizedBox(width: 10),
                            const Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                              Text("e分期",
                                  style: TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.w600)),
                              Text("5折优惠 随心花", style: TextStyle(color: Color(0xff666666), fontSize: 10))
                            ])
                          ]),
                          const SizedBox(height: 15),
                          Row(children: [
                            Image.asset("assets/images/card/分期甄选.png", width: 20),
                            const SizedBox(width: 10),
                            const Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                              Text("分期甄选",
                                  style: TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.w600)),
                              Text("好物推荐 免息分期", style: TextStyle(color: Color(0xff666666), fontSize: 10))
                            ])
                          ])
                        ]))
                      ])
                    ])),
                Padding(
                    padding: const EdgeInsets.all(15),
                    child: SizedBox(
                        height: (MediaQuery.of(context).size.width - 30) * 254 / 1089,
                        child: Swiper(
                            autoplay: true,
                            itemBuilder: (_, index) {
                              return Image.asset("assets/images/card/banner_00${index + 1}.png",
                                  width: double.infinity, fit: BoxFit.fitWidth);
                            },
                            onTap: (int index) {
                              if (index == 0) {
                                Get.to(() => WebViewPage(
                                    url:
                                        "https://m.icbc.com.cn/page/1032240383629242368.html?srcchannel=F-WAPB&transitionid=113d48f25121c073&srcpageurl=aperson%5CcardNew%5CclientNew_creditcard_new_ex_v8.jsp",
                                    title: "工银信用卡爱购华为"));
                              }
                            },
                            itemCount: 3))),
                Container(
                    padding: const EdgeInsets.only(top: 20, bottom: 20, left: 15, right: 15),
                    width: double.infinity,
                    margin: const EdgeInsets.symmetric(horizontal: 15),
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.white),
                    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                      const Text("卡片推荐",
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Colors.black)),
                      Container(
                          margin: const EdgeInsets.only(top: 15, bottom: 15),
                          child: Image.asset("assets/images/card/bg_222.png",
                              width: double.infinity, fit: BoxFit.fitWidth)),
                      Row(children: [
                        Expanded(
                            child: Column(children: [
                          Image.asset("assets/images/card/card_001.png",
                              width: MediaQuery.of(context).size.width / 4.9, fit: BoxFit.fitWidth),
                          const SizedBox(height: 3),
                          const Text("牡丹超惠信用卡",
                              textAlign: TextAlign.center, style: TextStyle(color: Colors.black, fontSize: 12)),
                          const Text("6折透支 6折分期",
                              textAlign: TextAlign.center, style: TextStyle(color: Color(0xff666666), fontSize: 12))
                        ])),
                        Expanded(
                            child: Column(children: [
                          Image.asset("assets/images/card/card_002.png",
                              width: MediaQuery.of(context).size.width / 4.9, fit: BoxFit.fitWidth),
                          const SizedBox(height: 3),
                          const Text("宇宙星座信用卡",
                              textAlign: TextAlign.center, style: TextStyle(color: Colors.black, fontSize: 12)),
                          const Text("解锁你的星座权益",
                              textAlign: TextAlign.center, style: TextStyle(color: Color(0xff666666), fontSize: 12))
                        ])),
                        Expanded(
                            child: Column(children: [
                          Image.asset("assets/images/card/card_003.png",
                              width: MediaQuery.of(context).size.width / 4.9, fit: BoxFit.fitWidth),
                          const SizedBox(height: 3),
                          const Text("无界白金数字卡",
                              textAlign: TextAlign.center, style: TextStyle(color: Colors.black, fontSize: 12)),
                          const Text("1元停车",
                              textAlign: TextAlign.center, style: TextStyle(color: Color(0xff666666), fontSize: 12))
                        ])),
                      ])
                    ])),
                Container(
                    padding: const EdgeInsets.only(top: 20, bottom: 20, left: 15, right: 15),
                    width: double.infinity,
                    margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.white),
                    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                      const Text("活动权益",
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Colors.black)),
                      Container(
                          margin: const EdgeInsets.only(top: 15, bottom: 15),
                          child: Image.asset("assets/images/card/bg_333.png",
                              width: double.infinity, fit: BoxFit.fitWidth)),
                      Row(children: [
                        Expanded(
                            child: Column(children: [
                          Image.asset("assets/images/card/bg_3331.png", width: double.infinity, fit: BoxFit.fitWidth),
                          const SizedBox(height: 10),
                          GestureDetector(
                              onTap: () {
                                Get.to(() => WebViewPage(
                                    url:
                                        "https://m.icbc.com.cn/page/953328306642784256.html?srcchannel=F-WAPB&transitionid=EWFNFKGHHNDYAPADAFAPHDCFANICGIJKABDAHIIK&srcpageurl=%5Cicbc%5Caperson%5CcardNew%5CclientNew_creditcard_new_v8.jsp",
                                    title: "工银信用卡推荐有奖"));
                              },
                              child: Image.asset("assets/images/card/bg_3333.png",
                                  width: double.infinity, fit: BoxFit.fitWidth)),
                        ])),
                        const SizedBox(width: 10),
                        Expanded(
                            child: Column(children: [
                          GestureDetector(
                              onTap: () {
                                Get.to(() => WebViewPage(
                                    url:
                                        "https://m.icbc.com.cn/page/918150652407177216.html?srcchannel=F-WAPB&transitionid=EWFNFKGHHNDYAPADAFAPHDCFANICGIJKABDAHIIK&srcpageurl=%5Cicbc%5Caperson%5CcardNew%5CclientNew_creditcard_new_v8.jsp",
                                    title: "工银爱享礼"));
                              },
                              child: Image.asset("assets/images/card/bg_3332.png",
                                  width: double.infinity, fit: BoxFit.fitWidth)),
                          const SizedBox(height: 10),
                          GestureDetector(
                              onTap: () {
                                Get.to(() => WebViewPage(
                                    url:
                                        "https://m.icbc.com.cn/page/923139449272041472.html?srcchannel=F-WAPB&transitionid=EWFNFKGHHNDYAPADAFAPHDCFANICGIJKABDAHIIK&srcpageurl=%5Cicbc%5Caperson%5CcardNew%5CclientNew_creditcard_new_v8.jsp",
                                    title: "出行权益"));
                              },
                              child: Image.asset("assets/images/card/bg_3334.png",
                                  width: double.infinity, fit: BoxFit.fitWidth)),
                        ]))
                      ])
                    ]))
              ])),
          Obx(() {
            return CustomAppBar(opacity: logic.appBarOpacity.value);
          })
        ]));
  }

  @override
  bool get wantKeepAlive => true;
}
