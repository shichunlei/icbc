import 'package:get/get.dart';

class AssetsLogic extends GetxController {
  var index = 0.obs;

  var showMoney = false.obs;

  var time = DateTime.now().obs;

  AssetsLogic() {}

  void refreshTime() {
    time.value = DateTime.now();
  }
}
