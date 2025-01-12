import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:icbc/global/enum.dart';
import 'package:icbc/global/tools.dart';

class FilterDialog extends StatelessWidget {
  final IncomeExpenditureType? type;
  final int? minMoney;
  final int? maxMoney;
  final List<String> tradeTypeText;
  final List<String> currencyIndex;

  const FilterDialog(
      {super.key,
      this.type,
      this.minMoney,
      this.maxMoney,
      this.tradeTypeText = const [],
      this.currencyIndex = const []});

  FilterController get logic => Get.put(
      FilterController(
          type: type,
          minMoney: minMoney,
          maxMoney: maxMoney,
          tradeTypeText: tradeTypeText,
          currencyIndex: currencyIndex),
      permanent: true);

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.black12,
        child: Container(
            color: Colors.white,
            height: .7.sh,
            child: Column(children: [
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
              Expanded(
                  child: SingleChildScrollView(
                      child: Column(mainAxisSize: MainAxisSize.min, children: [
                Container(
                    height: 50,
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.only(left: 15),
                    child: const Text("收支类型")),
                Container(
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Wrap(
                        spacing: 10,
                        children: IncomeExpenditureType.values
                            .map((item) => GestureDetector(onTap: () {
                                  if (logic.incomeExpenditureType.value == item) {
                                    logic.incomeExpenditureType.value = null;
                                  } else {
                                    logic.incomeExpenditureType.value = item;
                                  }
                                  logic.tradeTypeText.clear();
                                }, child: Obx(() {
                                  return Container(
                                      width: 60,
                                      alignment: Alignment.center,
                                      height: 30,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(4),
                                          color: logic.incomeExpenditureType.value == item
                                              ? const Color(0xffFD7B7B)
                                              : const Color(0xfff4f4f4)),
                                      child: Text(item.text,
                                          style: TextStyle(
                                              color: logic.incomeExpenditureType.value == item ? Colors.white : null)));
                                })))
                            .toList())),
                Container(
                    height: 50,
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.only(left: 15),
                    child: const Text("交易类型")),
                Obx(() {
                  return GridView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4, mainAxisSpacing: 5, crossAxisSpacing: 10, childAspectRatio: 2.5),
                      itemBuilder: (BuildContext context, int index) {
                        if (index == logic.length.value) {
                          return GestureDetector(
                              onTap: () {
                                logic.showMore.toggle();
                                if (logic.showMore.value) {
                                  logic.length.value = 34;
                                } else {
                                  logic.length.value = 7;
                                }
                              },
                              child: Container(
                                  width: 60,
                                  alignment: Alignment.center,
                                  height: 30,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4),
                                      border: Border.all(width: .5, color: const Color(0xffFD7B7B)),
                                      color: Colors.white),
                                  child: Text(logic.showMore.value ? "收起" : "展开",
                                      style: const TextStyle(color: Color(0xffFD7B7B)))));
                        }

                        return GestureDetector(onTap: () {
                          logic.incomeExpenditureType.value = null;
                          if (logic.tradeTypeText.contains(tradeType[index])) {
                            logic.tradeTypeText.remove(tradeType[index]);
                          } else {
                            if (logic.tradeTypeText.length >= 3) {
                              EasyLoading.showToast("最多选择3个条件");
                              return;
                            }
                            logic.tradeTypeText.add(tradeType[index]);
                          }
                          logic.tradeTypeText.refresh();
                        }, child: Obx(() {
                          return Container(
                              width: 60,
                              alignment: Alignment.center,
                              height: 30,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4),
                                  color: logic.tradeTypeText.contains(tradeType[index])
                                      ? const Color(0xffFD7B7B)
                                      : const Color(0xfff4f4f4)),
                              child: Text(tradeType[index],
                                  style: TextStyle(
                                      color: logic.tradeTypeText.contains(tradeType[index]) ? Colors.white : null)));
                        }));
                      },
                      itemCount: logic.length.value + 1);
                }),
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

