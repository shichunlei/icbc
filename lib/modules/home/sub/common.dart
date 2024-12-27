import 'package:flutter/material.dart';
import 'package:flutter_swiper_null_safety_flutter3/flutter_swiper_null_safety_flutter3.dart';
import 'package:get/get.dart';
import 'package:icbc/modules/home/logic.dart';
import 'package:icbc/modules/webview/page.dart';
import 'package:icbc/widgets/icon_text.dart';
import 'package:icbc/widgets/rect_indicator.dart';

class CommonView extends StatelessWidget {
  const CommonView({super.key});

  HomeLogic get logic => Get.find<HomeLogic>();

  @override
  Widget build(BuildContext context) {
    return Material(
        type: MaterialType.transparency,
        child: SingleChildScrollView(
            child: Column(children: [
          Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10))),
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 15),
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Column(children: [
                Row(children: [
                  Expanded(
                      child: Image.asset("assets/images/home/biz_groupview_kingten_account_1.webp",
                          width: double.infinity, fit: BoxFit.fitWidth)),
                  SizedBox(width: 15),
                  Expanded(
                      child: Image.asset("assets/images/home/biz_groupview_kingten_personalacctsearch.webp",
                          width: double.infinity, fit: BoxFit.fitWidth)),
                  SizedBox(width: 15),
                  Expanded(
                      child: Image.asset("assets/images/home/biz_groupview_kingten_t0combination.webp",
                          width: double.infinity, fit: BoxFit.fitWidth)),
                  SizedBox(width: 15),
                  Expanded(
                      child: Image.asset("assets/images/home/biz_groupview_kingten_mypaymenu.webp",
                          width: double.infinity, fit: BoxFit.fitWidth))
                ]),
                Container(
                    width: double.infinity,
                    height: 150,
                    margin: EdgeInsets.symmetric(vertical: 15),
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
                                    color: Color(0xff999999),
                                    activeColor: Color(0xffCD0200)))),
                        itemBuilder: (_, index) {
                          return index == 0
                              ? Column(children: [
                                  Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                                    IconTextView(text: "存款", imagePath: "assets/images/icons/icon_存款.png"),
                                    IconTextView(text: "e通办", imagePath: "assets/images/icons/icon_e通办.png"),
                                    IconTextView(text: "天天盈", imagePath: "assets/images/icons/icon_天天盈.png"),
                                    IconTextView(text: "贷款", imagePath: "assets/images/icons/icon_贷款.png"),
                                    IconTextView(text: "生活缴费", imagePath: "assets/images/icons/icon_生活缴费.png")
                                  ]),
                                  SizedBox(height: 8),
                                  Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                                    IconTextView(text: "资产", imagePath: "assets/images/icons/icon_资产.png"),
                                    IconTextView(text: "薪管家", imagePath: "assets/images/icons/icon_薪管家.png"),
                                    IconTextView(text: "\"工\"迎新春", imagePath: "assets/images/icons/icon_工迎新春.png"),
                                    IconTextView(text: "养老金融", imagePath: "assets/images/icons/icon_养老金融.png"),
                                    IconTextView(text: "贵金属", imagePath: "assets/images/icons/icon_贵金属.png")
                                  ])
                                ])
                              : Column(children: [
                                  Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                                    IconTextView(text: "财富", imagePath: "assets/images/icons/icon_财富.png"),
                                    IconTextView(text: "家庭财富", imagePath: "assets/images/icons/icon_家庭财富.png"),
                                    IconTextView(text: "任务中心", imagePath: "assets/images/icons/icon_任务中心.png"),
                                    IconTextView(text: "分期付款", imagePath: "assets/images/icons/icon_分期付款.png"),
                                    IconTextView(text: "一键绑卡", imagePath: "assets/images/icons/icon_一键绑卡.png")
                                  ]),
                                  SizedBox(height: 8),
                                  Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                                    IconTextView(text: "安全中心", imagePath: "assets/images/icons/icon_安全中心.png"),
                                    IconTextView(text: "投诉咨询", imagePath: "assets/images/icons/icon_投诉咨询.png"),
                                    IconTextView(text: "自动归集", imagePath: "assets/images/icons/icon_自动归集.png"),
                                    IconTextView(text: "外汇买卖", imagePath: "assets/images/icons/icon_外汇买卖.png"),
                                    IconTextView(text: "更多", imagePath: "assets/images/icons/icon_更多.png", onTap: () {})
                                  ])
                                ]);
                        },
                        itemCount: 2))
              ])),
          // todo
          Container(
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10)),
              height: 130,
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              padding: EdgeInsets.symmetric(horizontal: 10)),
          Container(
              margin: EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: Colors.white),
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisSize: MainAxisSize.min, children: [
                Row(children: [
                  Text("工银财富", style: TextStyle(fontSize: 15, color: Colors.black)),
                  const Spacer(),
                  Text("更多", style: TextStyle(fontSize: 13, color: Color(0xff666666)))
                ]),
                SizedBox(height: 10),
                Row(children: [
                  Expanded(
                      child:
                          Image.asset("assets/images/home/bg_普惠金融.png", width: double.infinity, fit: BoxFit.fitWidth)),
                  SizedBox(width: 10),
                  Expanded(
                      child:
                          Image.asset("assets/images/home/bg_普惠金融.png", width: double.infinity, fit: BoxFit.fitWidth)),
                ]),
                SizedBox(height: 10),
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
                                  padding: EdgeInsets.symmetric(horizontal: 15),
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      color:
                                          logic.selectFourIndex.value == index ? Color(0xffFCF2F2) : Colors.grey[100]),
                                  child: Text(logic.four[index],
                                      style: TextStyle(
                                          color: logic.selectFourIndex.value == index
                                              ? Color(0xffBF0802)
                                              : Color(0xff666666),
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400)));
                            }))
                          ]);
                        },
                        separatorBuilder: (_, index) {
                          return SizedBox(width: 5);
                        },
                        itemCount: logic.four.length)),
                SizedBox(height: 10),
                Obx(() => logic.selectFourIndex.value == 0
                    ? Container(
                        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text("天天盈", style: TextStyle(color: Colors.black, fontSize: 14)),
                              SizedBox(height: 15),
                              Row(children: [
                                Expanded(
                                    flex: 2,
                                    child: RichText(
                                        text: TextSpan(children: [
                                      TextSpan(text: "2.3190", style: TextStyle(fontSize: 18)),
                                      TextSpan(text: "%", style: TextStyle(fontSize: 14))
                                    ], style: TextStyle(color: Color(0xffC63138), fontWeight: FontWeight.w500)))),
                                Expanded(
                                    flex: 3,
                                    child: Text("7*24小时快赎服务",
                                        style:
                                            TextStyle(color: Colors.black, fontSize: 13, fontWeight: FontWeight.w500)))
                              ]),
                              SizedBox(height: 5),
                              Row(children: [
                                Expanded(
                                    flex: 2,
                                    child: Row(children: [
                                      Text("最高七日年化收益率", style: TextStyle(color: Color(0xff999999), fontSize: 12)),
                                      SizedBox(width: 4),
                                      Image.asset("assets/images/tip_image_m.png", width: 11)
                                    ])),
                                Expanded(
                                    flex: 3,
                                    child: Text("随用随取 | 1分起购 | 低风险",
                                        style: TextStyle(color: Color(0xff999999), fontSize: 11)))
                              ]),
                              SizedBox(height: 5),
                              Container(
                                  width: double.infinity,
                                  alignment: Alignment.centerLeft,
                                  decoration:
                                      BoxDecoration(color: Color(0xfff2f2f2), borderRadius: BorderRadius.circular(4)),
                                  padding: EdgeInsets.only(left: 5, top: 5, bottom: 5),
                                  child: Text("*关联货币基金七日年化分布在1.1970%-2.3190%",
                                      style: TextStyle(fontSize: 10, color: Color(0xff666666)))),
                              SizedBox(height: 10),
                              Divider(height: 0, color: Color(0xffeeeeee)),
                              SizedBox(height: 5),
                              GestureDetector(
                                onTap: () {
                                  Get.to(() => WebViewPage(
                                      url: "https://m.icbc.com.cn/mpage/finance/detail?productId=XLT1801",
                                      title: "产品详情"));
                                },
                                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                                  Text("工银理财”添利宝”净值型理财产品（XLT1801）",
                                      style: TextStyle(color: Colors.black, fontSize: 14)),
                                  SizedBox(height: 15),
                                  Row(children: [
                                    Expanded(
                                        flex: 2,
                                        child: RichText(
                                            text: TextSpan(children: [
                                          TextSpan(text: "1.8179", style: TextStyle(fontSize: 18)),
                                          TextSpan(text: "%", style: TextStyle(fontSize: 14))
                                        ], style: TextStyle(color: Color(0xffC63138), fontWeight: FontWeight.w500)))),
                                    Expanded(
                                        flex: 3,
                                        child: Text("老牌产品，活钱添利",
                                            style: TextStyle(
                                                color: Colors.black, fontSize: 13, fontWeight: FontWeight.w500)))
                                  ]),
                                  SizedBox(height: 5),
                                  Row(children: [
                                    Expanded(
                                        flex: 2,
                                        child:
                                            Text("七日年化收益率", style: TextStyle(color: Color(0xff999999), fontSize: 11))),
                                    Expanded(
                                        flex: 3,
                                        child: Text("1元起购 | 低风险 | 代销",
                                            style: TextStyle(color: Color(0xff999999), fontSize: 11)))
                                  ]),
                                  SizedBox(height: 5),
                                  Text("业绩周期 2024.12.19-2024.12.25",
                                      style: TextStyle(color: Color(0xff999999), fontSize: 11)),
                                  SizedBox(height: 5),
                                  Container(
                                      decoration: BoxDecoration(
                                          color: Color(0xfff2f2f2), borderRadius: BorderRadius.circular(4)),
                                      padding: EdgeInsets.only(left: 5, top: 5, bottom: 5),
                                      child: ValueBuilder<bool?>(
                                          initialValue: false,
                                          builder: (bool? value, Function(bool? newValue) updater) => Column(children: [
                                                GestureDetector(
                                                    onTap: () => updater(!value),
                                                    behavior: HitTestBehavior.translucent,
                                                    child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                                                      Expanded(
                                                          child: Text("理财产品过往业绩不代表其未来表现，不等于理财产品实际收益，投资须谨慎。",
                                                              style:
                                                                  TextStyle(fontSize: 10, color: Color(0xffA86C48)))),
                                                      SizedBox(
                                                          width: 40,
                                                          child: Center(
                                                              child: Image.asset(
                                                                  value!
                                                                      ? "assets/images/rdproduct_up_9.webp"
                                                                      : "assets/images/rdproduct_down_9.webp",
                                                                  width: 18,
                                                                  height: 18)))
                                                    ])),
                                                SizedBox(height: 4),
                                                Padding(
                                                    padding: const EdgeInsets.only(right: 40),
                                                    child: Text(
                                                        "业绩来源：本理财产品过往业绩由产品管理人工银理财有限责任公司基于理财产品净值计算。本理财产品业绩计算规则参照理财行业通行计算标准制定，计算时本着真实、准确、全面的原则使用统计数据和资料，相关净值数据已经理财产品托管人复核，并按照相关监管规定和行业准则的有关要求执行。理财产品过往业绩不代表其未来表现，不等于理财产品实际收益，投资须谨慎。",
                                                        maxLines: value ? null : 1,
                                                        overflow: value ? null : TextOverflow.ellipsis,
                                                        style: TextStyle(fontSize: 10, color: Color(0xff666666))))
                                              ])))
                                ]),
                              )
                            ]))
                    : logic.selectFourIndex.value == 1
                        ? Container(
                            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text("景顺长城景颐招利6个月持有期债券型证券投资基金C", style: TextStyle(color: Colors.black, fontSize: 14)),
                                  SizedBox(height: 15),
                                  Row(children: [
                                    Expanded(
                                        flex: 3,
                                        child: RichText(
                                            text: TextSpan(children: [
                                          TextSpan(text: "+9.28", style: TextStyle(fontSize: 18)),
                                          TextSpan(text: "%", style: TextStyle(fontSize: 14))
                                        ], style: TextStyle(color: Color(0xffC63138), fontWeight: FontWeight.w500)))),
                                    Expanded(
                                        flex: 5,
                                        child: Text("成立以来连续3年正收益",
                                            style: TextStyle(
                                                color: Colors.black, fontSize: 13, fontWeight: FontWeight.w500)))
                                  ]),
                                  SizedBox(height: 5),
                                  Row(children: [
                                    Expanded(
                                        flex: 3,
                                        child:
                                            Text("近一年涨跌幅", style: TextStyle(color: Color(0xff999999), fontSize: 11))),
                                    Expanded(
                                        flex: 5,
                                        child: Text("1000元起投 | 较低风险",
                                            style: TextStyle(color: Color(0xff999999), fontSize: 11)))
                                  ]),
                                  SizedBox(height: 10),
                                  Divider(height: 0, color: Color(0xffeeeeee)),
                                  SizedBox(height: 5),
                                  Text("招商双债增强债券基金", style: TextStyle(color: Colors.black, fontSize: 14)),
                                  SizedBox(height: 15),
                                  Row(children: [
                                    Expanded(
                                        flex: 3,
                                        child: RichText(
                                            text: TextSpan(children: [
                                          TextSpan(text: "+5.21", style: TextStyle(fontSize: 18)),
                                          TextSpan(text: "%", style: TextStyle(fontSize: 14))
                                        ], style: TextStyle(color: Color(0xffC63138), fontWeight: FontWeight.w500)))),
                                    Expanded(
                                        flex: 5,
                                        child: Text("五星闪耀，专注纯债不投股",
                                            style: TextStyle(
                                                color: Colors.black, fontSize: 13, fontWeight: FontWeight.w500)))
                                  ]),
                                  SizedBox(height: 5),
                                  Row(children: [
                                    Expanded(
                                        flex: 3,
                                        child:
                                            Text("近一年涨跌幅", style: TextStyle(color: Color(0xff999999), fontSize: 11))),
                                    Expanded(
                                        flex: 5,
                                        child: Text("1元起投 | 较低风险",
                                            style: TextStyle(color: Color(0xff999999), fontSize: 11)))
                                  ])
                                ]))
                        : logic.selectFourIndex.value == 2
                            ? Container(
                                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                                child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text("华泰柏瑞轮动精选混合C", style: TextStyle(color: Colors.black, fontSize: 14)),
                                      SizedBox(height: 15),
                                      Row(children: [
                                        Expanded(
                                            flex: 3,
                                            child: RichText(
                                                text: TextSpan(
                                                    children: [
                                                  TextSpan(text: "+17.10", style: TextStyle(fontSize: 18)),
                                                  TextSpan(text: "%", style: TextStyle(fontSize: 14))
                                                ],
                                                    style: TextStyle(
                                                        color: Color(0xffC63138), fontWeight: FontWeight.w500)))),
                                        Expanded(
                                            flex: 5,
                                            child: Text("立足性价比，投资全天候",
                                                style: TextStyle(
                                                    color: Colors.black, fontSize: 13, fontWeight: FontWeight.w500)))
                                      ]),
                                      SizedBox(height: 5),
                                      Row(children: [
                                        Expanded(
                                            flex: 3,
                                            child: Text("近一年涨跌幅",
                                                style: TextStyle(color: Color(0xff999999), fontSize: 11))),
                                        Expanded(
                                            flex: 5,
                                            child: Text("1000元起投 | 中风险",
                                                style: TextStyle(color: Color(0xff999999), fontSize: 11)))
                                      ]),
                                      SizedBox(height: 10),
                                      Divider(height: 0, color: Color(0xffeeeeee)),
                                      SizedBox(height: 5),
                                      Text("易方达中证人工智能主题ETF联接C", style: TextStyle(color: Colors.black, fontSize: 14)),
                                      SizedBox(height: 15),
                                      Row(children: [
                                        Expanded(
                                            flex: 3,
                                            child: RichText(
                                                text: TextSpan(
                                                    children: [
                                                  TextSpan(text: "+26.73", style: TextStyle(fontSize: 18)),
                                                  TextSpan(text: "%", style: TextStyle(fontSize: 14))
                                                ],
                                                    style: TextStyle(
                                                        color: Color(0xffC63138), fontWeight: FontWeight.w500)))),
                                        Expanded(
                                            flex: 5,
                                            child: Text("人工智能，引领数字大时代",
                                                style: TextStyle(
                                                    color: Colors.black, fontSize: 13, fontWeight: FontWeight.w500)))
                                      ]),
                                      SizedBox(height: 5),
                                      Row(children: [
                                        Expanded(
                                            flex: 3,
                                            child: Text("近一年涨跌幅",
                                                style: TextStyle(color: Color(0xff999999), fontSize: 11))),
                                        Expanded(
                                            flex: 5,
                                            child: Text("1元起投 | 较高风险",
                                                style: TextStyle(color: Color(0xff999999), fontSize: 11)))
                                      ])
                                    ]))
                            : Container(
                                // todo
                                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                                child: SizedBox(height: 80)))
              ])),
          Container(
              margin: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: Colors.white),
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisSize: MainAxisSize.min, children: [
                Text("客群专区", style: TextStyle(fontSize: 15, color: Colors.black)),
                SizedBox(height: 10),
                Row(children: [
                  Expanded(
                      child: Stack(children: [
                    Image.asset("assets/images/home/bg_普惠金融.png", width: double.infinity, fit: BoxFit.fitWidth),
                    Positioned(
                        left: 10,
                        top: 10,
                        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                          Text("普惠金融",
                              style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500, fontSize: 15)),
                          SizedBox(height: 5),
                          Text("工银普惠行", style: TextStyle(color: Color(0xff666666), fontSize: 12))
                        ]))
                  ])),
                  SizedBox(width: 10),
                  Expanded(
                      child: Stack(children: [
                    Image.asset("assets/images/home/bg_拥军专区.png", width: double.infinity, fit: BoxFit.fitWidth),
                    Positioned(
                        left: 10,
                        top: 10,
                        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                          Text("拥军专区",
                              style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500, fontSize: 15)),
                          SizedBox(height: 5),
                          Text("拥军优抚伴您行", style: TextStyle(color: Color(0xff666666), fontSize: 12))
                        ]))
                  ]))
                ]),
                SizedBox(height: 10),
                Row(children: [
                  Expanded(
                      child: Stack(children: [
                    Image.asset("assets/images/home/bg_服务新市民.png", width: double.infinity, fit: BoxFit.fitWidth),
                    Positioned(
                        left: 10,
                        top: 10,
                        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                          Text("服务新市民",
                              style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500, fontSize: 15)),
                          SizedBox(height: 5),
                          Text("护航城市梦", style: TextStyle(color: Color(0xff666666), fontSize: 12))
                        ]))
                  ])),
                  SizedBox(width: 10),
                  Expanded(
                      child: Stack(children: [
                    Image.asset("assets/images/home/bg_代发薪.png", width: double.infinity, fit: BoxFit.fitWidth),
                    Positioned(
                        left: 10,
                        top: 10,
                        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                          Text("代发薪", style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500, fontSize: 15)),
                          SizedBox(height: 5),
                          Text("薪资打理好帮手", style: TextStyle(color: Color(0xff666666), fontSize: 12))
                        ]))
                  ]))
                ]),
                SizedBox(height: 10),
                Row(children: [
                  Expanded(
                      child: Stack(children: [
                    Image.asset("assets/images/home/bg_伴宝贝成长.png", width: double.infinity, fit: BoxFit.fitWidth),
                    Positioned(
                        left: 10,
                        top: 10,
                        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                          Text("伴宝贝成长",
                              style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500, fontSize: 15)),
                          SizedBox(height: 5),
                          Text("子女账户轻松管", style: TextStyle(color: Color(0xff666666), fontSize: 12))
                        ]))
                  ])),
                  SizedBox(width: 10),
                  Expanded(
                      child: Stack(children: [
                    Image.asset("assets/images/home/bg_养老金融.png", width: double.infinity, fit: BoxFit.fitWidth),
                    Positioned(
                        left: 10,
                        top: 10,
                        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                          Text("养老金融",
                              style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500, fontSize: 15)),
                          SizedBox(height: 5),
                          Text("安心养老 幸福一生", style: TextStyle(color: Color(0xff666666), fontSize: 12))
                        ]))
                  ]))
                ])
              ])),
          Container(
              margin: EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: Colors.white),
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              child: Column(children: [
                Center(
                    child: Row(mainAxisSize: MainAxisSize.min, children: [
                  Container(
                      height: 35,
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          border: Border.all(width: 1, color: Color(0xff3963CB))),
                      child: Text("发现更多服务",
                          style: TextStyle(color: Color(0xff3963CB), fontSize: 16, fontWeight: FontWeight.w600)))
                ])),
                SizedBox(height: 10),
                Text("打造个性化首页", style: TextStyle(color: Color(0xff999999), fontSize: 12))
              ])),
          SizedBox(height: 10),
          Container(
              margin: EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.white),
              padding: EdgeInsets.symmetric(horizontal: 5, vertical: 12),
              child: Row(children: [
                SizedBox(width: 5),
                Image.asset("assets/images/home/bottom_tousu_icon.webp", width: 25),
                SizedBox(width: 5),
                Expanded(
                    child: Text("客户投诉指南",
                        style: TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.w500))),
                Image.asset("assets/images/right_arrow_entry_icon.webp", width: 25)
              ])),
          Container(
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Row(children: [
                Expanded(
                    child: Image.asset("assets/images/home/home_bottom_1.png",
                        width: double.infinity, fit: BoxFit.fitWidth)),
                Expanded(
                    child: Image.asset("assets/images/home/home_bottom_2.png",
                        width: double.infinity, fit: BoxFit.fitWidth)),
                Expanded(
                    child: Image.asset("assets/images/home/home_bottom_3.png",
                        width: double.infinity, fit: BoxFit.fitWidth))
              ])),
          SizedBox(height: 10),
          RichText(
              text: TextSpan(children: [
            TextSpan(text: "中国工商银行支持  "),
            WidgetSpan(
                child: Row(mainAxisSize: MainAxisSize.min, children: [
              Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(horizontal: 3),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.redAccent, width: 1), borderRadius: BorderRadius.circular(24)),
                  child:
                      Text("IPV6", style: TextStyle(color: Colors.redAccent, fontSize: 9, fontWeight: FontWeight.w600)))
            ])),
            TextSpan(text: "  网络")
          ], style: TextStyle(color: Colors.black, fontSize: 13, fontWeight: FontWeight.w500))),
          SizedBox(height: 15),
          Text("ICP备案号：京ICP证030247号-60A", style: TextStyle(color: Color(0xff999999), fontSize: 11)),
          SizedBox(height: 3),
          RichText(
              text: TextSpan(children: [
            TextSpan(text: "备案系统网址 "),
            TextSpan(text: "http://beian.miit.gov.cn/", style: TextStyle(color: Colors.blueAccent))
          ], style: TextStyle(color: Colors.black, fontSize: 11))),
          SizedBox(height: 40)
        ])));
  }
}
