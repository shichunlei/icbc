import 'package:flutter/material.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:get/get.dart';
import 'package:icbc/global/date_util.dart';
import 'package:icbc/global/enum.dart';
import 'package:icbc/main.dart';
import 'package:icbc/router/router.dart';
import 'package:icbc/widgets/filter.dart';
import 'package:icbc/widgets/filter_bottom.dart';
import 'package:icbc/widgets/select_account.dart';
import 'package:icbc/widgets/select_time.dart';
import 'package:icbc/widgets/select_user.dart';
import 'package:intl/intl.dart';

import 'logic.dart';

class IncomeExpenditurePage extends StatelessWidget {
  const IncomeExpenditurePage({super.key});

  IncomeExpenditureLogic get logic => Get.find<IncomeExpenditureLogic>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
          appBar: AppBar(
              leading: GestureDetector(
                  onTap: Get.back,
                  child: Container(
                      width: kToolbarHeight,
                      height: kToolbarHeight,
                      alignment: Alignment.center,
                      child: Image.asset("assets/images/base_im_icon_back.png", width: 25))),
              elevation: 0,
              backgroundColor: Colors.white,
              titleSpacing: 0,
              title: Center(
                  child: Container(
                      height: 30,
                      width: double.infinity,
                      margin: const EdgeInsets.only(right: 15),
                      decoration:
                          BoxDecoration(borderRadius: BorderRadius.circular(30), color: const Color(0xffF4F4F4)),
                      child: Row(children: [
                        const SizedBox(width: 8),
                        Image.asset("assets/images/icon_search_b.png", width: 15, height: 15),
                        const SizedBox(width: 5),
                        const Expanded(child: Text("全部应用", style: TextStyle(color: Color(0xff999999), fontSize: 12)))
                      ]))),
              centerTitle: true,
              actions: [
                Image.asset("assets/images/base_im_icon_service.png", width: 20),
                const SizedBox(width: 15),
                Image.asset("assets/images/base_im_icon_more.png", width: 20),
                const SizedBox(width: 10)
              ],
              bottom: FilterBottomView(
                  index: logic.selectIndex.value,
                  onFilter: () {
                    logic.selectIndex.value = 1;
                    Get.bottomSheet(const FilterDialog(), isScrollControlled: true).then((value) {
                      logic.selectIndex.value = 0;
                      logic.number.value = 2;
                    });
                  },
                  filterNumber: logic.number.value,
                  onSelectAccount: () {
                    logic.selectIndex.value = 2;
                    Get.bottomSheet(SelectAccountDialog(account: logic.account.value), isScrollControlled: true)
                        .then((value) {
                      logic.selectIndex.value = 0;
                      if (value != null) {
                        if (value == "") {
                          logic.account.value = null;
                        } else {
                          logic.account.value = value;
                        }
                      }
                    });
                  },
                  account: logic.account.value,
                  onSelectTime: () {
                    logic.selectIndex.value = 3;
                    Get.bottomSheet(
                            SelectTimeDialog(
                                minTime: logic.minTime.value,
                                maxTime: logic.maxTime.value,
                                selectMonth: logic.selectMonth.value),
                            isScrollControlled: true)
                        .then((value) {
                      logic.selectIndex.value = 0;
                      if (value != null) {
                        if (value["selectMonth"] != null) {
                          logic.timeStr.value = value["selectMonth"];
                          logic.selectMonth.value = value["selectMonth"];
                          logic.minTime.value = null;
                          logic.maxTime.value = null;
                          print("===${logic.selectMonth.value}");
                          logic.defaultView.value = true;
                          logic.getListData();
                        }
                        if (value["startDate"] != null && value["stopDate"] != null) {
                          logic.timeStr.value = "${value["startDate"]}\n${value["stopDate"]}";
                          logic.selectMonth.value = null;
                          logic.minTime.value = value["startDate"];
                          logic.maxTime.value = value["stopDate"];
                          logic.defaultView.value = false;
                          logic.getListData();
                        }
                      }
                    });
                  },
                  time: logic.timeStr.value,
                  onSelectUser: () {
                    logic.selectIndex.value = 0;
                    Get.bottomSheet(const SelectUserDialog(), isScrollControlled: true).then((value) {
                      logic.selectIndex.value = 0;
                    });
                  },
                  userName: Get.find<GlobalController>().starName)),
          body: CustomScrollView(
              slivers: logic.defaultView.value
                  ? [
                      logic.isLoading.value
                          ? SliverToBoxAdapter(
                              child: Container(alignment: Alignment.center, height: 200, child: Text("正在加载数据")))
                          : logic.records.isNotEmpty
                              ? SliverList.builder(
                                  itemBuilder: (_, index) {
                                    return Column(children: [
                                      Stack(children: [
                                        Image.asset(
                                            index == 0
                                                ? "assets/images/detail/my_detail_${logic.records[index].month}ths_bg_max.webp"
                                                : "assets/images/detail/my_detail_${logic.records[index].month}ths_bg.webp",
                                            width: double.infinity,
                                            fit: BoxFit.fitWidth),
                                        Column(mainAxisSize: MainAxisSize.min, children: [
                                          Padding(
                                              padding: EdgeInsets.only(
                                                  left: 15,
                                                  right: 15,
                                                  bottom: index == 0 ? 15 : 5,
                                                  top: index == 0 ? 20 : 10),
                                              child: Row(crossAxisAlignment: CrossAxisAlignment.end, children: [
                                                Image.asset("${logic.records[index].monthIcon}", width: 35),
                                                const Spacer(),
                                                RichText(
                                                    text: TextSpan(
                                                        children: logic.records[index].days.isEmpty
                                                            ? [
                                                                const TextSpan(
                                                                    text: "本月无交易数据", style: TextStyle(fontSize: 12)),
                                                              ]
                                                            : [
                                                                ...index == 0
                                                                    ? [
                                                                        WidgetSpan(
                                                                            child: Image.asset(
                                                                                "assets/images/icon_tip_red.webp",
                                                                                width: 14))
                                                                      ]
                                                                    : [],
                                                                const TextSpan(
                                                                    text: " 收 ", style: TextStyle(fontSize: 12)),
                                                                TextSpan(
                                                                    text:
                                                                        "￥${NumberFormat("#,##0.00", "en_US").format(logic.records[index].income)}",
                                                                    style: const TextStyle(color: Color(0xffC84C41)))
                                                              ],
                                                        style: const TextStyle(color: Color(0xff333333), fontSize: 14)))
                                              ])),
                                          Padding(
                                              padding: const EdgeInsets.only(left: 15, right: 15),
                                              child: Row(children: [
                                                ...index == 0
                                                    ? [
                                                        Image.asset("assets/images/detail/my_detail_analyzes.webp",
                                                            width: 18),
                                                        const SizedBox(width: 5),
                                                        const Text("收支分析",
                                                            style: TextStyle(color: Color(0xff333333), fontSize: 13))
                                                      ]
                                                    : [],
                                                const Spacer(),
                                                RichText(
                                                    text: TextSpan(children: [
                                                  const TextSpan(text: "支 ", style: TextStyle(fontSize: 12)),
                                                  TextSpan(
                                                      text:
                                                          "￥${NumberFormat("#,##0.00", "en_US").format(logic.records[index].expenditure)}",
                                                      style: const TextStyle(color: Color(0xff3A837A)))
                                                ], style: const TextStyle(color: Color(0xff333333), fontSize: 14)))
                                              ]))
                                        ])
                                      ]),
                                      Container(
                                          color: const Color(0xffFBFBFB),
                                          child: ListView.separated(
                                              padding: EdgeInsets.zero,
                                              shrinkWrap: true,
                                              physics: const NeverScrollableScrollPhysics(),
                                              itemBuilder: (_, dayIndex) {
                                                return Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                                                  Container(
                                                      padding: const EdgeInsets.only(top: 15),
                                                      width: 60,
                                                      child: Column(children: [
                                                        Text("${logic.records[index].days[dayIndex].day}",
                                                            style: TextStyle(
                                                                color: DateUtil.getWeekDayColor(
                                                                    logic.records[index].days[dayIndex].date!),
                                                                fontSize: 20,
                                                                fontWeight: FontWeight.w600)),
                                                        const SizedBox(height: 1),
                                                        Text(
                                                            DateUtil.getWeekDay(
                                                                logic.records[index].days[dayIndex].date!),
                                                            style: TextStyle(
                                                                color: DateUtil.getWeekDayColor(
                                                                    logic.records[index].days[dayIndex].date!),
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
                                                                      Get.toNamed(
                                                                          AppRouter.minePages
                                                                              .incomeExpenditureDetailRoute.name,
                                                                          arguments: {
                                                                            "ITEM": logic
                                                                                .records[index].days[dayIndex].items[i]
                                                                          });
                                                                    },
                                                                    child: Container(
                                                                        padding: const EdgeInsets.only(
                                                                            left: 15, right: 15, top: 15, bottom: 10),
                                                                        child: Row(
                                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                                          children: [
                                                                            Padding(
                                                                                padding: const EdgeInsets.only(
                                                                                    right: 8, top: 10),
                                                                                child: Image.asset(
                                                                                    logic.records[index].days[dayIndex]
                                                                                                    .items[i].icon ==
                                                                                                null ||
                                                                                            logic
                                                                                                    .records[index]
                                                                                                    .days[dayIndex]
                                                                                                    .items[i]
                                                                                                    .icon ==
                                                                                                ""
                                                                                        ? "assets/images/detail/icon_type_expenditure_wechat.webp"
                                                                                        : "${logic.records[index].days[dayIndex].items[i].icon}",
                                                                                    width: 30,
                                                                                    height: 30)),
                                                                            Expanded(
                                                                              child: Column(
                                                                                  crossAxisAlignment:
                                                                                      CrossAxisAlignment.start,
                                                                                  children: [
                                                                                    Row(children: [
                                                                                      Text(
                                                                                          "${logic.records[index].days[dayIndex].items[i].summary}",
                                                                                          style: const TextStyle(
                                                                                              fontWeight:
                                                                                                  FontWeight.w500,
                                                                                              color: Colors.black,
                                                                                              fontSize: 14)),
                                                                                      const Spacer(),
                                                                                      Text(
                                                                                          "${logic.records[index].days[dayIndex].items[i].type == IncomeExpenditureType.income ? "+" : "-"}${NumberFormat("#,##0.00", "en_US").format(logic.records[index].days[dayIndex].items[i].money)}",
                                                                                          style: TextStyle(
                                                                                              fontWeight:
                                                                                                  FontWeight.w500,
                                                                                              color: logic
                                                                                                          .records[
                                                                                                              index]
                                                                                                          .days[
                                                                                                              dayIndex]
                                                                                                          .items[i]
                                                                                                          .type ==
                                                                                                      IncomeExpenditureType
                                                                                                          .income
                                                                                                  ? const Color(
                                                                                                      0xffC84C41)
                                                                                                  : const Color(
                                                                                                      0xff3A837A),
                                                                                              fontSize: 20))
                                                                                    ]),
                                                                                    Text(
                                                                                        "${logic.records[index].days[dayIndex].items[i].place}",
                                                                                        style: const TextStyle(
                                                                                            color: Color(0xff555555),
                                                                                            fontSize: 14)),
                                                                                    const SizedBox(height: 5),
                                                                                    Row(children: [
                                                                                      Text(
                                                                                          "${logic.records[index].days[dayIndex].items[i].bankName} ",
                                                                                          style: const TextStyle(
                                                                                              color: Color(0xff666666),
                                                                                              fontSize: 12)),
                                                                                      Text(
                                                                                          DateUtil.getTimeFromString(
                                                                                              logic
                                                                                                  .records[index]
                                                                                                  .days[dayIndex]
                                                                                                  .items[i]
                                                                                                  .time!,
                                                                                              "HH:mm:ss"),
                                                                                          style: const TextStyle(
                                                                                              color: Color(0xff999999),
                                                                                              fontSize: 12)),
                                                                                      const Spacer(),
                                                                                      const Text("余额:",
                                                                                          style: TextStyle(
                                                                                              color: Color(0xff666666),
                                                                                              fontSize: 12)),
                                                                                      Text(
                                                                                          NumberFormat(
                                                                                                  "#,##0.00", "en_US")
                                                                                              .format(logic
                                                                                                  .records[index]
                                                                                                  .days[dayIndex]
                                                                                                  .items[i]
                                                                                                  .balance),
                                                                                          style: const TextStyle(
                                                                                              color: Color(0xff666666),
                                                                                              fontSize: 13))
                                                                                    ])
                                                                                  ]),
                                                                            ),
                                                                          ],
                                                                        )));
                                                              },
                                                              separatorBuilder: (_, index) {
                                                                return const Divider(
                                                                    height: 0, color: Color(0xffeeeeee));
                                                              },
                                                              itemCount:
                                                                  logic.records[index].days[dayIndex].items.length)))
                                                ]);
                                              },
                                              separatorBuilder: (_, index) {
                                                return const Divider(height: 0, color: Color(0xffeeeeee));
                                              },
                                              itemCount: logic.records[index].days.length))
                                    ]);
                                  },
                                  itemCount: logic.records.length)
                              : SliverToBoxAdapter(
                                  child: Container(alignment: Alignment.center, height: 200, child: Text("暂无数据")))
                    ]
                  : [
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
                                                                  Get.toNamed(
                                                                      AppRouter
                                                                          .minePages.incomeExpenditureDetailRoute.name,
                                                                      arguments: {
                                                                        "ITEM": item.days[dayIndex].items[i]
                                                                      });
                                                                },
                                                                child: Container(
                                                                    padding: const EdgeInsets.only(
                                                                        left: 15, right: 15, top: 15, bottom: 10),
                                                                    child: Column(
                                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                                        children: [
                                                                          Row(children: [
                                                                            Text(
                                                                                "${item.days[dayIndex].items[i].summary}",
                                                                                style: const TextStyle(
                                                                                    fontWeight: FontWeight.w500,
                                                                                    color: Colors.black,
                                                                                    fontSize: 14)),
                                                                            const Spacer(),
                                                                            Text(
                                                                                "${item.days[dayIndex].items[i].type == IncomeExpenditureType.income ? "+" : "-"}${NumberFormat("#,##0.00", "en_US").format(item.days[dayIndex].items[i].money)}",
                                                                                style: TextStyle(
                                                                                    fontWeight: FontWeight.w500,
                                                                                    color: item.days[dayIndex].items[i]
                                                                                                .type ==
                                                                                            IncomeExpenditureType.income
                                                                                        ? const Color(0xffC84C41)
                                                                                        : const Color(0xff3A837A),
                                                                                    fontSize: 20))
                                                                          ]),
                                                                          Text("${item.days[dayIndex].items[i].place}",
                                                                              style: const TextStyle(
                                                                                  color: Color(0xff555555),
                                                                                  fontSize: 14)),
                                                                          const SizedBox(height: 5),
                                                                          Row(children: [
                                                                            Text(
                                                                                "${item.days[dayIndex].items[i].bankName} ",
                                                                                style: const TextStyle(
                                                                                    color: Color(0xff666666),
                                                                                    fontSize: 12)),
                                                                            Text(
                                                                                DateUtil.getTimeFromString(
                                                                                    item.days[dayIndex].items[i].time!,
                                                                                    "HH:mm:ss"),
                                                                                style: const TextStyle(
                                                                                    color: Color(0xff999999),
                                                                                    fontSize: 12)),
                                                                            const Spacer(),
                                                                            const Text("余额:",
                                                                                style: TextStyle(
                                                                                    color: Color(0xff666666),
                                                                                    fontSize: 12)),
                                                                            Text(
                                                                                NumberFormat("#,##0.00", "en_US")
                                                                                    .format(item.days[dayIndex].items[i]
                                                                                        .balance),
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
                                ]
                    ]));
    });
  }
}
