import 'package:get/get.dart';

class IncomeExpenditureLogic extends GetxController {
  Rx<String?> account = Rx<String?>(null);

  var selectIndex = 0.obs;

  var number = 0.obs;

  Rx<String?> timeStr = Rx<String?>(null);

  Rx<String?> maxTime = Rx<String?>(null);
  Rx<String?> minTime = Rx<String?>(null);
  Rx<String?> selectMonth = Rx<String?>(null);
}
