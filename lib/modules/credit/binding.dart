import 'package:get/get.dart';

import 'logic.dart';

class CreditBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CreditLogic>(() => CreditLogic());
  }
}
