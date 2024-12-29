import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icbc/beans/income_expenditure_record.dart';
import 'package:icbc/router/router.dart';
import 'package:icbc/widgets/normal_appbar.dart';

import 'logic.dart';

class IncomeExpenditurePage extends StatelessWidget {
  const IncomeExpenditurePage({super.key});

  IncomeExpenditureLogic get logic => Get.find<IncomeExpenditureLogic>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const NormalAppbar(title: ""),
        body: Column(children: [
          TextButton(
              child: Text("查看详情"),
              onPressed: () {
                Get.toNamed(AppRouter.minePages.incomeExpenditureDetailRoute.name, arguments: {
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
              })
        ]));
  }
}
