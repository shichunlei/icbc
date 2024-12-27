import 'package:get/get.dart';

import 'logic.dart';

class WealthBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WealthLogic>(() => WealthLogic());
  }
}
