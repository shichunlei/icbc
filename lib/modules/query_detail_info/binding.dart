import 'package:get/get.dart';

import 'logic.dart';

class QueryDetailInfoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() =>  QueryDetailInfoLogic());
  }
}