                    logic.minEditingController.text = "${logic.minMoney.value}";
                    logic.maxEditingController.text = "${logic.maxMoney.value}";
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
                    logic.minEditingController.text = "${logic.minMoney.value}";
                    logic.maxEditingController.text = "${logic.maxMoney.value}";
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
                    logic.minEditingController.text = "${logic.minMoney.value}";
                    logic.maxEditingController.text = "${logic.maxMoney.value}";
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
                    logic.maxMoney.value = -1;
                    logic.minMoney.value = 50000;
                    logic.moneyType.value = 3;
                    logic.minEditingController.text = "${logic.minMoney.value}";
                    logic.maxEditingController.text = "";
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
                          child: TextField(
                              controller: logic.minEditingController,
                              maxLines: 1,
                              keyboardType: TextInputType.number,
                              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                              textAlign: TextAlign.center,
                              style:
                                  const TextStyle(color: Color(0xff333333), fontSize: 13, fontWeight: FontWeight.w500),
                              decoration: const InputDecoration(
                                  isDense: true,
                                  contentPadding: EdgeInsets.zero,
                                  border: InputBorder.none,
                                  hintText: "最低金额",
                                  hintStyle: TextStyle(color: Color(0xff999999), fontSize: 13))))),
                  Container(
                      width: 20,
                      height: 2,
                      color: const Color(0xffdddddd),
                      margin: const EdgeInsets.symmetric(horizontal: 10)),
                  Expanded(
                      child: Container(
                          height: 35,
                          alignment: Alignment.centerLeft,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              border: Border.all(color: const Color(0xffdddddd), width: 1)),
                          child: TextField(
                              controller: logic.maxEditingController,
                              maxLines: 1,
                              keyboardType: TextInputType.number,
                              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                              textAlign: TextAlign.center,
                              style:
                                  const TextStyle(color: Color(0xff333333), fontSize: 13, fontWeight: FontWeight.w500),
                              decoration: const InputDecoration(
                                  contentPadding: EdgeInsets.zero,
                                  border: InputBorder.none,
                                  isDense: true,
                                  hintText: "最高金额",
                                  hintStyle: TextStyle(color: Color(0xff999999), fontSize: 13))))),
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
                        crossAxisCount: 4, mainAxisSpacing: 5, crossAxisSpacing: 10, childAspectRatio: 2.5),
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(onTap: () {
                        if (logic.currencyIndex.contains(currency[index])) {
                          logic.currencyIndex.remove(currency[index]);
                        } else {
                          if (logic.currencyIndex.length >= 3) {
                            EasyLoading.showToast("最多可以选择三个条件");
                            return;
                          }
                          logic.currencyIndex.add(currency[index]);
                        }
                        logic.currencyIndex.refresh();
                      }, child: Obx(() {
                        final isSelected = logic.currencyIndex.contains(currency[index]);
                        return Container(
                            width: 60,
                            alignment: Alignment.center,
                            height: 30,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                color: isSelected ? const Color(0xffFD7B7B) : const Color(0xfff4f4f4)),
                            child: Text(currency[index],
                                style: TextStyle(color: isSelected ? Colors.white : null, fontSize: 12)));
                      }));
                    },
                    itemCount: currency.length),
                const SizedBox(height: 10),
                const Divider(height: 0, color: Color(0xffdddddd), indent: 15, endIndent: 15),
                const SizedBox(height: 5),
                Row(children: [
                  const SizedBox(width: 15),
                  const Text("显示未注册用户", style: TextStyle(color: Color(0xff333333), fontSize: 15)),
                  const Text("(含以注销账户)", style: TextStyle(color: Color(0xff999999), fontSize: 13)),
                  const Spacer(),
                  CupertinoSwitch(value: logic.switchValue.value, onChanged: (value) => logic.switchValue.toggle()),
                  const SizedBox(width: 10)
                ]),
                const SizedBox(height: 10)
              ]))),
              const SizedBox(height: 10),
              Row(children: [
                Expanded(
                    child: GestureDetector(
                        onTap: () {
                          logic.currencyIndex.clear();
                          logic.moneyType.value = -1;
                          logic.minEditingController.text = "";
                          logic.maxEditingController.text = "";
                          logic.tradeTypeText.clear();
                          logic.incomeExpenditureType.value = null;
                        },
                        child: Container(
                            margin:
                                EdgeInsets.only(bottom: 10 + MediaQuery.of(context).padding.bottom, left: 15, right: 5),
                            height: 45,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                border: Border.all(color: Colors.red, width: 1)),
                            child: const Text("重置", style: TextStyle(color: Colors.red, fontSize: 18))))),
                Expanded(
                    child: GestureDetector(
                        onTap: logic.submit,
                        child: Container(
                            margin:
                                EdgeInsets.only(bottom: 10 + MediaQuery.of(context).padding.bottom, left: 5, right: 15),
                            height: 45,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(4),
                                border: Border.all(color: Colors.red, width: 1)),
                            child: const Text("确定", style: TextStyle(color: Colors.white, fontSize: 18)))))
              ])
            ])));
  }
}

