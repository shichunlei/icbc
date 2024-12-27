import 'package:flutter/material.dart';
import 'package:flutter_swiper_null_safety_flutter3/flutter_swiper_null_safety_flutter3.dart';
import 'package:get/get.dart';
import 'package:icbc/global/tools.dart';
import 'package:icbc/widgets/appbar.dart';
import 'package:icbc/widgets/custom_sticky_header_delegate.dart';
import 'package:icbc/widgets/icon_text.dart';
import 'package:icbc/widgets/image_card.dart';
import 'package:icbc/widgets/rect_indicator.dart';

import 'logic.dart';

class LifePage extends StatefulWidget {
  const LifePage({super.key});

  @override
  createState() => _LifePageState();
}

class _LifePageState extends State<LifePage> with AutomaticKeepAliveClientMixin {
  LifeLogic get logic => Get.find<LifeLogic>();

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Scaffold(
        backgroundColor: const Color(0xffF3F4F6),
        body: Stack(children: [
          NestedScrollView(
              controller: logic.controller,
              headerSliverBuilder: (_, __) {
                return [
                  SliverToBoxAdapter(
                      child: SizedBox(
                          height: 375,
                          child: Stack(children: [
                            SizedBox(
                                height: 1.sw * 755 / 1180,
                                width: double.infinity,
                                child: Swiper(
                                  autoplay: true,
                                  itemBuilder: (_, index) {
                                    return Image.asset("assets/images/life/banner_00${index + 1}.png",
                                        width: double.infinity, fit: BoxFit.fitWidth);
                                  },
                                  itemCount: 3,
                                  pagination: SwiperCustomPagination(
                                      builder: (BuildContext context, SwiperPluginConfig config) => Container(
                                          alignment: Alignment.bottomCenter,
                                          padding: const EdgeInsets.only(bottom: 35),
                                          child: RectIndicator(
                                              count: 2,
                                              height: 3,
                                              position: config.activeIndex,
                                              width: 3,
                                              gap: 5,
                                              activeWidth: 10,
                                              color: const Color(0xff999999),
                                              activeColor: const Color(0xffCD0200)))),
                                )),
                            Positioned(
                                bottom: 0,
                                left: 0,
                                right: 0,
                                child: Container(
                                    padding: const EdgeInsets.only(top: 15),
                                    width: double.infinity,
                                    margin: const EdgeInsets.symmetric(horizontal: 15),
                                    decoration:
                                        BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.white),
                                    child: Column(children: [
                                      const Row(children: [
                                        IconTextView(text: "生活缴费", imagePath: "assets/images/icons/icon_生活缴费.png"),
                                        IconTextView(text: "权益中心", imagePath: "assets/images/icons/icon_权益中心.png"),
                                        IconTextView(text: "以旧换新", imagePath: "assets/images/icons/icon_以旧换新.png"),
                                        IconTextView(text: "便民服务", imagePath: "assets/images/icons/icon_便民服务.png"),
                                        IconTextView(text: "任务中心", imagePath: "assets/images/icons/icon_任务中心.png")
                                      ]),
                                      const SizedBox(height: 18),
                                      Row(children: [
                                        const IconTextView(
                                            text: "美食兑换", imagePath: "assets/images/icons/icon_美食兑换.png"),
                                        const IconTextView(
                                            text: "品质外卖", imagePath: "assets/images/icons/icon_品质外卖.png"),
                                        const IconTextView(
                                            text: "积分专区", imagePath: "assets/images/icons/icon_积分专区.png"),
                                        const IconTextView(
                                            text: "爱购8.8", imagePath: "assets/images/icons/icon_爱购8.8.png"),
                                        IconTextView(
                                            text: "全部", imagePath: "assets/images/icons/icon_全部.png", onTap: () {})
                                      ])
                                    ])))
                          ]))),
                  SliverAppBar(
                      pinned: true,
                      elevation: 0,
                      backgroundColor: Colors.transparent,
                      automaticallyImplyLeading: false,
                      expandedHeight: (1.sw - 60) / 2 * 173 / 497 * 2 + 25 + 25,
                      flexibleSpace: FlexibleSpaceBar(
                          background: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                              margin: const EdgeInsets.only(left: 15, right: 15, top: 15),
                              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10)),
                              child: const Column(children: [
                                Row(children: [
                                  Text("热门活动",
                                      style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15, color: Colors.black)),
                                  Spacer(),
                                  Text("更多", style: TextStyle(fontSize: 13, color: Color(0xff666666)))
                                ]),
                                SizedBox(height: 15),
                                SizedBox(
                                    child: Row(children: [
                                  ImageCardView(
                                      text: "工银星礼遇", subText: "尽享丰富权益", imagePath: "assets/images/life/工银星礼遇.png"),
                                  SizedBox(width: 10),
                                  ImageCardView(
                                      text: "观影优惠季", subText: "立减折扣享不停", imagePath: "assets/images/life/观影优惠季.png")
                                ])),
                                SizedBox(height: 10),
                                Row(children: [
                                  ImageCardView(
                                      text: "定点帮扶消费", subText: "好物精选直达", imagePath: "assets/images/life/定点帮扶消费.png"),
                                  SizedBox(width: 10),
                                  ImageCardView(
                                      text: "节节侯新", subText: "悦享四时礼遇", imagePath: "assets/images/life/节节侯新.png")
                                ])
                              ])))),
                  SliverPersistentHeader(
                      delegate: CustomSliverPersistentHeaderDelegate(
                          secondColor: const Color(0xffF3F4F6),
                          height: 50,
                          child: Container(
                              margin: const EdgeInsets.only(bottom: 10, top: 5),
                              height: 35,
                              decoration: const BoxDecoration(color: Colors.transparent),
                              child: TabBar(
                                  dividerColor: Colors.transparent,
                                  dividerHeight: 45,
                                  tabs: const [Tab(text: '本地'), Tab(text: '好物'), Tab(text: '购车')],
                                  controller: logic.tabController,
                                  unselectedLabelStyle: const TextStyle(fontSize: 15, color: Color(0xff666666)),
                                  labelStyle:
                                      const TextStyle(fontSize: 15, color: Colors.black, fontWeight: FontWeight.w600),
                                  indicatorSize: TabBarIndicatorSize.label,
                                  tabAlignment: TabAlignment.fill))),
                      pinned: true,
                      floating: false)
                ];
              },
              body: TabBarView(controller: logic.tabController, children: [
                SingleChildScrollView(
                    child: Column(children: [
                  Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                      margin: const EdgeInsets.only(left: 15, right: 15),
                      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10)),
                      child: const Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                        Text("政务服务", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15, color: Colors.black)),
                        SizedBox(height: 15),
                        Row(children: [
                          ImageCardView(text: "工银e社保", subText: "电子社保、医保", imagePath: "assets/images/life/工银e社保.png"),
                          SizedBox(width: 10),
                          ImageCardView(text: "个人养老金", subText: "养老第三支柱", imagePath: "assets/images/life/个人养老金.png")
                        ]),
                        SizedBox(height: 10),
                        Row(children: [
                          ImageCardView(text: "住房公积金", subText: "查询公积金明细", imagePath: "assets/images/life/住房公积金.png"),
                          SizedBox(width: 10),
                          ImageCardView(text: "长三角政务", subText: "汇聚政务 一网统办", imagePath: "assets/images/life/长三角政务.png")
                        ])
                      ])),
                  Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                      margin: const EdgeInsets.only(left: 15, right: 15, top: 15, bottom: 20),
                      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10)),
                      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                        const Row(children: [
                          Text("本地服务",
                              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15, color: Colors.black)),
                          Spacer(),
                          Text("更多", style: TextStyle(fontSize: 13, color: Color(0xff666666)))
                        ]),
                        const SizedBox(height: 15),
                        Stack(children: [
                          Image.asset("assets/images/life/biz_groupview_bdfw_banner.webp",
                              width: double.infinity, fit: BoxFit.fitWidth),
                          Container(
                              padding: const EdgeInsets.only(left: 10, top: 20),
                              child: const Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                                Text("发现本地精选服务",
                                    style: TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.w600)),
                                SizedBox(height: 3),
                                Text("享受美好生活", style: TextStyle(fontSize: 13, color: Color(0xff666666)))
                              ]))
                        ])
                      ]))
                ])),
                SingleChildScrollView(
                    child:
                        Image.asset("assets/images/life/tab_shop.jpg", width: double.infinity, fit: BoxFit.fitWidth)),
                SingleChildScrollView(
                    child: Image.asset("assets/images/life/tab_car.jpg", width: double.infinity, fit: BoxFit.fitWidth))
              ])),
          Obx(() {
            return CustomAppBar(opacity: logic.appBarOpacity.value);
          })
        ]));
  }

  @override
  bool get wantKeepAlive => true;
}
