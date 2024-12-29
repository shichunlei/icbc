import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:icbc/beans/income_expenditure_record.dart';

class IncomeExpenditureDetailLogic extends GetxController {
  late TextEditingController textEditingController;

  IncomeExpenditureRecord? bean;

  IncomeExpenditureDetailLogic() {
    bean = Get.arguments?["ITEM"];

    textEditingController = TextEditingController()
      ..addListener(() {
        if (textEditingController.text.length > 50) {
          print("超出上限");
        }
        update();
      });
  }

  @override
  void onClose() {
    textEditingController.dispose();
    super.onClose();
  }
}
