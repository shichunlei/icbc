import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:icbc/global/enum.dart';

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
                GridView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4, mainAxisSpacing: 10, crossAxisSpacing: 10, childAspectRatio: 2.5),
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(onTap: () {
                        logic.tradeTypeIndex.value = index;
                      }, child: Obx(() {
                        return Container(
                            width: 60,
                            alignment: Alignment.center,
                            height: 30,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                color: logic.tradeTypeIndex.value == index
                                    ? const Color(0xffFD7B7B)
                                    : const Color(0xfff4f4f4)),
                            child: Text(logic.tradeType[index],
                                style: TextStyle(color: logic.tradeTypeIndex.value == index ? Colors.white : null)));
                      }));
                    },
                    itemCount: logic.tradeType.length),
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
                                  contentPadding: EdgeInsets.zero,
                                  border: InputBorder.none,
                                  hintText: "最小金额",
                                  hintStyle: TextStyle(color: Color(0xff999999), fontSize: 13))))),
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
                                  hintText: "最大金额",
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
                        crossAxisCount: 4, mainAxisSpacing: 10, crossAxisSpacing: 10, childAspectRatio: 2.5),
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(onTap: () {
                        logic.currencyIndexs.add(index) ;
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
                                style: TextStyle(
                                    color: logic.currencyIndex.value == index ? Colors.white : null, fontSize: 12)));
                      }));
                    },
                    itemCount: logic.currency.length),
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
                const SizedBox(height: 10),
                Row(children: [
                  Expanded(
                      child: GestureDetector(
                          onTap: logic.submit,
                          child: Container(
                              margin: EdgeInsets.only(
                                  bottom: 10 + MediaQuery.of(context).padding.bottom, left: 15, right: 5),
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
                              margin: EdgeInsets.only(
                                  bottom: 10 + MediaQuery.of(context).padding.bottom, left: 5, right: 15),
                              height: 45,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(4),
                                  border: Border.all(color: Colors.red, width: 1)),
                              child: const Text("确定", style: TextStyle(color: Colors.white, fontSize: 18)))))
                ])
              ]))
        ]));
  }
}

class FilterController extends GetxController {
  /// 收支类型
  Rx<IncomeExpenditureType?> incomeExpenditureType = Rx<IncomeExpenditureType?>(null);

  /// 交易类型
  var tradeTypeIndex = (-1).obs;

  var moneyType = (-1).obs;
  var minMoney = 0.obs;
  var maxMoney = (-1).obs;

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

  RxList<int> currencyIndexs = RxList<int>([]);

  late TextEditingController minEditingController;
  late TextEditingController maxEditingController;

  FilterController() {
    minEditingController = TextEditingController()
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
      });
    maxEditingController = TextEditingController()
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
      });
  }

  var switchValue = true.obs;

  void submit() async {
    Get.back();
  }

  @override
  void onClose() {
    minEditingController.dispose();
    maxEditingController.dispose();
    super.onClose();
  }
}
