import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:icbc/beans/income_expenditure_record.dart';
import 'package:icbc/global/enum.dart';

class QueryDetailsLogic extends GetxController {
  RxList<RecordDateTime> records = RxList<RecordDateTime>([]);

  QueryDetailsLogic() {
    getListData();
  }

  var isLoading = false.obs;

  var count = 0.obs;
  var income = .0.obs;
  var expenditure = .0.obs;

  void getListData() async {
    isLoading.value = true;
    EasyLoading.show(status: '加载中...');
    String response = await rootBundle.loadString("assets/data/records2.json");
    records.value = (json.decode(response) as List).map((item) => RecordDateTime.fromJson(item)).toList();

    for (var mouth in records) {
      for (var day in mouth.days) {
        count.value = count.value + day.items.length;
        for (var item in day.items) {
          if (item.type == IncomeExpenditureType.income) {
            income.value = income.value + item.money;
          }
          if (item.type == IncomeExpenditureType.expenditure) {
            expenditure.value = expenditure.value + item.money;
          }
        }
      }
    }

    isLoading.value = false;
    EasyLoading.dismiss();
  }
}
