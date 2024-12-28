import 'package:flutter/material.dart';
import 'package:flutter_swiper_null_safety_flutter3/flutter_swiper_null_safety_flutter3.dart';
import 'package:get/get.dart';
import 'package:icbc/modules/home/logic.dart';
import 'package:icbc/modules/webview/page.dart';
import 'package:icbc/router/router.dart';
import 'package:icbc/widgets/home_bottom.dart';
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
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10))),
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 15),
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(children: [
                Row(children: [
                  Expanded(
                      child: GestureDetector(
                          onTap: () {
                            Get.toNamed(AppRouter.minePages.accountRoute.name);
                          },
                          child: Image.asset("assets/images/home/biz_groupview_kingten_account_1.webp",
                              width: double.infinity, fit: BoxFit.fitWidth))),
                  const SizedBox(width: 15),
                  Expanded(
                      child: GestureDetector(
                          onTap: () {
                            // TODO 收支
                          },
                          child: Image.asset("assets/images/home/biz_groupview_kingten_personalacctsearch.webp",
                              width: double.infinity, fit: BoxFit.fitWidth))),
                  const SizedBox(width: 15),
                  Expanded(
                      child: GestureDetector(
                          onTap: () {},
                          child: Image.asset("assets/images/home/biz_groupview_kingten_t0combination.webp",
                              width: double.infinity, fit: BoxFit.fitWidth))),
                  const SizedBox(width: 15),
                  Expanded(
                      child: GestureDetector(
                          onTap: () {},
                          child: Image.asset("assets/images/home/biz_groupview_kingten_mypaymenu.webp",
                              width: double.infinity, fit: BoxFit.fitWidth)))
                ]),
                Container(
                    width: double.infinity,
                    height: 150,
                    margin: const EdgeInsets.symmetric(vertical: 15),
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
                              ? Column(children: [
                                  const Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                                    IconTextView(text: "存款", imagePath: "assets/images/icons/icon_存款.png"),
                                    IconTextView(text: "e通办", imagePath: "assets/images/icons/icon_e通办.png"),
                                    IconTextView(text: "天天盈", imagePath: "assets/images/icons/icon_天天盈.png"),
                                    IconTextView(text: "贷款", imagePath: "assets/images/icons/icon_贷款.png"),
                                    IconTextView(text: "生活缴费", imagePath: "assets/images/icons/icon_生活缴费.png")
                                  ]),
                                  const SizedBox(height: 8),
                                  Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                                    IconTextView(
                                        text: "资产",
                                        imagePath: "assets/images/icons/icon_资产.png",
                                        onTap: () {
                                          Get.toNamed(AppRouter.minePages.assetsRoute.name);
                                        }),
                                    const IconTextView(text: "薪管家", imagePath: "assets/images/icons/icon_薪管家.png"),
                                    IconTextView(
                                        text: "\"工\"迎新春",
                                        imagePath: "assets/images/icons/icon_工迎新春.png",
                                        onTap: () {
                                          Get.to(() => WebViewPage(
                                              url:
                                                  "https://m.icbc.com.cn/column/1005533151336026113.html?srcchannel=F-WAPB&transitionid=113d48f25121c073&srcpageurl=standard-favorite",
                                              title: "\"工\"迎新春"));
                                        }),
                                    const IconTextView(text: "养老金融", imagePath: "assets/images/icons/icon_养老金融.png"),
                                    const IconTextView(text: "贵金属", imagePath: "assets/images/icons/icon_贵金属.png")
                                  ])
                                ])
                              : Column(children: [
                                  const Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                                    IconTextView(text: "财富", imagePath: "assets/images/icons/icon_财富.png"),
                                    IconTextView(text: "家庭财富", imagePath: "assets/images/icons/icon_家庭财富.png"),
                                    IconTextView(text: "任务中心", imagePath: "assets/images/icons/icon_任务中心.png"),
                                    IconTextView(text: "分期付款", imagePath: "assets/images/icons/icon_分期付款.png"),
                                    IconTextView(text: "一键绑卡", imagePath: "assets/images/icons/icon_一键绑卡.png")
                                  ]),
                                  const SizedBox(height: 8),
                                  Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                                    const IconTextView(text: "安全中心", imagePath: "assets/images/icons/icon_安全中心.png"),
                                    const IconTextView(text: "投诉咨询", imagePath: "assets/images/icons/icon_投诉咨询.png"),
                                    const IconTextView(text: "自动归集", imagePath: "assets/images/icons/icon_自动归集.png"),
                                    const IconTextView(text: "外汇买卖", imagePath: "assets/images/icons/icon_外汇买卖.png"),
                                    IconTextView(
                                        text: "更多",
                                        imagePath: "assets/images/icons/icon_更多.png",
                                        onTap: () {
                                          Get.toNamed(AppRouter.minePages.categoryRoute.name);
                                        })
                                  ])
                                ]);
                        },
                        itemCount: 2))
              ])),
          Container(
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10)),
              height: (MediaQuery.of(context).size.width - 30) / 1100 * 330,
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              child: Swiper(
                  autoplay: true,
                  itemBuilder: (BuildContext context, int index) {
                    return Image.asset("assets/images/home/banner_00${index + 1}.webp",
                        width: double.infinity, fit: BoxFit.fitWidth);
                  },
                  itemCount: 3,
                  onTap: (index) {
                    if (index == 0) {
                      Get.to(() => WebViewPage(
                          url:
                              "https://m.icbc.com.cn/column/992097422295633921.html?srcchannel=F-WAPB&transitionid=113d48f25121c073&srcpageurl=standard-favorite",
                          title: "个人养老金“冬日存暖意”"));
                    } else if (index == 1) {
                      Get.to(() => WebViewPage(
                          url:
                              "https://m.icbc.com.cn/column/1005533151336026113.html?srcchannel=F-WAPB&transitionid=113d48f25121c073&srcpageurl=standard-favorite",
                          title: "\"工\"迎新春"));
                    } else {
                      Get.to(() => WebViewPage(
                          url:
                              "https://m.icbc.com.cn/page/1043214620178960384.html?srcchannel=F-WAPB&transitionid=113d48f25121c073&srcpageurl=standard-favorite",
                          title: "中国工商银行手机网站"));
                    }
                  },
                  pagination: SwiperCustomPagination(
                      builder: (BuildContext context, SwiperPluginConfig config) => Container(
                          alignment: Alignment.bottomCenter,
                          padding: const EdgeInsets.only(bottom: 5),
                          child: RectIndicator(
                              count: 3,
                              height: 3,
                              position: config.activeIndex,
                              width: 3,
                              gap: 5,
                              activeWidth: 10,
                              color: const Color(0xff999999),
                              activeColor: const Color(0xffCD0200)))))),
          Container(
              margin: const EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: Colors.white),
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisSize: MainAxisSize.min, children: [
                const Row(children: [
                  Text("工银财富", style: TextStyle(fontSize: 15, color: Colors.black)),
                  Spacer(),
                  Text("更多", style: TextStyle(fontSize: 13, color: Color(0xff666666)))
                ]),
                const SizedBox(height: 10),
                Row(children: [
                  Expanded(
                      child: Stack(children: [
                    Image.asset("assets/images/home/icon_布局2025.webp", width: double.infinity, fit: BoxFit.fitWidth),
                    Container(
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.only(left: 10, top: 10),
                        child: const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text("布局2025",
                                  style: TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.w500)),
                              Text("瓜分199998份红包", style: TextStyle(color: Color(0xff666666), fontSize: 10))
                            ]))
                  ])),
                  const SizedBox(width: 10),
                  Expanded(
                      child: Stack(children: [
                    Image.asset("assets/images/home/icon_指数吸金榜.webp", width: double.infinity, fit: BoxFit.fitWidth),
                    Container(
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.only(left: 10, top: 10),
                        child: const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text("指数吸金榜",
                                  style: TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.w500)),
                              Text("资金热捧TOP10", style: TextStyle(color: Color(0xff666666), fontSize: 10))
                            ]))
                  ]))
                ]),
                const SizedBox(height: 10),
                Container(
                    alignment: Alignment.centerLeft,
                    height: 40,
                    child: ListView.separated(
                        padding: const EdgeInsets.symmetric(vertical: 5),
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
                    ? Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Text("天天盈", style: TextStyle(color: Colors.black, fontSize: 14)),
                              const SizedBox(height: 15),
                              Row(children: [
                                Expanded(
                                    flex: 2,
                                    child: RichText(
                                        text: const TextSpan(children: [
                                      TextSpan(text: "2.3190", style: TextStyle(fontSize: 18)),
                                      TextSpan(text: "%", style: TextStyle(fontSize: 14))
                                    ], style: TextStyle(color: Color(0xffC63138), fontWeight: FontWeight.w500)))),
                                const Expanded(
                                    flex: 3,
                                    child: Text("7*24小时快赎服务",
                                        style:
                                            TextStyle(color: Colors.black, fontSize: 13, fontWeight: FontWeight.w500)))
                              ]),
                              const SizedBox(height: 5),
                              Row(children: [
                                Expanded(
                                    flex: 2,
                                    child: Row(children: [
                                      const Text("最高七日年化收益率", style: TextStyle(color: Color(0xff999999), fontSize: 10)),
                                      const SizedBox(width: 2),
                                      Image.asset("assets/images/tip_image_blue.png", width: 10)
                                    ])),
                                const Expanded(
                                    flex: 3,
                                    child: Text("随用随取 | 1分起购 | 低风险",
                                        style: TextStyle(color: Color(0xff999999), fontSize: 10)))
                              ]),
                              const SizedBox(height: 5),
                              Container(
                                  width: double.infinity,
                                  alignment: Alignment.centerLeft,
                                  decoration: BoxDecoration(
                                      color: const Color(0xfff2f2f2), borderRadius: BorderRadius.circular(4)),
                                  padding: const EdgeInsets.only(left: 5, top: 5, bottom: 5),
                                  child: const Text("*关联货币基金七日年化分布在1.1970%-2.3190%",
                                      style: TextStyle(fontSize: 10, color: Color(0xff666666)))),
                              const SizedBox(height: 10),
                              const Divider(height: 0, color: Color(0xffeeeeee)),
                              const SizedBox(height: 5),
                              GestureDetector(
                                onTap: () {
                                  Get.to(() => WebViewPage(
                                      url: "https://m.icbc.com.cn/mpage/finance/detail?productId=XLT1801",
                                      title: "产品详情"));
                                },
                                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                                  const Text("工银理财”添利宝”净值型理财产品（XLT1801）",
                                      style: TextStyle(color: Colors.black, fontSize: 14)),
                                  const SizedBox(height: 15),
                                  Row(children: [
                                    Expanded(
                                        flex: 2,
                                        child: RichText(
                                            text: const TextSpan(children: [
                                          TextSpan(text: "1.8179", style: TextStyle(fontSize: 18)),
                                          TextSpan(text: "%", style: TextStyle(fontSize: 14))
                                        ], style: TextStyle(color: Color(0xffC63138), fontWeight: FontWeight.w500)))),
                                    const Expanded(
                                        flex: 3,
                                        child: Text("老牌产品，活钱添利",
                                            style: TextStyle(
                                                color: Colors.black, fontSize: 13, fontWeight: FontWeight.w500)))
                                  ]),
                                  const SizedBox(height: 5),
                                  const Row(children: [
                                    Expanded(
                                        flex: 2,
                                        child:
                                            Text("七日年化收益率", style: TextStyle(color: Color(0xff999999), fontSize: 10))),
                                    Expanded(
                                        flex: 3,
                                        child: Text("1元起购 | 低风险 | 代销",
                                            style: TextStyle(color: Color(0xff999999), fontSize: 10)))
                                  ]),
                                  const SizedBox(height: 5),
                                  const Text("业绩周期 2024.12.19-2024.12.25",
                                      style: TextStyle(color: Color(0xff999999), fontSize: 11)),
                                  const SizedBox(height: 5),
                                  Container(
                                      decoration: BoxDecoration(
                                          color: const Color(0xfff2f2f2), borderRadius: BorderRadius.circular(4)),
                                      padding: const EdgeInsets.only(left: 5, top: 5, bottom: 5),
                                      child: ValueBuilder<bool?>(
                                          initialValue: false,
                                          builder: (bool? value, Function(bool? newValue) updater) => Column(children: [
                                                GestureDetector(
                                                    onTap: () => updater(!value),
                                                    behavior: HitTestBehavior.translucent,
                                                    child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                                                      const Expanded(
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
                                                const SizedBox(height: 4),
                                                Padding(
                                                    padding: const EdgeInsets.only(right: 40),
                                                    child: Text(
                                                        "业绩来源：本理财产品过往业绩由产品管理人工银理财有限责任公司基于理财产品净值计算。本理财产品业绩计算规则参照理财行业通行计算标准制定，计算时本着真实、准确、全面的原则使用统计数据和资料，相关净值数据已经理财产品托管人复核，并按照相关监管规定和行业准则的有关要求执行。理财产品过往业绩不代表其未来表现，不等于理财产品实际收益，投资须谨慎。",
                                                        maxLines: value ? null : 1,
                                                        overflow: value ? null : TextOverflow.ellipsis,
                                                        style: const TextStyle(fontSize: 10, color: Color(0xff666666))))
                                              ])))
                                ]),
                              )
                            ]))
                    : logic.selectFourIndex.value == 1
                        ? Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const Text("景顺长城景颐招利6个月持有期债券型证券投资基金C",
                                      style: TextStyle(color: Colors.black, fontSize: 14)),
                                  const SizedBox(height: 15),
                                  Row(children: [
                                    Expanded(
                                        flex: 3,
                                        child: RichText(
                                            text: const TextSpan(children: [
                                          TextSpan(text: "+9.28", style: TextStyle(fontSize: 18)),
                                          TextSpan(text: "%", style: TextStyle(fontSize: 14))
                                        ], style: TextStyle(color: Color(0xffC63138), fontWeight: FontWeight.w500)))),
                                    const Expanded(
                                        flex: 5,
                                        child: Text("成立以来连续3年正收益",
                                            style: TextStyle(
                                                color: Colors.black, fontSize: 13, fontWeight: FontWeight.w500)))
                                  ]),
                                  const SizedBox(height: 5),
                                  const Row(children: [
                                    Expanded(
                                        flex: 3,
                                        child:
                                            Text("近一年涨跌幅", style: TextStyle(color: Color(0xff999999), fontSize: 11))),
                                    Expanded(
                                        flex: 5,
                                        child: Text("1000元起投 | 较低风险",
                                            style: TextStyle(color: Color(0xff999999), fontSize: 11)))
                                  ]),
                                  const SizedBox(height: 10),
                                  const Divider(height: 0, color: Color(0xffeeeeee)),
                                  const SizedBox(height: 5),
                                  const Text("招商双债增强债券基金", style: TextStyle(color: Colors.black, fontSize: 14)),
                                  const SizedBox(height: 15),
                                  Row(children: [
                                    Expanded(
                                        flex: 3,
                                        child: RichText(
                                            text: const TextSpan(children: [
                                          TextSpan(text: "+5.21", style: TextStyle(fontSize: 18)),
                                          TextSpan(text: "%", style: TextStyle(fontSize: 14))
                                        ], style: TextStyle(color: Color(0xffC63138), fontWeight: FontWeight.w500)))),
                                    const Expanded(
                                        flex: 5,
                                        child: Text("五星闪耀，专注纯债不投股",
                                            style: TextStyle(
                                                color: Colors.black, fontSize: 13, fontWeight: FontWeight.w500)))
                                  ]),
                                  const SizedBox(height: 5),
                                  const Row(children: [
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
                                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                                child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      const Text("华泰柏瑞轮动精选混合C", style: TextStyle(color: Colors.black, fontSize: 14)),
                                      const SizedBox(height: 15),
                                      Row(children: [
                                        Expanded(
                                            flex: 3,
                                            child: RichText(
                                                text: const TextSpan(
                                                    children: [
                                                  TextSpan(text: "+17.10", style: TextStyle(fontSize: 18)),
                                                  TextSpan(text: "%", style: TextStyle(fontSize: 14))
                                                ],
                                                    style: TextStyle(
                                                        color: Color(0xffC63138), fontWeight: FontWeight.w500)))),
                                        const Expanded(
                                            flex: 5,
                                            child: Text("立足性价比，投资全天候",
                                                style: TextStyle(
                                                    color: Colors.black, fontSize: 13, fontWeight: FontWeight.w500)))
                                      ]),
                                      const SizedBox(height: 5),
                                      const Row(children: [
                                        Expanded(
                                            flex: 3,
                                            child: Text("近一年涨跌幅",
                                                style: TextStyle(color: Color(0xff999999), fontSize: 11))),
                                        Expanded(
                                            flex: 5,
                                            child: Text("1000元起投 | 中风险",
                                                style: TextStyle(color: Color(0xff999999), fontSize: 11)))
                                      ]),
                                      const SizedBox(height: 10),
                                      const Divider(height: 0, color: Color(0xffeeeeee)),
                                      const SizedBox(height: 5),
                                      const Text("易方达中证人工智能主题ETF联接C",
                                          style: TextStyle(color: Colors.black, fontSize: 14)),
                                      const SizedBox(height: 15),
                                      Row(children: [
                                        Expanded(
                                            flex: 3,
                                            child: RichText(
                                                text: const TextSpan(
                                                    children: [
                                                  TextSpan(text: "+26.73", style: TextStyle(fontSize: 18)),
                                                  TextSpan(text: "%", style: TextStyle(fontSize: 14))
                                                ],
                                                    style: TextStyle(
                                                        color: Color(0xffC63138), fontWeight: FontWeight.w500)))),
                                        const Expanded(
                                            flex: 5,
                                            child: Text("人工智能，引领数字大时代",
                                                style: TextStyle(
                                                    color: Colors.black, fontSize: 13, fontWeight: FontWeight.w500)))
                                      ]),
                                      const SizedBox(height: 5),
                                      const Row(children: [
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
                            : Image.asset("assets/images/home/icon_全年医疗享无忧.webp",
                                width: double.infinity, fit: BoxFit.fitWidth))
              ])),
          Container(
              margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: Colors.white),
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisSize: MainAxisSize.min, children: [
                const Text("客群专区", style: TextStyle(fontSize: 15, color: Colors.black)),
                const SizedBox(height: 10),
                Row(children: [
                  Expanded(
                      child: Stack(children: [
                    Image.asset("assets/images/home/bg_普惠金融.png", width: double.infinity, fit: BoxFit.fitWidth),
                    const Positioned(
                        left: 10,
                        top: 10,
                        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                          Text("普惠金融",
                              style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500, fontSize: 15)),
                          SizedBox(height: 5),
                          Text("工银普惠行", style: TextStyle(color: Color(0xff666666), fontSize: 12))
                        ]))
                  ])),
                  const SizedBox(width: 10),
                  Expanded(
                      child: Stack(children: [
                    Image.asset("assets/images/home/bg_拥军专区.png", width: double.infinity, fit: BoxFit.fitWidth),
                    const Positioned(
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
                const SizedBox(height: 10),
                Row(children: [
                  Expanded(
                      child: Stack(children: [
                    Image.asset("assets/images/home/bg_服务新市民.png", width: double.infinity, fit: BoxFit.fitWidth),
                    const Positioned(
                        left: 10,
                        top: 10,
                        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                          Text("服务新市民",
                              style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500, fontSize: 15)),
                          SizedBox(height: 5),
                          Text("护航城市梦", style: TextStyle(color: Color(0xff666666), fontSize: 12))
                        ]))
                  ])),
                  const SizedBox(width: 10),
                  Expanded(
                      child: Stack(children: [
                    Image.asset("assets/images/home/bg_代发薪.png", width: double.infinity, fit: BoxFit.fitWidth),
                    const Positioned(
                        left: 10,
                        top: 10,
                        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                          Text("代发薪", style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500, fontSize: 15)),
                          SizedBox(height: 5),
                          Text("薪资打理好帮手", style: TextStyle(color: Color(0xff666666), fontSize: 12))
                        ]))
                  ]))
                ]),
                const SizedBox(height: 10),
                Row(children: [
                  Expanded(
                      child: Stack(children: [
                    Image.asset("assets/images/home/bg_伴宝贝成长.png", width: double.infinity, fit: BoxFit.fitWidth),
                    const Positioned(
                        left: 10,
                        top: 10,
                        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                          Text("伴宝贝成长",
                              style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500, fontSize: 15)),
                          SizedBox(height: 5),
                          Text("子女账户轻松管", style: TextStyle(color: Color(0xff666666), fontSize: 12))
                        ]))
                  ])),
                  const SizedBox(width: 10),
                  Expanded(
                      child: Stack(children: [
                    Image.asset("assets/images/home/bg_养老金融.png", width: double.infinity, fit: BoxFit.fitWidth),
                    const Positioned(
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
              margin: const EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: Colors.white),
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              child: Column(children: [
                Center(
                    child: Row(mainAxisSize: MainAxisSize.min, children: [
                  Container(
                      height: 35,
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          border: Border.all(width: 1, color: const Color(0xff3963CB))),
                      child: const Text("发现更多服务",
                          style: TextStyle(color: Color(0xff3963CB), fontSize: 16, fontWeight: FontWeight.w600)))
                ])),
                const SizedBox(height: 10),
                const Text("打造个性化首页", style: TextStyle(color: Color(0xff999999), fontSize: 12))
              ])),
          const SizedBox(height: 10),
          const HomeBottomView()
        ])));
  }
}
