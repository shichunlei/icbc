import 'package:get/get.dart';
import 'package:icbc/beans/income_expenditure_record.dart';

class QueryDetailInfoLogic extends GetxController {
  IncomeExpenditureRecord? bean;

  QueryDetailInfoLogic() {
    bean = Get.arguments?["ITEM"];
  }
}
