import 'package:flutter/material.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:get/get.dart';
import 'package:icbc/global/date_util.dart';
import 'package:icbc/global/enum.dart';
import 'package:icbc/main.dart';
import 'package:icbc/router/router.dart';
import 'package:icbc/widgets/normal_appbar.dart';
import 'package:intl/intl.dart';

import 'logic.dart';

class QueryDetailsPage extends StatelessWidget {
  const QueryDetailsPage({super.key});

  QueryDetailsLogic get logic => Get.find<QueryDetailsLogic>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xffFBFBFB),
        appBar: NormalAppbar(title: "查询明细", actions: [
          TextButton(onPressed: () {}, child: const Text("更多查询", style: TextStyle(color: Color(0xff5F7484))))
        ]),
        body: Obx(() {
          return CustomScrollView(slivers: [
            SliverToBoxAdapter(
                child: Container(
                    color: Colors.white,
                    child: Column(children: [
                      Container(
                          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                          child: Row(children: [
                            Image.asset("assets/images/detail/grayweight_card.webp", width: 60, height: 40),
                            const SizedBox(width: 5),
                            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                              const Text("借记卡(I类) 尾号0554", style: TextStyle(color: Color(0xff222222), fontSize: 14)),
                              Text("人民币余额:${Get.find<GlobalController>().balanceStr}",
                                  style: const TextStyle(color: Color(0xff666666), fontSize: 13)),
                            ])
                          ])),
                      Container(
                          margin: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                          decoration:
                              BoxDecoration(color: const Color(0xffFFFDF4), borderRadius: BorderRadius.circular(8)),
                          child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                            Text("当页汇总笔数：${logic.count.value}",
                                style: const TextStyle(fontSize: 12, color: Color(0xff666666))),
                            Expanded(
                                child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
                              Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                                Image.asset("assets/images/tip_image_blue.png", width: 13),
                                const SizedBox(width: 5),
                                RichText(
                                    text: TextSpan(children: [
                                  const TextSpan(text: "收"),
                                  TextSpan(
                                      text: "￥${NumberFormat("#,##0.00", "en_US").format(logic.income.value)}",
                                      style: const TextStyle(color: Color(0xffC84C41)))
                                ], style: const TextStyle(fontSize: 12, color: Color(0xff666666))))
                              ]),
                              const SizedBox(height: 10),
                              RichText(
                                  text: TextSpan(children: [
                                const TextSpan(text: "支"),
                                TextSpan(
                                    text: "￥${NumberFormat("#,##0.00", "en_US").format(logic.expenditure.value)}",
                                    style: const TextStyle(color: Color(0xff3A837A)))
                              ], style: const TextStyle(fontSize: 12, color: Color(0xff666666))))
                            ]))
                          ]))
                    ]))),
            ...logic.isLoading.value
                ? [
                    SliverToBoxAdapter(
                        child: Container(alignment: Alignment.center, height: 200, child: Text("正在加载数据")))
                  ]
                : logic.records.isNotEmpty
                    ? logic.records
                        .map((item) => SliverStickyHeader.builder(
                            sticky: true,
                            sliver: SliverList.separated(
                                itemBuilder: (_, dayIndex) {
                                  return Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                                    Container(
                                        padding: const EdgeInsets.only(top: 15),
                                        width: 60,
                                        child: Column(children: [
                                          Text("${item.days[dayIndex].day}",
                                              style: TextStyle(
                                                  color: DateUtil.getWeekDayColor(item.days[dayIndex].date!),
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w600)),
                                          const SizedBox(height: 1),
                                          Text(DateUtil.getWeekDay(item.days[dayIndex].date!),
                                              style: TextStyle(
                                                  color: DateUtil.getWeekDayColor(item.days[dayIndex].date!),
                                                  fontSize: 14))
                                        ])),
                                    Expanded(
                                        child: Container(
                                            color: Colors.white,
                                            child: ListView.separated(
                                                padding: EdgeInsets.zero,
                                                shrinkWrap: true,
                                                physics: const NeverScrollableScrollPhysics(),
                                                itemBuilder: (_, i) {
                                                  return GestureDetector(
                                                      behavior: HitTestBehavior.translucent,
                                                      onTap: () {
                                                        Get.toNamed(AppRouter.minePages.queryDetailInfoRoute.name,
                                                            arguments: {"ITEM": item.days[dayIndex].items[i]});
                                                      },
                                                      child: Container(
                                                          padding: const EdgeInsets.only(
                                                              left: 15, right: 15, top: 15, bottom: 10),
                                                          child: Column(
                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                              children: [
                                                                Row(children: [
                                                                  Text("${item.days[dayIndex].items[i].summary}",
                                                                      style: const TextStyle(
                                                                          fontWeight: FontWeight.w500,
                                                                          color: Colors.black,
                                                                          fontSize: 14)),
                                                                  const Spacer(),
                                                                  Text(
                                                                      "${item.days[dayIndex].items[i].type == IncomeExpenditureType.income ? "+" : "-"}${NumberFormat("#,##0.00", "en_US").format(item.days[dayIndex].items[i].money)}",
                                                                      style: TextStyle(
                                                                          fontWeight: FontWeight.w500,
                                                                          color: item.days[dayIndex].items[i].type ==
                                                                                  IncomeExpenditureType.income
                                                                              ? const Color(0xffC84C41)
                                                                              : const Color(0xff3A837A),
                                                                          fontSize: 20))
                                                                ]),
                                                                Text("${item.days[dayIndex].items[i].place}",
                                                                    style: const TextStyle(
                                                                        color: Color(0xff555555), fontSize: 14)),
                                                                const SizedBox(height: 5),
                                                                Row(children: [
                                                                  Text("${item.days[dayIndex].items[i].bankName} ",
                                                                      style: const TextStyle(
                                                                          color: Color(0xff666666), fontSize: 12)),
                                                                  Text(
                                                                      DateUtil.getTimeFromString(
                                                                          item.days[dayIndex].items[i].time!,
                                                                          "HH:mm:ss"),
                                                                      style: const TextStyle(
                                                                          color: Color(0xff999999), fontSize: 12)),
                                                                  const Spacer(),
                                                                  const Text("余额:",
                                                                      style: TextStyle(
                                                                          color: Color(0xff666666), fontSize: 12)),
                                                                  Text(
                                                                      NumberFormat("#,##0.00", "en_US")
                                                                          .format(item.days[dayIndex].items[i].balance),
                                                                      style: const TextStyle(
                                                                          fontWeight: FontWeight.w500,
                                                                          color: Color(0xff666666),
                                                                          fontSize: 14))
                                                                ])
                                                              ])));
                                                },
                                                separatorBuilder: (_, index) {
                                                  return const Divider(height: 0, color: Color(0xffeeeeee));
                                                },
                                                itemCount: item.days[dayIndex].items.length)))
                                  ]);
                                },
                                separatorBuilder: (_, index) {
                                  return const Divider(height: 0, color: Color(0xffeeeeee));
                                },
                                itemCount: item.days.length),
                            builder: (BuildContext context, SliverStickyHeaderState state) {
                              print("--${state.isPinned}----------------${state.scrollPercentage}");

                              return Container(
                                  color: const Color(0xffEEEEEE),
                                  height: 40,
                                  alignment: Alignment.centerLeft,
                                  padding: const EdgeInsets.only(left: 15),
                                  child: Text("${item.year}年${item.month}月",
                                      style: const TextStyle(color: Color(0xff333333), fontSize: 15)));
                            }))
                        .toList()
                    : [
                        SliverToBoxAdapter(
                            child: Container(alignment: Alignment.center, height: 200, child: Text("暂无数据")))
                      ],

            // SliverToBoxAdapter(
            //     child: Container(
            //         height: 200,
            //         padding: const EdgeInsets.only(top: 20, left: 15, right: 15),
            //         alignment: Alignment.topCenter,
            //         child: const Text("以上为您近一个月的账户交易明细，如需查询更长时间范围的明细，请点击右上角“更多查询”。",
            //             textAlign: TextAlign.center, style: TextStyle(color: Color(0xff687379)))))

            const SliverToBoxAdapter(child: SizedBox(height: 30))
          ]);
        }));
  }
}
