import 'package:get/get.dart';

import 'logic.dart';

class IncomeExpenditureDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => IncomeExpenditureDetailLogic());
  }
}
