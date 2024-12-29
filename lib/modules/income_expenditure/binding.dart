import 'package:get/get.dart';

import 'logic.dart';

class IncomeExpenditureBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => IncomeExpenditureLogic());
  }
}