class FilterController extends GetxController {
  /// 收支类型
  Rx<IncomeExpenditureType?> incomeExpenditureType = Rx<IncomeExpenditureType?>(null);

  /// 交易类型
  var tradeTypeText = RxList<String>([]);

  var moneyType = (-1).obs;
  var minMoney = 0.obs;
  var maxMoney = (-1).obs;

  var currencyIndex = RxList<String>([]);

  TextEditingController minEditingController = TextEditingController();
  TextEditingController maxEditingController = TextEditingController();

  FilterController(
      {IncomeExpenditureType? type,
      int? minMoney,
      int? maxMoney,
      List<String> tradeTypeText = const [],
      List<String> currencyIndex = const []}) {
    print("FilterController@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
    incomeExpenditureType.value = type;
    if (maxMoney != null) {
      this.maxMoney.value = maxMoney;
    }
    if (minMoney != null) {
      this.minMoney.value = minMoney;
    }
    if (currencyIndex.isNotEmpty) {
      this.currencyIndex.value = currencyIndex;
    }
    if (tradeTypeText.isNotEmpty) {
      this.tradeTypeText.value = tradeTypeText;
    }
    minEditingController
      ..addListener(() {
        if (minEditingController.text == "0" && maxEditingController.text == "5000") {
          moneyType.value = 0;
        } else if (maxEditingController.text == "10000" && minEditingController.text == "5000") {
          moneyType.value = 1;
        } else if (maxEditingController.text == "50000" && minEditingController.text == "10000") {
          moneyType.value = 2;
        } else if (maxEditingController.text == "" && minEditingController.text == "50000") {
          moneyType.value = 3;
        } else {
          moneyType.value = -1;
        }
        update();
      })
      ..text = minMoney != null ? "$minMoney" : "";
    maxEditingController
      ..addListener(() {
        if (minEditingController.text == "0" && maxEditingController.text == "5000") {
          moneyType.value = 0;
        } else if (maxEditingController.text == "10000" && minEditingController.text == "5000") {
          moneyType.value = 1;
        } else if (maxEditingController.text == "50000" && minEditingController.text == "10000") {
          moneyType.value = 2;
        } else if (maxEditingController.text == "" && minEditingController.text == "50000") {
          moneyType.value = 3;
        } else {
          moneyType.value = -1;
        }
        update();
      })
      ..text = maxMoney != null ? "$maxMoney" : "";
  }

  var switchValue = true.obs;

  void submit() async {
    int count = 0;
    if (incomeExpenditureType.value != null) {
      count += 1;
    }
    if (tradeTypeText.isNotEmpty) {
      count += tradeTypeText.length;
    }
    if (currencyIndex.isNotEmpty) {
      count += currencyIndex.length;
    }
    if (minEditingController.text.isNotEmpty) {
      count += 1;
    }

    Get.back(result: {
      "type": incomeExpenditureType.value,
      "tradeType": tradeTypeText,
      "minMoney": minEditingController.text.isEmpty ? null : int.parse(minEditingController.text),
      "maxMoney": maxEditingController.text.isEmpty ? null : int.parse(maxEditingController.text),
      "currencyIndex": currencyIndex,
      "count": count
    });
  }

  var showMore = false.obs;

  var length = 7.obs;

  @override
  void onClose() {
    minEditingController.dispose();
    maxEditingController.dispose();
    super.onClose();
  }
}

List<String> currency = ["人民币", "美元", "港币", "欧元", "英镑", "瑞士法郎", "新加坡元", "日元", "加拿大元", "澳大利亚元"];

List<String> tradeType = [
  "消费",
  "贷款",
  "工资",
  "信用卡",
  "还款",
  "支付宝",
  "财付通",
  "京东",
  "美团",
  "转账",
  "餐饮",
  "交通",
  "缴费",
  "ETC",
  "教育",
  "医疗",
  "代扣",
  "基金",
  "理财",
  "保险",
  "贵金属",
  "公积金",
  "社保",
  "养老金",
  "税",
  "报销",
  "退款",
  "现金",
  "取现",
  "购汇",
  "结汇",
  "销户",
  "冲正",
  "其他"
];
