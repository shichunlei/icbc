import 'package:get/get.dart';

import 'logic.dart';

class AccountBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AccountLogic>(() => AccountLogic());
  }
}
