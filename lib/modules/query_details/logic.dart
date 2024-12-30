import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:icbc/beans/income_expenditure_record.dart';

class QueryDetailsLogic extends GetxController {
  RxList<RecordDateTime> records = RxList<RecordDateTime>([]);

  QueryDetailsLogic() {
    getListData();
  }

  var isLoading = false.obs;

  void getListData() async {
    isLoading.value = true;
    EasyLoading.show(status: '加载中...');
    String response = await rootBundle.loadString("assets/data/records2.json");
    records.value = (json.decode(response) as List).map((item) => RecordDateTime.fromJson(item)).toList();
    isLoading.value = false;
    EasyLoading.dismiss();
  }
}
