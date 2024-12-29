import 'package:flutter/material.dart';
import 'package:flutter_swiper_null_safety_flutter3/flutter_swiper_null_safety_flutter3.dart';
import 'package:get/get.dart';
import 'package:icbc/modules/more/page.dart';
import 'package:icbc/modules/webview/page.dart';
import 'package:icbc/widgets/appbar.dart';
import 'package:icbc/widgets/custom_sticky_header_delegate.dart';
import 'package:icbc/widgets/icon_text.dart';
import 'package:icbc/widgets/rect_indicator.dart';

import 'logic.dart';

class WealthPage extends StatefulWidget {
  const WealthPage({super.key});

  @override
  createState() => _WealthPageState();
}

class _WealthPageState extends State<WealthPage> with AutomaticKeepAliveClientMixin {
  WealthLogic get logic => Get.find<WealthLogic>();

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
        backgroundColor: const Color(0xffF3F4F6),
        body: Stack(children: [
          // ExtendedNestedScrollView(
          //     controller: logic.controller,
          //     pinnedHeaderSliverHeightBuilder: () {
          //       return kToolbarHeight + 50 + MediaQuery.of(context).padding.top;
          //     },
          //     headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          //       print("===================>$innerBoxIsScrolled");
          //
          //       return [
          //         // SliverAppBar(
          //         //     pinned: true,
          //         //     elevation: 0,
          //         //     backgroundColor: Colors.transparent,
          //         //     automaticallyImplyLeading: false,
          //         //     expandedHeight: MediaQuery.of(context).size.width * 750 / 1125,
          //         //     forceElevated: !innerBoxIsScrolled,
          //         //     flexibleSpace: FlexibleSpaceBar(
          //         //         background: Stack(children: [
          //         //       Image.asset("assets/images/wealth/invest9_bg.webp",
          //         //           fit: BoxFit.fitWidth, width: double.infinity),
          //         //       Positioned(
          //         //           bottom: 0,
          //         //           left: 20,
          //         //           right: 20,
          //         //           child: Image.asset("assets/images/card/bg_信用卡.png",
          //         //               width: double.infinity, fit: BoxFit.fitWidth))
          //         //     ]))),
          //         SliverToBoxAdapter(
          //             child: Column(children: [
          //           Stack(children: [
          //             Image.asset("assets/images/wealth/invest9_bg.webp", fit: BoxFit.fitWidth, width: double.infinity),
          //             Positioned(
          //                 bottom: 0,
          //                 left: 20,
          //                 right: 20,
          //                 child: Image.asset("assets/images/card/bg_信用卡.png",
          //                     width: double.infinity, fit: BoxFit.fitWidth))
          //           ]),
          //           Container(
          //               padding: EdgeInsets.only(top: 10, bottom: 10),
          //               width: double.infinity,
          //               height: 170,
          //               margin: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          //               decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.white),
          //               child: Swiper(
          //                   loop: false,
          //                   pagination: SwiperCustomPagination(
          //                       builder: (BuildContext context, SwiperPluginConfig config) => Container(
          //                           alignment: Alignment.bottomCenter,
          //                           child: RectIndicator(
          //                               count: 2,
          //                               height: 3,
          //                               position: config.activeIndex,
          //                               width: 3,
          //                               gap: 5,
          //                               activeWidth: 10,
          //                               color: Color(0xff999999),
          //                               activeColor: Color(0xffCD0200)))),
          //                   itemBuilder: (_, index) {
          //                     return index == 0
          //                         ? Column(children: [
          //                             Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          //                               IconTextView(text: "风险能力\n评测", imagePath: "assets/images/icons/icon_风险能力评测.png"),
          //                               IconTextView(text: "存款", imagePath: "assets/images/icons/icon_存款.png"),
          //                               IconTextView(text: "理财", imagePath: "assets/images/icons/icon_理财.png"),
          //                               IconTextView(text: "基金", imagePath: "assets/images/icons/icon_基金.png"),
          //                               IconTextView(text: "贵金属", imagePath: "assets/images/icons/icon_贵金属.png")
          //                             ]),
          //                             SizedBox(height: 8),
          //                             Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          //                               IconTextView(text: "保险", imagePath: "assets/images/icons/icon_保险.png"),
          //                               IconTextView(text: "结售汇", imagePath: "assets/images/icons/icon_结售汇.png"),
          //                               IconTextView(text: "外币兑换", imagePath: "assets/images/icons/icon_外币兑换.png"),
          //                               IconTextView(text: "证券", imagePath: "assets/images/icons/icon_证券.png"),
          //                               IconTextView(text: "储蓄国债", imagePath: "assets/images/icons/icon_储蓄国债.png")
          //                             ])
          //                           ])
          //                         : Column(children: [
          //                             Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          //                               IconTextView(text: "资产诊断", imagePath: "assets/images/icons/icon_资产诊断.png"),
          //                               IconTextView(text: "柜台债券", imagePath: "assets/images/icons/icon_柜台债券.png"),
          //                               IconTextView(text: "实物贵金属", imagePath: "assets/images/icons/icon_实物贵金属.png"),
          //                               IconTextView(text: "账户能源", imagePath: "assets/images/icons/icon_账户能源.png"),
          //                               IconTextView(text: "AI投", imagePath: "assets/images/icons/icon_AI投.png")
          //                             ]),
          //                             SizedBox(height: 8),
          //                             Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          //                               IconTextView(text: "产品信息\n查询", imagePath: "assets/images/icons/icon_产品信息查询.png"),
          //                               IconTextView(text: "外汇买卖", imagePath: "assets/images/icons/icon_外汇买卖.png"),
          //                               IconTextView(text: "积存贵金属", imagePath: "assets/images/icons/icon_积存贵金属.png"),
          //                               IconTextView(text: "账户基本\n金属", imagePath: "assets/images/icons/icon_账户基本金属.png"),
          //                               IconTextView(text: "更多", imagePath: "assets/images/icons/icon_更多.png", onTap: () {})
          //                             ])
          //                           ]);
          //                   },
          //                   itemCount: 2)),
          //           Container(
          //               margin: EdgeInsets.symmetric(horizontal: 15),
          //               decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: Colors.white),
          //               padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          //               child: Column(mainAxisSize: MainAxisSize.min, children: [
          //                 Row(children: [
          //                   Text("财富精选", style: TextStyle(fontSize: 15, color: Colors.black)),
          //                   const Spacer(),
          //                   Text("更多精选 快来研选", style: TextStyle(fontSize: 13, color: Color(0xff666666)))
          //                 ]),
          //                 Container(
          //                     alignment: Alignment.centerLeft,
          //                     height: 40,
          //                     child: ListView.separated(
          //                         padding: EdgeInsets.symmetric(vertical: 5),
          //                         scrollDirection: Axis.horizontal,
          //                         itemBuilder: (_, index) {
          //                           return Row(mainAxisSize: MainAxisSize.min, children: [
          //                             GestureDetector(onTap: () {
          //                               logic.selectTagIndex.value = index;
          //                             }, child: Obx(() {
          //                               return Container(
          //                                   height: 30,
          //                                   padding: EdgeInsets.symmetric(horizontal: 15),
          //                                   alignment: Alignment.center,
          //                                   decoration: BoxDecoration(
          //                                       borderRadius: BorderRadius.circular(30),
          //                                       color: logic.selectTagIndex.value == index
          //                                           ? Color(0xffFCF2F2)
          //                                           : Colors.grey[100]),
          //                                   child: Text(logic.tags[index],
          //                                       style: TextStyle(
          //                                           color: logic.selectTagIndex.value == index
          //                                               ? Color(0xffBF0802)
          //                                               : Color(0xff666666),
          //                                           fontSize: 12,
          //                                           fontWeight: FontWeight.w400)));
          //                             }))
          //                           ]);
          //                         },
          //                         separatorBuilder: (_, index) {
          //                           return SizedBox(width: 5);
          //                         },
          //                         itemCount: logic.tags.length))
          //               ])),
          //           Container(
          //               margin: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          //               decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: Colors.white),
          //               padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          //               child: Column(
          //                   crossAxisAlignment: CrossAxisAlignment.start,
          //                   mainAxisSize: MainAxisSize.min,
          //                   children: [
          //                     Text("四笔钱", style: TextStyle(fontSize: 15, color: Colors.black)),
          //                     Container(
          //                         alignment: Alignment.centerLeft,
          //                         height: 40,
          //                         child: ListView.separated(
          //                             padding: EdgeInsets.symmetric(vertical: 5),
          //                             scrollDirection: Axis.horizontal,
          //                             itemBuilder: (_, index) {
          //                               return Row(mainAxisSize: MainAxisSize.min, children: [
          //                                 GestureDetector(onTap: () {
          //                                   logic.selectFourIndex.value = index;
          //                                 }, child: Obx(() {
          //                                   return Container(
          //                                       height: 30,
          //                                       padding: EdgeInsets.symmetric(horizontal: 15),
          //                                       alignment: Alignment.center,
          //                                       decoration: BoxDecoration(
          //                                           borderRadius: BorderRadius.circular(30),
          //                                           color: logic.selectFourIndex.value == index
          //                                               ? Color(0xffFCF2F2)
          //                                               : Colors.grey[100]),
          //                                       child: Text(logic.four[index],
          //                                           style: TextStyle(
          //                                               color: logic.selectFourIndex.value == index
          //                                                   ? Color(0xffBF0802)
          //                                                   : Color(0xff666666),
          //                                               fontSize: 12,
          //                                               fontWeight: FontWeight.w400)));
          //                                 }))
          //                               ]);
          //                             },
          //                             separatorBuilder: (_, index) {
          //                               return SizedBox(width: 5);
          //                             },
          //                             itemCount: logic.four.length))
          //                   ])),
          //           Container(
          //               margin: EdgeInsets.symmetric(horizontal: 15),
          //               decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: Colors.white),
          //               padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          //               child: Column(mainAxisSize: MainAxisSize.min, children: [
          //                 Row(children: [
          //                   Text("财富活动", style: TextStyle(fontSize: 15, color: Colors.black)),
          //                   const Spacer(),
          //                   Text("更多活动 快来参加", style: TextStyle(fontSize: 13, color: Color(0xff666666)))
          //                 ]),
          //
          //                 /// 轮播
          //                 Container(
          //                   alignment: Alignment.centerLeft,
          //                   height: 80,
          //                 )
          //               ])),
          //           Container(
          //               margin: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          //               decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: Colors.white),
          //               padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          //               child: Column(mainAxisSize: MainAxisSize.min, children: [
          //                 Row(children: [
          //                   Text("财富聚焦", style: TextStyle(fontSize: 16, color: Colors.black)),
          //                   const Spacer(),
          //                   Text("更多精彩 快来社区", style: TextStyle(fontSize: 14, color: Color(0xff666666)))
          //                 ]),
          //
          //                 /// 轮播
          //                 Container(
          //                   alignment: Alignment.centerLeft,
          //                   height: 150,
          //                 )
          //               ])),
          //           Container(
          //               margin: EdgeInsets.symmetric(horizontal: 15),
          //               decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: Colors.white),
          //               padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          //               child: Column(mainAxisSize: MainAxisSize.min, children: [
          //                 Row(children: [
          //                   Text("财富学苑",
          //                       style: TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.w600)),
          //                   const Spacer(),
          //                   Text("更多知识 快来学习", style: TextStyle(fontSize: 14, color: Color(0xff666666)))
          //                 ]),
          //
          //                 /// 轮播
          //                 Container(
          //                   alignment: Alignment.centerLeft,
          //                   height: 150,
          //                 )
          //               ]))
          //         ])),
          //         SliverPersistentHeader(
          //             delegate: CustomSliverPersistentHeaderDelegate(
          //                 secondColor: Color(0xffF3F4F6),
          //                 child: Container(
          //                     height: 60,
          //                     decoration: BoxDecoration(color: Colors.transparent),
          //                     child: TabBar(
          //                         dividerColor: Colors.transparent,
          //                         indicatorColor: Colors.transparent,
          //                         dividerHeight: 60,
          //                         tabs: logic.tabs,
          //                         controller: logic.tabController,
          //                         unselectedLabelStyle: TextStyle(fontSize: 15, color: Color(0xff666666)),
          //                         labelStyle: TextStyle(fontSize: 15, color: Colors.black, fontWeight: FontWeight.w600),
          //                         indicatorSize: TabBarIndicatorSize.label,
          //                         tabAlignment: TabAlignment.fill))),
          //             pinned: true)
          //       ];
          //     },
          //     body: TabBarView(controller: logic.tabController, children: [
          //       SingleChildScrollView(
          //           child: Image.asset("assets/images/wealth/tabview_001.jpg",
          //               width: double.infinity, fit: BoxFit.fitWidth)),
          //       SingleChildScrollView(
          //           child: Image.asset("assets/images/wealth/tabview_002.jpg",
          //               width: double.infinity, fit: BoxFit.fitWidth)),
          //       SingleChildScrollView(
          //           child: Image.asset("assets/images/wealth/tabview_003.jpg",
          //               width: double.infinity, fit: BoxFit.fitWidth)),
          //       SingleChildScrollView(
          //           child: Image.asset("assets/images/wealth/tabview_004.jpg",
          //               width: double.infinity, fit: BoxFit.fitWidth))
          //     ])),
          CustomScrollView(controller: logic.controller, slivers: [
            SliverAppBar(
                pinned: true,
                elevation: 0,
                backgroundColor: Colors.transparent,
                automaticallyImplyLeading: false,
                expandedHeight: MediaQuery.of(context).size.width * 750 / 1125 - kToolbarHeight,
                flexibleSpace: FlexibleSpaceBar(
                    background: Stack(children: [
                  Image.asset("assets/images/wealth/invest9_bg.webp", fit: BoxFit.fitWidth, width: double.infinity),
                  Positioned(
                      bottom: 0,
                      left: 20,
                      right: 20,
                      child: Image.asset("assets/images/wealth/top.png", width: double.infinity, fit: BoxFit.fitWidth))
                ]))),
            SliverToBoxAdapter(
                child: Column(children: [
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
                                  IconTextView(text: "风险能力\n评测", imagePath: "assets/images/icons/icon_风险能力评测.png"),
                                  IconTextView(text: "存款", imagePath: "assets/images/icons/icon_存款.png"),
                                  IconTextView(text: "理财", imagePath: "assets/images/icons/icon_理财.png"),
                                  IconTextView(text: "基金", imagePath: "assets/images/icons/icon_基金.png"),
                                  IconTextView(text: "贵金属", imagePath: "assets/images/icons/icon_贵金属.png")
                                ]),
                                SizedBox(height: 8),
                                Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                                  IconTextView(text: "保险", imagePath: "assets/images/icons/icon_保险.png"),
                                  IconTextView(text: "结售汇", imagePath: "assets/images/icons/icon_结售汇.png"),
                                  IconTextView(text: "外币兑换", imagePath: "assets/images/icons/icon_外币兑换.png"),
                                  IconTextView(text: "证券", imagePath: "assets/images/icons/icon_证券.png"),
                                  IconTextView(text: "储蓄国债", imagePath: "assets/images/icons/icon_储蓄国债.png")
                                ])
                              ])
                            : Column(children: [
                                const Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                                  IconTextView(text: "资产诊断", imagePath: "assets/images/icons/icon_资产诊断.png"),
                                  IconTextView(text: "柜台债券", imagePath: "assets/images/icons/icon_柜台债券.png"),
                                  IconTextView(text: "实物贵金属", imagePath: "assets/images/icons/icon_实物贵金属.png"),
                                  IconTextView(text: "账户能源", imagePath: "assets/images/icons/icon_账户能源.png"),
                                  IconTextView(text: "AI投", imagePath: "assets/images/icons/icon_AI投.png")
                                ]),
                                const SizedBox(height: 8),
                                Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                                  const IconTextView(
                                      text: "产品信息\n查询", imagePath: "assets/images/icons/icon_产品信息查询.png"),
                                  const IconTextView(text: "外汇买卖", imagePath: "assets/images/icons/icon_外汇买卖.png"),
                                  const IconTextView(text: "积存贵金属", imagePath: "assets/images/icons/icon_积存贵金属.png"),
                                  const IconTextView(
                                      text: "账户基本\n金属", imagePath: "assets/images/icons/icon_账户基本金属.png"),
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
                  margin: const EdgeInsets.symmetric(horizontal: 15),
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: Colors.white),
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: Column(mainAxisSize: MainAxisSize.min, children: [
                    const Row(children: [
                      SizedBox(width: 10),
                      Text("财富精选", style: TextStyle(fontSize: 15, color: Colors.black)),
                      Spacer(),
                      Text("更多精选 快来研选", style: TextStyle(fontSize: 13, color: Color(0xff666666))),
                      SizedBox(width: 10)
                    ]),
                    Container(
                        alignment: Alignment.centerLeft,
                        height: 40,
                        child: ListView.separated(
                            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (_, index) {
                              return Row(mainAxisSize: MainAxisSize.min, children: [
                                GestureDetector(onTap: () {
                                  logic.selectTagIndex.value = index;
                                }, child: Obx(() {
                                  return Container(
                                      height: 30,
                                      padding: const EdgeInsets.symmetric(horizontal: 15),
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(30),
                                          color: logic.selectTagIndex.value == index
                                              ? const Color(0xffFCF2F2)
                                              : Colors.grey[100]),
                                      child: Text(logic.tags[index],
                                          style: TextStyle(
                                              color: logic.selectTagIndex.value == index
                                                  ? const Color(0xffBF0802)
                                                  : const Color(0xff666666),
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400)));
                                }))
                              ]);
                            },
                            separatorBuilder: (_, index) {
                              return const SizedBox(width: 5);
                            },
                            itemCount: logic.tags.length)),
                    Obx(() {
                      return GestureDetector(
                          onTap: () {
                            if (logic.selectTagIndex.value == 0) {
                              Get.to(() => WebViewPage(
                                  url:
                                      "https://imes.mims.icbc.com.cn/ICBCESCommunityWEB/#/home?pageid=833c03a02c4c41a193843e53b9d4f662&isWechat=1",
                                  title: "个人养老金可投指数基金啦"));
                            }
                            if (logic.selectTagIndex.value == 4) {
                              Get.to(() => WebViewPage(
                                  url: "https://m.icbc.com.cn/mpage/finance/detail?productId=21GS2686", title: "产品详情"));
                            }
                          },
                          child: Image.asset("assets/images/wealth/tag_00${logic.selectTagIndex.value + 1}.jpg",
                              width: double.infinity, fit: BoxFit.fitWidth));
                    })
                  ])),
              Container(
                  margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: Colors.white),
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                  child:
                      Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisSize: MainAxisSize.min, children: [
                    const Text("四笔钱", style: TextStyle(fontSize: 15, color: Colors.black)),
                    const SizedBox(height: 5),
                    Container(
                        alignment: Alignment.centerLeft,
                        height: 40,
                        child: ListView.separated(
                            padding: EdgeInsets.symmetric(vertical: 5),
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (_, index) {
                              return Row(mainAxisSize: MainAxisSize.min, children: [
                                GestureDetector(onTap: () {
                                  logic.selectFourIndex.value = index;
                                }, child: Obx(() {
                                  return Container(
                                      height: 30,
                                      padding: const EdgeInsets.symmetric(horizontal: 15),
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(30),
                                          color: logic.selectFourIndex.value == index
                                              ? const Color(0xffFCF2F2)
                                              : Colors.grey[100]),
                                      child: Text(logic.four[index],
                                          style: TextStyle(
                                              color: logic.selectFourIndex.value == index
                                                  ? const Color(0xffBF0802)
                                                  : const Color(0xff666666),
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400)));
                                }))
                              ]);
                            },
                            separatorBuilder: (_, index) {
                              return const SizedBox(width: 5);
                            },
                            itemCount: logic.four.length)),
                    const SizedBox(height: 10),
                    Obx(() => logic.selectFourIndex.value == 0
                        ? Stack(children: [
                            Image.asset("assets/images/wealth/first_money.png",
                                width: double.infinity, fit: BoxFit.fitWidth),
                            Container(
                                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                                child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      const Text("智慧产品，财富增长，让生活更美好",
                                          style: TextStyle(color: Color(0xff685141), fontSize: 14)),
                                      const SizedBox(height: 20),
                                      RichText(
                                          text: TextSpan(children: [
                                        const TextSpan(text: "工银理财•添利宝现金管理类开放净值型理财产品2号（21GS2699）"),
                                        WidgetSpan(
                                            child: Row(mainAxisSize: MainAxisSize.min, children: [
                                          Container(
                                              alignment: Alignment.center,
                                              padding: const EdgeInsets.symmetric(horizontal: 5),
                                              decoration: BoxDecoration(
                                                  color: const Color(0xffF0F4FC),
                                                  borderRadius: BorderRadius.circular(4)),
                                              child: const Text("理财",
                                                  style: TextStyle(
                                                      color: Color(0xff4168B2),
                                                      fontSize: 12,
                                                      fontWeight: FontWeight.w500)))
                                        ]))
                                      ], style: const TextStyle(color: Colors.black, height: 1.8))),
                                      const SizedBox(height: 15),
                                      Row(children: [
                                        Expanded(
                                            flex: 3,
                                            child: RichText(
                                                text: const TextSpan(
                                                    children: [
                                                  TextSpan(text: "1.4238", style: TextStyle(fontSize: 18)),
                                                  TextSpan(text: "%", style: TextStyle(fontSize: 14))
                                                ],
                                                    style: TextStyle(
                                                        color: Color(0xffC63138), fontWeight: FontWeight.w500)))),
                                        const Expanded(
                                            flex: 5,
                                            child: Text("随时申赎，活钱添利",
                                                style: TextStyle(
                                                    color: Colors.black, fontSize: 15, fontWeight: FontWeight.w500)))
                                      ]),
                                      const SizedBox(height: 5),
                                      const Row(children: [
                                        Expanded(
                                            flex: 3,
                                            child: Text("七日年化收益率",
                                                style: TextStyle(color: Color(0xff999999), fontSize: 13))),
                                        Expanded(
                                            flex: 5,
                                            child: Text("1元起购 | 低风险 | 代销",
                                                style: TextStyle(color: Color(0xff999999), fontSize: 13)))
                                      ]),
                                      const SizedBox(height: 5),
                                      const Text("业绩周期 2024.12.19-2024.12.25",
                                          style: TextStyle(color: Color(0xff999999), fontSize: 13)),
                                      const SizedBox(height: 5),
                                      Container(
                                          decoration: BoxDecoration(
                                              color: const Color(0xfff2f2f2), borderRadius: BorderRadius.circular(4)),
                                          padding: const EdgeInsets.only(left: 5, top: 5, bottom: 5),
                                          child: ValueBuilder<bool?>(
                                              initialValue: false,
                                              builder: (bool? value, Function(bool? newValue) updater) =>
                                                  Column(children: [
                                                    GestureDetector(
                                                        onTap: () => updater(!value),
                                                        behavior: HitTestBehavior.translucent,
                                                        child: Row(
                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                            children: [
                                                              const Expanded(
                                                                  child: Text("理财产品过往业绩不代表其未来表现，不等于理财产品实际收益，投资须谨慎。",
                                                                      style: TextStyle(
                                                                          fontSize: 12, color: Color(0xffA86C48)))),
                                                              SizedBox(
                                                                  width: 30,
                                                                  child: Center(
                                                                      child: Image.asset(
                                                                          value!
                                                                              ? "assets/images/rdproduct_up_9.webp"
                                                                              : "assets/images/rdproduct_down_9.webp",
                                                                          width: 18,
                                                                          height: 18)))
                                                            ])),
                                                    const SizedBox(height: 4),
                                                    Padding(
                                                        padding: const EdgeInsets.only(right: 30),
                                                        child: Text(
                                                            "业绩来源：本理财产品过往业绩由产品管理人工银理财有限责任公司基于理财产品净值计算。本理财产品业绩计算规则参照理财行业通行计算标准制定，计算时本着真实、准确、全面的原则使用统计数据和资料，相关净值数据已经理财产品托管人复核，并按照相关监管规定和行业准则的有关要求执行。理财产品过往业绩不代表其未来表现，不等于理财产品实际收益，投资须谨慎。",
                                                            maxLines: value ? null : 1,
                                                            overflow: value ? null : TextOverflow.ellipsis,
                                                            style: const TextStyle(
                                                                fontSize: 12, color: Color(0xff333333))))
                                                  ]))),
                                      const SizedBox(height: 10),
                                      const Divider(height: 0, color: Color(0xffeeeeee)),
                                      const SizedBox(height: 5),
                                      RichText(
                                          text: TextSpan(children: [
                                        const TextSpan(text: "工银理财•添利宝鑫享净值型理财产品 (23GS2066)"),
                                        WidgetSpan(
                                            child: Row(mainAxisSize: MainAxisSize.min, children: [
                                          Container(
                                              alignment: Alignment.center,
                                              padding: const EdgeInsets.symmetric(horizontal: 5),
                                              decoration: BoxDecoration(
                                                  color: const Color(0xffF0F4FC),
                                                  borderRadius: BorderRadius.circular(4)),
                                              child: const Text("理财",
                                                  style: TextStyle(
                                                      color: Color(0xff4168B2),
                                                      fontSize: 12,
                                                      fontWeight: FontWeight.w500)))
                                        ]))
                                      ], style: const TextStyle(color: Colors.black, height: 1.8))),
                                      const SizedBox(height: 15),
                                      Row(children: [
                                        Expanded(
                                            flex: 3,
                                            child: RichText(
                                                text: const TextSpan(
                                                    children: [
                                                  TextSpan(text: "1.8179", style: TextStyle(fontSize: 18)),
                                                  TextSpan(text: "%", style: TextStyle(fontSize: 14))
                                                ],
                                                    style: TextStyle(
                                                        color: Color(0xffC63138), fontWeight: FontWeight.w500)))),
                                        const Expanded(
                                            flex: 5,
                                            child: Text("申赎灵活，打理活钱",
                                                style: TextStyle(
                                                    color: Colors.black, fontSize: 15, fontWeight: FontWeight.w500)))
                                      ]),
                                      const SizedBox(height: 5),
                                      const Row(children: [
                                        Expanded(
                                            flex: 3,
                                            child: Text("七日年化收益率",
                                                style: TextStyle(color: Color(0xff999999), fontSize: 13))),
                                        Expanded(
                                            flex: 5,
                                            child: Text("1元起购 | 低风险 | 代销",
                                                style: TextStyle(color: Color(0xff999999), fontSize: 13)))
                                      ]),
                                      const SizedBox(height: 5),
                                      const Text("业绩周期 2024.12.19-2024.12.25",
                                          style: TextStyle(color: Color(0xff999999), fontSize: 13)),
                                      const SizedBox(height: 5),
                                      Container(
                                          decoration: BoxDecoration(
                                              color: const Color(0xfff2f2f2), borderRadius: BorderRadius.circular(4)),
                                          padding: const EdgeInsets.only(left: 5, top: 5, bottom: 5),
                                          child: ValueBuilder<bool?>(
                                              initialValue: false,
                                              builder: (bool? value, Function(bool? newValue) updater) =>
                                                  Column(children: [
                                                    GestureDetector(
                                                        onTap: () => updater(!value),
                                                        behavior: HitTestBehavior.translucent,
                                                        child: Row(
                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                            children: [
                                                              const Expanded(
                                                                  child: Text("理财产品过往业绩不代表其未来表现，不等于理财产品实际收益，投资须谨慎。",
                                                                      style: TextStyle(
                                                                          fontSize: 12, color: Color(0xffA86C48)))),
                                                              SizedBox(
                                                                  width: 30,
                                                                  child: Center(
                                                                      child: Image.asset(
                                                                          value!
                                                                              ? "assets/images/rdproduct_up_9.webp"
                                                                              : "assets/images/rdproduct_down_9.webp",
                                                                          width: 18,
                                                                          height: 18)))
                                                            ])),
                                                    const SizedBox(height: 4),
                                                    Padding(
                                                        padding: const EdgeInsets.only(right: 30),
                                                        child: Text(
                                                            "业绩来源：本理财产品过往业绩由产品管理人工银理财有限责任公司基于理财产品净值计算。本理财产品业绩计算规则参照理财行业通行计算标准制定，计算时本着真实、准确、全面的原则使用统计数据和资料，相关净值数据已经理财产品托管人复核，并按照相关监管规定和行业准则的有关要求执行。理财产品过往业绩不代表其未来表现，不等于理财产品实际收益，投资须谨慎。",
                                                            maxLines: value ? null : 1,
                                                            overflow: value ? null : TextOverflow.ellipsis,
                                                            style: const TextStyle(
                                                                fontSize: 12, color: Color(0xff333333))))
                                                  ])))
                                    ]))
                          ])
                        : logic.selectFourIndex.value == 1
                            ? Stack(children: [
                                Image.asset("assets/images/wealth/second_money.png",
                                    width: double.infinity, fit: BoxFit.fitWidth),
                                Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                                    child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          const Text("精选固收产品，能涨抗跌，追求稳健回报",
                                              style: TextStyle(color: Color(0xff685141), fontSize: 14)),
                                          const SizedBox(height: 20),
                                          RichText(
                                              text: TextSpan(children: [
                                            const TextSpan(text: "大成景旭纯债C "),
                                            WidgetSpan(
                                                child: Row(mainAxisSize: MainAxisSize.min, children: [
                                              Container(
                                                  alignment: Alignment.center,
                                                  padding: const EdgeInsets.symmetric(horizontal: 5),
                                                  decoration: BoxDecoration(
                                                      color: const Color(0xffFBEEEF),
                                                      borderRadius: BorderRadius.circular(4)),
                                                  child: const Text("基金",
                                                      style: TextStyle(
                                                          color: Color(0xffB63B47),
                                                          fontSize: 12,
                                                          fontWeight: FontWeight.w500)))
                                            ]))
                                          ], style: const TextStyle(color: Colors.black, height: 1.8))),
                                          const SizedBox(height: 15),
                                          Row(children: [
                                            Expanded(
                                                flex: 3,
                                                child: RichText(
                                                    text: const TextSpan(
                                                        children: [
                                                      TextSpan(text: "+5.48", style: TextStyle(fontSize: 18)),
                                                      TextSpan(text: "%", style: TextStyle(fontSize: 14))
                                                    ],
                                                        style: TextStyle(
                                                            color: Color(0xffC63138), fontWeight: FontWeight.w500)))),
                                            const Expanded(
                                                flex: 5,
                                                child: Text("精选纯债，追求绝对收益",
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 15,
                                                        fontWeight: FontWeight.w500)))
                                          ]),
                                          const SizedBox(height: 5),
                                          const Row(children: [
                                            Expanded(
                                                flex: 3,
                                                child: Text("近一年涨跌幅",
                                                    style: TextStyle(color: Color(0xff999999), fontSize: 13))),
                                            Expanded(
                                                flex: 5,
                                                child: Text("1元起购 | 债劵型 | 较低风险",
                                                    style: TextStyle(color: Color(0xff999999), fontSize: 13)))
                                          ]),
                                          const SizedBox(height: 10),
                                          const Divider(height: 0, color: Color(0xffeeeeee)),
                                          const SizedBox(height: 5),
                                          RichText(
                                              text: TextSpan(children: [
                                            const TextSpan(text: "招商双债增强C "),
                                            WidgetSpan(
                                                child: Row(mainAxisSize: MainAxisSize.min, children: [
                                              Container(
                                                  alignment: Alignment.center,
                                                  padding: const EdgeInsets.symmetric(horizontal: 5),
                                                  decoration: BoxDecoration(
                                                      color: const Color(0xffFBEEEF),
                                                      borderRadius: BorderRadius.circular(4)),
                                                  child: const Text("基金",
                                                      style: TextStyle(
                                                          color: Color(0xffB63B47),
                                                          fontSize: 12,
                                                          fontWeight: FontWeight.w500)))
                                            ]))
                                          ], style: const TextStyle(color: Colors.black, height: 1.8))),
                                          const SizedBox(height: 15),
                                          Row(children: [
                                            Expanded(
                                                flex: 3,
                                                child: RichText(
                                                    text: const TextSpan(
                                                        children: [
                                                      TextSpan(text: "+5.43", style: TextStyle(fontSize: 18)),
                                                      TextSpan(text: "%", style: TextStyle(fontSize: 14))
                                                    ],
                                                        style: TextStyle(
                                                            color: Color(0xffC63138), fontWeight: FontWeight.w500)))),
                                            const Expanded(
                                                flex: 5,
                                                child: Text("五星闪耀，专注纯债不投股",
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 15,
                                                        fontWeight: FontWeight.w500)))
                                          ]),
                                          const SizedBox(height: 5),
                                          const Row(children: [
                                            Expanded(
                                                flex: 3,
                                                child: Text("近一年涨跌幅",
                                                    style: TextStyle(color: Color(0xff999999), fontSize: 13))),
                                            Expanded(
                                                flex: 5,
                                                child: Text("1元起购 | 债劵型 | 较低风险",
                                                    style: TextStyle(color: Color(0xff999999), fontSize: 13)))
                                          ])
                                        ]))
                              ])
                            : logic.selectFourIndex.value == 2
                                ? Stack(children: [
                                    Image.asset("assets/images/wealth/third_money.png",
                                        width: double.infinity, fit: BoxFit.fitWidth),
                                    Container(
                                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                                        child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              const Text("紧跟市场形势，兼顾景气度和估值安全边际",
                                                  style: TextStyle(color: Color(0xff685141), fontSize: 14)),
                                              const SizedBox(height: 20),
                                              RichText(
                                                  text: TextSpan(children: [
                                                const TextSpan(text: "易方达人工智能ETF联接C "),
                                                WidgetSpan(
                                                    child: Row(mainAxisSize: MainAxisSize.min, children: [
                                                  Container(
                                                      alignment: Alignment.center,
                                                      padding: const EdgeInsets.symmetric(horizontal: 5),
                                                      decoration: BoxDecoration(
                                                          color: const Color(0xffFBEEEF),
                                                          borderRadius: BorderRadius.circular(4)),
                                                      child: const Text("基金",
                                                          style: TextStyle(
                                                              color: Color(0xffB63B47),
                                                              fontSize: 12,
                                                              fontWeight: FontWeight.w500)))
                                                ]))
                                              ], style: const TextStyle(color: Colors.black, height: 1.8))),
                                              const SizedBox(height: 15),
                                              Row(children: [
                                                Expanded(
                                                    flex: 3,
                                                    child: RichText(
                                                        text: const TextSpan(
                                                            children: [
                                                          TextSpan(text: "+27.07", style: TextStyle(fontSize: 18)),
                                                          TextSpan(text: "%", style: TextStyle(fontSize: 14))
                                                        ],
                                                            style: TextStyle(
                                                                color: Color(0xffC63138),
                                                                fontWeight: FontWeight.w500)))),
                                                const Expanded(
                                                    flex: 5,
                                                    child: Text("人工智能，引领数字大时代",
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            fontSize: 15,
                                                            fontWeight: FontWeight.w500)))
                                              ]),
                                              const SizedBox(height: 5),
                                              const Row(children: [
                                                Expanded(
                                                    flex: 3,
                                                    child: Text("近一年涨跌幅",
                                                        style: TextStyle(color: Color(0xff999999), fontSize: 13))),
                                                Expanded(
                                                    flex: 5,
                                                    child: Text("1元起购 | 股票型 | 较高风险",
                                                        style: TextStyle(color: Color(0xff999999), fontSize: 13)))
                                              ]),
                                              const SizedBox(height: 10),
                                              const Divider(height: 0, color: Color(0xffeeeeee)),
                                              const SizedBox(height: 5),
                                              RichText(
                                                  text: TextSpan(children: [
                                                const TextSpan(text: "工银科创50联接C "),
                                                WidgetSpan(
                                                    child: Row(mainAxisSize: MainAxisSize.min, children: [
                                                  Container(
                                                      alignment: Alignment.center,
                                                      padding: const EdgeInsets.symmetric(horizontal: 5),
                                                      decoration: BoxDecoration(
                                                          color: const Color(0xffFBEEEF),
                                                          borderRadius: BorderRadius.circular(4)),
                                                      child: const Text("基金",
                                                          style: TextStyle(
                                                              color: Color(0xffB63B47),
                                                              fontSize: 12,
                                                              fontWeight: FontWeight.w500)))
                                                ]))
                                              ], style: const TextStyle(color: Colors.black, height: 1.8))),
                                              const SizedBox(height: 15),
                                              Row(children: [
                                                Expanded(
                                                    flex: 3,
                                                    child: RichText(
                                                        text: const TextSpan(
                                                            children: [
                                                          TextSpan(text: "+15.54", style: TextStyle(fontSize: 18)),
                                                          TextSpan(text: "%", style: TextStyle(fontSize: 14))
                                                        ],
                                                            style: TextStyle(
                                                                color: Color(0xffC63138),
                                                                fontWeight: FontWeight.w500)))),
                                                const Expanded(
                                                    flex: 5,
                                                    child: Text("聚焦科创龙头",
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            fontSize: 15,
                                                            fontWeight: FontWeight.w500)))
                                              ]),
                                              const SizedBox(height: 5),
                                              const Row(children: [
                                                Expanded(
                                                    flex: 3,
                                                    child: Text("近一年涨跌幅",
                                                        style: TextStyle(color: Color(0xff999999), fontSize: 13))),
                                                Expanded(
                                                    flex: 5,
                                                    child: Text("1元起购 | 股票型 | 较高风险",
                                                        style: TextStyle(color: Color(0xff999999), fontSize: 13)))
                                              ])
                                            ]))
                                  ])
                                : Stack(children: [
                                    Image.asset("assets/images/wealth/fourth_money.png",
                                        width: double.infinity, fit: BoxFit.fitWidth),
                                    Container(
                                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                                        child: const Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Text("守护财富，安心未来，明智选择，保障无忧",
                                                  style: TextStyle(color: Color(0xff685141), fontSize: 14)),
                                              SizedBox(height: 20),
                                              Text("工银安盛人寿e+保尊享版（有社保A款）",
                                                  style: TextStyle(color: Color(0xff685141), fontSize: 14)),
                                              SizedBox(height: 8),
                                              Text("百万医疗保障，全年医疗费用享无忧",
                                                  style: TextStyle(
                                                      color: Colors.black, fontSize: 15, fontWeight: FontWeight.w500))
                                            ]))
                                  ]))
                  ])),
              Container(
                  margin: const EdgeInsets.symmetric(horizontal: 15),
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: Colors.white),
                  padding: const EdgeInsets.only(left: 10, right: 10, top: 15, bottom: 10),
                  child: Column(mainAxisSize: MainAxisSize.min, children: [
                    const Row(children: [
                      Text("财富活动", style: TextStyle(fontSize: 15, color: Colors.black)),
                      Spacer(),
                      Text("更多活动 快来参加", style: TextStyle(fontSize: 13, color: Color(0xff666666)))
                    ]),

                    /// 轮播
                    Container(
                        margin: const EdgeInsets.only(top: 10),
                        alignment: Alignment.centerLeft,
                        height: (MediaQuery.of(context).size.width - 50) * 240 / 1027 + 10,
                        child: Swiper(
                            pagination: SwiperCustomPagination(
                                builder: (BuildContext context, SwiperPluginConfig config) => Container(
                                    alignment: Alignment.bottomCenter,
                                    child: RectIndicator(
                                        count: 3,
                                        height: 3,
                                        position: config.activeIndex,
                                        width: 3,
                                        gap: 5,
                                        activeWidth: 10,
                                        color: const Color(0xff999999),
                                        activeColor: const Color(0xffCD0200)))),
                            itemBuilder: (_, index) {
                              return Container(
                                  alignment: Alignment.topCenter,
                                  child: Image.asset("assets/images/wealth/banner_00${index + 1}.png",
                                      width: double.infinity,
                                      height: (MediaQuery.of(context).size.width - 50) * 240 / 1027,
                                      fit: BoxFit.fitHeight));
                            },
                            itemCount: 3))
                  ])),
              Container(
                  margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: Colors.white),
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                  child: Column(mainAxisSize: MainAxisSize.min, children: [
                    const Row(children: [
                      Text("财富聚焦", style: TextStyle(fontSize: 16, color: Colors.black)),
                      Spacer(),
                      Text("更多精彩 快来社区", style: TextStyle(fontSize: 14, color: Color(0xff666666)))
                    ]),
                    Container(
                        margin: const EdgeInsets.only(top: 10),
                        alignment: Alignment.centerLeft,
                        child: Row(children: [
                          Expanded(
                              child: Image.asset("assets/images/wealth/left_card.png",
                                  width: double.infinity, fit: BoxFit.fitWidth)),
                          const SizedBox(width: 10),
                          Expanded(
                              child: Image.asset("assets/images/wealth/right_card.png",
                                  width: double.infinity, fit: BoxFit.fitWidth))
                        ]))
                  ])),
              Container(
                  margin: const EdgeInsets.symmetric(horizontal: 15),
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: Colors.white),
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                  child: Column(mainAxisSize: MainAxisSize.min, children: [
                    const Row(children: [
                      Text("财富学苑", style: TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.w600)),
                      Spacer(),
                      Text("更多知识 快来学习", style: TextStyle(fontSize: 14, color: Color(0xff666666)))
                    ]),
                    Container(
                        margin: const EdgeInsets.only(top: 10),
                        alignment: Alignment.centerLeft,
                        child: Stack(children: [
                          Image.asset("assets/images/wealth/签到.png", width: double.infinity, fit: BoxFit.fitWidth),
                          Positioned(
                              left: 10,
                              bottom: 10,
                              child: Text("${DateTime.now().year}-${DateTime.now().month}-${DateTime.now().day}",
                                  style: const TextStyle(fontSize: 17, color: Color(0xff666666))))
                        ])),
                    ListView.builder(
                        itemBuilder: (_, index) {
                          return Container(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: Row(children: [
                                Image.asset("assets/images/wealth/icon_皇冠.png", width: 25),
                                const SizedBox(width: 10),
                                Expanded(
                                    child: Text(logic.titles[index],
                                        style: const TextStyle(
                                            fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black))),
                                const Icon(Icons.arrow_right)
                              ]));
                        },
                        itemCount: logic.titles.length,
                        padding: const EdgeInsets.only(top: 10),
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true)
                  ])),
              const SizedBox(height: 15)
            ])),
            SliverPersistentHeader(
                delegate: CustomSliverPersistentHeaderDelegate(
                    secondColor: const Color(0xffF3F4F6),
                    child: Container(
                        height: 60,
                        decoration: const BoxDecoration(color: Colors.transparent),
                        child: TabBar(
                            dividerColor: Colors.transparent,
                            indicatorColor: Colors.transparent,
                            dividerHeight: 60,
                            tabs: logic.tabs,
                            controller: logic.tabController,
                            unselectedLabelStyle: const TextStyle(fontSize: 15, color: Color(0xff666666)),
                            labelStyle: const TextStyle(fontSize: 15, color: Colors.black, fontWeight: FontWeight.w600),
                            indicatorSize: TabBarIndicatorSize.label,
                            tabAlignment: TabAlignment.fill))),
                pinned: true),
            SliverFillRemaining(
                child: TabBarView(controller: logic.tabController, children: [
              SingleChildScrollView(
                  child: Image.asset("assets/images/wealth/tabview_001.jpg",
                      width: double.infinity, fit: BoxFit.fitWidth)),
              SingleChildScrollView(
                  child: Image.asset("assets/images/wealth/tabview_002.jpg",
                      width: double.infinity, fit: BoxFit.fitWidth)),
              SingleChildScrollView(
                  child: Image.asset("assets/images/wealth/tabview_003.jpg",
                      width: double.infinity, fit: BoxFit.fitWidth)),
              SingleChildScrollView(
                  child:
                      Image.asset("assets/images/wealth/tabview_004.jpg", width: double.infinity, fit: BoxFit.fitWidth))
            ]))
          ]),
          Obx(() {
            return CustomAppBar(opacity: logic.appBarOpacity.value);
          })
        ]));
  }

  @override
  bool get wantKeepAlive => true;
}
