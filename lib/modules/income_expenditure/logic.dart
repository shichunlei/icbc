import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:icbc/beans/income_expenditure_record.dart';

class IncomeExpenditureLogic extends GetxController {
  Rx<String?> account = Rx<String?>(null);

  var selectIndex = 0.obs;

  var number = 0.obs;

  Rx<String?> timeStr = Rx<String?>(null);

  Rx<String?> maxTime = Rx<String?>(null);
  Rx<String?> minTime = Rx<String?>(null);
  Rx<String?> selectMonth = Rx<String?>(null);

  RxList<RecordDateTime> records = RxList<RecordDateTime>([]);

  IncomeExpenditureLogic() {
    getListData();
  }

  var isLoading = false.obs;

  void getListData() async {
    isLoading.value = true;
    EasyLoading.show(status: '加载中...');
    String response = await rootBundle.loadString("assets/data/records.json");
    records.value = (json.decode(response) as List).map((item) => RecordDateTime.fromJson(item)).toList();
    isLoading.value = false;
    EasyLoading.dismiss();
  }
}
