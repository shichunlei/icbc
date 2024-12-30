import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icbc/main.dart';
import 'package:icbc/widgets/filter.dart';
import 'package:icbc/widgets/filter_bottom.dart';
import 'package:icbc/widgets/select_account.dart';
import 'package:icbc/widgets/select_time.dart';
import 'package:icbc/widgets/select_user.dart';

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
                          BoxDecoration(borderRadius: BorderRadius.circular(30), color: const Color(0xffdddddd)),
                      child: Row(children: [
                        const SizedBox(width: 8),
                        Image.asset("assets/images/icon_search_b.png", width: 15, height: 15),
                        const SizedBox(width: 5),
                        const Expanded(child: Text("全部应用", style: TextStyle(color: Color(0xff999999), fontSize: 12)))
                      ]))),
              centerTitle: true,
              actions: [
                Image.asset("assets/images/base_im_icon_service.png", width: 25),
                const SizedBox(width: 15),
                Image.asset("assets/images/base_im_icon_more.png", width: 25),
                const SizedBox(width: 10)
              ],
              bottom: FilterBottomView(
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
                        }
                        if (value["startDate"] != null && value["stopDate"] != null) {
                          logic.timeStr.value = "${value["startDate"]}\n${value["stopDate"]}";
                          logic.selectMonth.value = null;
                          logic.minTime.value = value["startDate"];
                          logic.maxTime.value = value["stopDate"];
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
          body: Column(children: []));
    });
  }
}
