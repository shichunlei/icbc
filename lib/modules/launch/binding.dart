import 'package:get/get.dart';

import 'logic.dart';

class LaunchBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LaunchLogic());
  }
}
