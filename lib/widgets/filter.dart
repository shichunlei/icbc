import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FilterDialog extends StatelessWidget {
  const FilterDialog({super.key});

  FilterController get logic => Get.put(FilterController());

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.black12,
        child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
          Container(
              color: Colors.white,
              child: Column(mainAxisSize: MainAxisSize.min, children: [
                SizedBox(
                    height: 50,
                    child: Stack(children: [
                      const Center(child: Text("筛选", style: TextStyle(color: Colors.black, fontSize: 17))),
                      GestureDetector(
                          onTap: Get.back,
                          child: Container(
                              alignment: Alignment.center,
                              height: 50,
                              width: 40,
                              child: Image.asset("assets/images/detail/my_detail_suspend_layer_close.png", width: 25)))
                    ])),
                const Divider(height: 0, color: Color(0xffdddddd)),
                Container(
                    height: 50,
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.only(left: 15),
                    child: const Text("收支类型")),
                Row(children: [
                  const SizedBox(width: 15),
                  GestureDetector(onTap: () {
                    logic.incomeExpenditureType.value = "income";
                  }, child: Obx(() {
                    return Container(
                        width: 60,
                        alignment: Alignment.center,
                        height: 30,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            color: logic.incomeExpenditureType.value == "income"
                                ? const Color(0xffFD7B7B)
                                : const Color(0xfff4f4f4)),
                        child: Text("收入",
                            style:
                                TextStyle(color: logic.incomeExpenditureType.value == "income" ? Colors.white : null)));
                  })),
                  const SizedBox(width: 10),
                  GestureDetector(onTap: () {
                    logic.incomeExpenditureType.value = "expenditure";
                  }, child: Obx(() {
                    return Container(
                        width: 60,
                        alignment: Alignment.center,
                        height: 30,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            color: logic.incomeExpenditureType.value == "expenditure"
                                ? const Color(0xffFD7B7B)
                                : const Color(0xfff4f4f4)),
                        child: Text("支出",
                            style: TextStyle(
                                color: logic.incomeExpenditureType.value == "expenditure" ? Colors.white : null)));
                  }))
                ]),
                Container(
                    height: 50,
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.only(left: 15),
                    child: const Text("交易类型")),
                GridView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4, mainAxisSpacing: 10, crossAxisSpacing: 10, childAspectRatio: 2.5),
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(onTap: () {
                        logic.tradeType.value = index;
                      }, child: Obx(() {
                        return Container(
                            width: 60,
                            alignment: Alignment.center,
                            height: 30,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                color:
                                    logic.tradeType.value == index ? const Color(0xffFD7B7B) : const Color(0xfff4f4f4)),
                            child: Text("支出",
                                style: TextStyle(color: logic.tradeType.value == index ? Colors.white : null)));
                      }));
                    },
                    itemCount: 20),
                Container(
                    height: 50,
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.only(left: 15),
                    child: const Text("交易金额")),
                Row(children: [
                  const SizedBox(width: 15),
                  Expanded(
                      child: GestureDetector(onTap: () {
                    logic.maxMoney.value = 5000;
                    logic.minMoney.value = 0;
                    logic.moneyType.value = 0;
                  }, child: Obx(() {
                    return Container(
                        width: 60,
                        alignment: Alignment.center,
                        height: 30,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            color: logic.moneyType.value == 0 ? const Color(0xffFD7B7B) : const Color(0xfff4f4f4)),
                        child: Text("小于5千", style: TextStyle(color: logic.moneyType.value == 0 ? Colors.white : null)));
                  }))),
                  const SizedBox(width: 10),
                  Expanded(
                      child: GestureDetector(onTap: () {
                    logic.maxMoney.value = 10000;
                    logic.minMoney.value = 5000;
                    logic.moneyType.value = 1;
                  }, child: Obx(() {
                    return Container(
                        width: 60,
                        alignment: Alignment.center,
                        height: 30,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            color: logic.moneyType.value == 1 ? const Color(0xffFD7B7B) : const Color(0xfff4f4f4)),
                        child:
                            Text("5千-1万", style: TextStyle(color: logic.moneyType.value == 1 ? Colors.white : null)));
                  }))),
                  const SizedBox(width: 10),
                  Expanded(
                      child: GestureDetector(onTap: () {
                    logic.maxMoney.value = 50000;
                    logic.minMoney.value = 10000;
                    logic.moneyType.value = 2;
                  }, child: Obx(() {
                    return Container(
                        width: 60,
                        alignment: Alignment.center,
                        height: 30,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            color: logic.moneyType.value == 2 ? const Color(0xffFD7B7B) : const Color(0xfff4f4f4)),
                        child:
                            Text("1万-5万", style: TextStyle(color: logic.moneyType.value == 2 ? Colors.white : null)));
                  }))),
                  const SizedBox(width: 10),
                  Expanded(
                      child: GestureDetector(onTap: () {
                    logic.maxMoney.value = 100000000000000000;
                    logic.minMoney.value = 50000;
                    logic.moneyType.value = 3;
                  }, child: Obx(() {
                    return Container(
                        width: 60,
                        alignment: Alignment.center,
                        height: 30,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            color: logic.moneyType.value == 3 ? const Color(0xffFD7B7B) : const Color(0xfff4f4f4)),
                        child: Text("大于5万", style: TextStyle(color: logic.moneyType.value == 3 ? Colors.white : null)));
                  }))),
                  const SizedBox(width: 15)
                ]),
                const SizedBox(height: 10),
                Row(children: [
                  const SizedBox(width: 15),
                  Expanded(
                      child: Container(
                          height: 35,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              border: Border.all(color: const Color(0xffdddddd), width: 1)),
                          child: TextField())),
                  Container(
                      width: 20,
                      height: 2,
                      color: const Color(0xffdddddd),
                      margin: const EdgeInsets.symmetric(horizontal: 10)),
                  Expanded(
                      child: Container(
                          height: 35,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              border: Border.all(color: const Color(0xffdddddd), width: 1)),
                          child: TextField())),
                  const SizedBox(width: 15)
                ]),
                Container(
                    height: 50,
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.only(left: 15),
                    child: const Text("交易币种")),
                GridView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4, mainAxisSpacing: 10, crossAxisSpacing: 10, childAspectRatio: 2.5),
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(onTap: () {
                        logic.currencyIndex.value = index;
                      }, child: Obx(() {
                        return Container(
                            width: 60,
                            alignment: Alignment.center,
                            height: 30,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                color: logic.currencyIndex.value == index
                                    ? const Color(0xffFD7B7B)
                                    : const Color(0xfff4f4f4)),
                            child: Text(logic.currency[index],
                                style: TextStyle(color: logic.currencyIndex.value == index ? Colors.white : null)));
                      }));
                    },
                    itemCount: logic.currency.length),
                SizedBox(height: 10),
                Divider(height: 0, color: Color(0xffdddddd), indent: 15, endIndent: 15),
                SizedBox(height: 5),
                Row(children: [
                  SizedBox(width: 15),
                  Text("显示未注册用户", style: TextStyle(color: Color(0xff333333), fontSize: 15)),
                  Text("(含以注销账户)", style: TextStyle(color: Color(0xff999999), fontSize: 13)),
                  const Spacer(),
                  CupertinoSwitch(value: false, onChanged: (value) {}),
                  SizedBox(width: 10)
                ]),
                SizedBox(height: 10),
                GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: Container(
                        margin:
                            EdgeInsets.only(bottom: 10 + MediaQuery.of(context).padding.bottom, left: 15, right: 15),
                        height: 45,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(color: Colors.red, borderRadius: BorderRadius.circular(4)),
                        child: const Text("确定", style: TextStyle(color: Colors.white, fontSize: 18))))
              ]))
        ]));
  }
}

class FilterController extends GetxController {
  /// 收支类型
  var incomeExpenditureType = "".obs;

  /// 交易类型
  var tradeType = (-1).obs;

  var moneyType = 0.obs;

  var minMoney = 0.obs;

  var maxMoney = 0.obs;

  List<String> currency = ["人民币", "美元", "港币", "欧元", "英镑", "瑞士法郎", "新加坡元", "日元", "加拿大元", "澳大利亚元"];

  var currencyIndex = (-1).obs;
}
