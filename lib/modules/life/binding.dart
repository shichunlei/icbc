import 'package:get/get.dart';

import 'logic.dart';

class LifeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LifeLogic>(() => LifeLogic());
  }
}
