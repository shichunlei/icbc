import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:icbc/beans/income_expenditure_record.dart';
import 'package:icbc/db_helper/record_db_helper.dart';
import 'package:icbc/global/date_util.dart';
import 'package:icbc/global/enum.dart';

class IncomeExpenditureLogic extends GetxController {
  Rx<String?> account = Rx<String?>(null);

  var selectIndex = 0.obs;

  var number = 0.obs;

  Rx<String?> timeStr = Rx<String?>(null);

  Rx<String?> maxTime = Rx<String?>(null);
  Rx<String?> minTime = Rx<String?>(null);
  Rx<String?> selectMonth = Rx<String?>(null);

  RxList<RecordDateTime> records = RxList<RecordDateTime>([]);

  List<RecordDateTime> days = [];

  IncomeExpenditureLogic() {
    getListData();
  }

  var isLoading = false.obs;

  void getListData() async {
    isLoading.value = true;
    EasyLoading.show(status: '加载中...');

    List<IncomeExpenditureRecord> items = await RecordDbHelper().queryAllRecords();
    for (var item in items) {
      if (days.isNotEmpty) {
        if (DateUtil.isSameDay(DateTime.parse(days.last.date!), DateTime.parse(item.time!))) {
          days.last.income += (item.type == IncomeExpenditureType.income ? item.money : 0);
          days.last.expenditure += (item.type == IncomeExpenditureType.expenditure ? item.money : 0);
          days.last.items.add(item);
        } else {
          days.add(RecordDateTime(
              date: DateUtil.getDateTimeFromDateTime(DateTime.parse(item.time!), "yyyy-MM-dd"),
              year: DateTime.parse(item.time!).year,
              month: DateTime.parse(item.time!).month,
              day: DateTime.parse(item.time!).day,
              income: item.type == IncomeExpenditureType.income ? item.money : 0,
              expenditure: item.type == IncomeExpenditureType.expenditure ? item.money : 0,
              items: [item]));
        }
      } else {
        days.add(RecordDateTime(
            date: DateUtil.getDateTimeFromDateTime(DateTime.parse(item.time!), "yyyy-MM-dd"),
            year: DateTime.parse(item.time!).year,
            month: DateTime.parse(item.time!).month,
            day: DateTime.parse(item.time!).day,
            income: item.type == IncomeExpenditureType.income ? item.money : 0,
            expenditure: item.type == IncomeExpenditureType.expenditure ? item.money : 0,
            items: [item]));
      }
    }

    for (var day in days) {
      if (records.isNotEmpty) {
        if (records.last.year == day.year && records.last.month == day.month) {
          records.last.income += day.income;
          records.last.expenditure += day.expenditure;
          records.last.days.add(day);
        } else {
          /// 不是同一月，则重新添加一个月份
          records.add(RecordDateTime(
              date: DateUtil.getDateTimeFromDateTime(DateTime.parse(day.date!), "yyyy-MM"),
              year: day.year,
              month: day.month,
              income: day.income,
              expenditure: day.expenditure,
              monthBgImage: "assets/images/detail/my_detail_${day.month}ths_bg_max.webp",
              monthIcon: "assets/images/detail/monthicon${day.month}.webp",
              days: [day]));
        }
      } else {
        /// 列表为空
        records.add(RecordDateTime(
            date: DateUtil.getDateTimeFromDateTime(DateTime.parse(day.date!), "yyyy-MM"),
            year: day.year,
            month: day.month,
            income: day.income,
            expenditure: day.expenditure,
            monthBgImage: "assets/images/detail/my_detail_${day.month}ths_bg_max.webp",
            monthIcon: "assets/images/detail/monthicon${day.month}.webp",
            days: [day]));
      }
    }

    records.refresh();

    isLoading.value = false;
    EasyLoading.dismiss();
  }
}
