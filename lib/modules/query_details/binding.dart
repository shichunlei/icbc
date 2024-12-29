import 'package:get/get.dart';

import 'logic.dart';

class QueryDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => QueryDetailsLogic());
  }
}
