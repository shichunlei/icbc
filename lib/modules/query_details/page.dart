import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icbc/beans/income_expenditure_record.dart';
import 'package:icbc/main.dart';
import 'package:icbc/router/router.dart';
import 'package:icbc/widgets/normal_appbar.dart';

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
        body: CustomScrollView(slivers: [
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
                  decoration: BoxDecoration(color: Color(0xffFFFDF4), borderRadius: BorderRadius.circular(8)),
                  child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    const Text("当页汇总笔数：20", style: TextStyle(fontSize: 12, color: Color(0xff666666))),
                    Expanded(
                        child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
                      Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                        Image.asset("assets/images/tip_image_blue.png", width: 13),
                        const SizedBox(width: 5),
                        RichText(
                            text: const TextSpan(children: [
                          TextSpan(text: "收"),
                          TextSpan(text: "￥1,232,131.09", style: TextStyle(color: Color(0xffC84C41)))
                        ], style: TextStyle(fontSize: 12, color: Color(0xff666666))))
                      ]),
                      const SizedBox(height: 10),
                      RichText(
                          text: const TextSpan(children: [
                        TextSpan(text: "支"),
                        TextSpan(text: "￥1,232,131.09", style: TextStyle(color: Color(0xff3A837A)))
                      ], style: TextStyle(fontSize: 12, color: Color(0xff666666))))
                    ]))
                  ]))
            ]),
          )),
          SliverList.builder(
              itemBuilder: (_, index) {
                return Column(children: [
                  Container(
                      color: const Color(0xffEEEEEE),
                      height: 40,
                      alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.only(left: 15),
                      child:
                          Text("2024年${12 - index}月", style: const TextStyle(color: Color(0xff333333), fontSize: 15))),
                  ListView.separated(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (_, index) {
                        return Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                          Container(
                              padding: const EdgeInsets.only(top: 15),
                              width: 60,
                              child: Column(children: [
                                Text("${22 - index}",
                                    style: const TextStyle(
                                        color: Color(0xff3268E1), fontSize: 20, fontWeight: FontWeight.w600)),
                                const SizedBox(height: 1),
                                const Text("周日", style: TextStyle(color: Color(0xff3268E1), fontSize: 14))
                              ])),
                          Expanded(
                              child: Container(
                                  color: Colors.white,
                                  child: ListView.separated(
                                      padding: EdgeInsets.zero,
                                      shrinkWrap: true,
                                      physics: const NeverScrollableScrollPhysics(),
                                      itemBuilder: (_, index) {
                                        return GestureDetector(
                                          behavior: HitTestBehavior.translucent,
                                          onTap: () {
                                            Get.toNamed(AppRouter.minePages.incomeExpenditureDetailRoute.name,
                                                arguments: {
                                                  "ITEM": const IncomeExpenditureRecord(
                                                      id: "001",
                                                      title: "消费",
                                                      type: "income",
                                                      subType: "alipay",
                                                      subTypeText: "转给他人",
                                                      mineCardNumber: "6217****0554",
                                                      account: "6217****0554",
                                                      isOrder: true,
                                                      includedIncomeExpenditure: false,
                                                      mineName: "包汉林",
                                                      remark: "",
                                                      time: "2024-12-22 02:22:23",
                                                      summary: "购物",
                                                      remarkImages: [],
                                                      accountingAmount: 10.00,
                                                      money: 10.00,
                                                      balance: 12.09,
                                                      country: "CHN",
                                                      currency: "人民币",
                                                      counterpartAccount: "0021****1223",
                                                      counterpartBankName: "支付宝-备付金账户",
                                                      counterpartCardNumber: "2155****0690",
                                                      counterpartName: "支付宝（中国）网络技术有限公司",
                                                      place: "财付通-微信转账")
                                                });
                                          },
                                          child: Container(
                                              padding: const EdgeInsets.only(left: 15, right: 15, top: 15, bottom: 10),
                                              child:
                                                  const Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                                                Row(children: [
                                                  Text("充值",
                                                      style: TextStyle(
                                                          fontWeight: FontWeight.w500,
                                                          color: Colors.black,
                                                          fontSize: 14)),
                                                  Spacer(),
                                                  Text("-10.00",
                                                      style: TextStyle(
                                                          fontWeight: FontWeight.w500,
                                                          color: Color(0xff3A837A),
                                                          fontSize: 20))
                                                ]),
                                                Text("财付通-微信零钱充值账户",
                                                    style: TextStyle(color: Color(0xff555555), fontSize: 14)),
                                                SizedBox(height: 5),
                                                Row(children: [
                                                  Text("工银借记卡0554 ",
                                                      style: TextStyle(color: Color(0xff666666), fontSize: 12)),
                                                  Text("20:52:30",
                                                      style: TextStyle(color: Color(0xff999999), fontSize: 12)),
                                                  Spacer(),
                                                  Text("余额:", style: TextStyle(color: Color(0xff666666), fontSize: 12)),
                                                  Text("6.98",
                                                      style: TextStyle(
                                                          fontWeight: FontWeight.w500,
                                                          color: Color(0xff666666),
                                                          fontSize: 14))
                                                ])
                                              ])),
                                        );
                                      },
                                      separatorBuilder: (_, index) {
                                        return const Divider(height: 0, color: Color(0xffeeeeee));
                                      },
                                      itemCount: 4)))
                        ]);
                      },
                      separatorBuilder: (_, index) {
                        return const Divider(height: 0, color: Color(0xffeeeeee));
                      },
                      itemCount: 4)
                ]);
              },
              itemCount: 10)
        ]));
  }
}
