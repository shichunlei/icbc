import 'package:get/get.dart';

import 'logic.dart';

class AssetsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AssetsLogic>(() => AssetsLogic());
  }
}
