import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:icbc/global/date_util.dart';
import 'package:scroll_date_picker/scroll_date_picker.dart';

class SelectTimeDialog extends StatelessWidget {
  final String? minTime;
  final String? maxTime;
  final String? selectMonth;

  const SelectTimeDialog({super.key, this.maxTime, this.minTime, this.selectMonth});

  SelectTimeController get logic =>
      Get.put(SelectTimeController(maxTime: maxTime, minTime: minTime, selectMonth: selectMonth));

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.black12,
        child: Container(
            color: Colors.white,
            child: Obx(() {
              return Column(mainAxisSize: MainAxisSize.min, children: [
                SizedBox(
                    height: 50,
                    child: Stack(children: [
                      Center(
                          child: TabBar(
                              indicatorSize: TabBarIndicatorSize.label,
                              tabAlignment: TabAlignment.center,
                              indicatorColor: Colors.red,
                              indicatorPadding: const EdgeInsets.only(bottom: 1),
                              dividerColor: const Color(0xffdddddd),
                              dividerHeight: 1,
                              tabs: const [Tab(text: "按月"), Tab(text: "时间段")],
                              controller: logic.tabController,
                              isScrollable: true,
                              unselectedLabelColor: const Color(0xff888888),
                              labelColor: Colors.black,
                              onTap: (index) {
                                if (logic.selectTabIndex.value == index) return;
                                logic.selectTabIndex.value = index;
                                if (index == 0) logic.showScrollDatePicker.value = false;
                              })),
                      GestureDetector(
                          onTap: Get.back,
                          child: Container(
                              alignment: Alignment.center,
                              height: 50,
                              width: 40,
                              child: Image.asset("assets/images/detail/my_detail_suspend_layer_close.png", width: 25)))
                    ])),
                ...logic.selectTabIndex.value == 1
                    ? [
                        const SizedBox(height: 20),
                        Row(children: [
                          const SizedBox(width: 15),
                          Expanded(
                              child: GestureDetector(
                                  onTap: () {
                                    logic.selectIndex.value = 0;
                                    logic.startDate.value = DateUtil.calculateOffsetDate(1);
                                    logic.stopDate.value = DateTime.now();
                                  },
                                  child: Container(
                                      alignment: Alignment.center,
                                      height: 30,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(4),
                                          color: logic.selectIndex.value == 0
                                              ? const Color(0xffFD7B7B)
                                              : const Color(0xfff4f4f4)),
                                      child: Text("近1月",
                                          style:
                                              TextStyle(color: logic.selectIndex.value == 0 ? Colors.white : null))))),
                          const SizedBox(width: 10),
                          Expanded(
                              child: GestureDetector(
                                  onTap: () {
                                    logic.selectIndex.value = 1;
                                    logic.startDate.value = DateUtil.calculateOffsetDate(3);
                                    logic.stopDate.value = DateTime.now();
                                  },
                                  child: Container(
                                      alignment: Alignment.center,
                                      height: 30,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(4),
                                          color: logic.selectIndex.value == 1
                                              ? const Color(0xffFD7B7B)
                                              : const Color(0xfff4f4f4)),
                                      child: Text("近3月",
                                          style:
                                              TextStyle(color: logic.selectIndex.value == 1 ? Colors.white : null))))),
                          const SizedBox(width: 10),
                          Expanded(
                              child: GestureDetector(
                                  onTap: () {
                                    logic.selectIndex.value = 2;
                                    logic.startDate.value = DateUtil.calculateOffsetDate(6);
                                    logic.stopDate.value = DateTime.now();
                                  },
                                  child: Container(
                                      alignment: Alignment.center,
                                      height: 30,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(4),
                                          color: logic.selectIndex.value == 2
                                              ? const Color(0xffFD7B7B)
                                              : const Color(0xfff4f4f4)),
                                      child: Text("近6月",
                                          style:
                                              TextStyle(color: logic.selectIndex.value == 2 ? Colors.white : null))))),
                          const SizedBox(width: 10),
                          Expanded(
                              child: GestureDetector(
                                  onTap: () {
                                    logic.selectIndex.value = 3;
                                    logic.startDate.value = DateUtil.calculateSameDayPreviousYear();
                                    logic.stopDate.value = DateTime.now();
                                  },
                                  child: Container(
                                      alignment: Alignment.center,
                                      height: 30,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(4),
                                          color: logic.selectIndex.value == 3
                                              ? const Color(0xffFD7B7B)
                                              : const Color(0xfff4f4f4)),
                                      child: Text("近12月",
                                          style:
                                              TextStyle(color: logic.selectIndex.value == 3 ? Colors.white : null))))),
                          const SizedBox(width: 15)
                        ]),
                        const SizedBox(height: 20),
                        Row(children: [
                          const SizedBox(width: 15),
                          Expanded(
                              child: GestureDetector(
                                  onTap: () {
                                    logic.showScrollDatePicker.value = true;
                                    logic.selectStartDate.value = true;
                                    logic.selectStopDate.value = false;
                                    logic.selectIndex.value = -1;
                                    if (logic.startDate.value != null) {
                                      logic.initDateTime.value = logic.startDate.value!;
                                    }
                                  },
                                  child: Container(
                                      height: 35,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(4),
                                          border: Border.all(
                                              color: logic.selectStartDate.value
                                                  ? const Color(0xffFD7B7B)
                                                  : const Color(0xffdddddd),
                                              width: 1)),
                                      child: Obx(() {
                                        return Text(
                                            logic.startDate.value == null
                                                ? "开始时间"
                                                : DateUtil.getDateTimeFromDateTime(
                                                    logic.startDate.value!, "yyyy-MM-dd"),
                                            style: const TextStyle(fontSize: 12));
                                      })))),
                          Container(
                              width: 20,
                              height: 2,
                              color: const Color(0xffdddddd),
                              margin: const EdgeInsets.symmetric(horizontal: 10)),
                          Expanded(
                              child: GestureDetector(
                                  onTap: () {
                                    logic.showScrollDatePicker.value = true;
                                    logic.selectStopDate.value = true;
                                    logic.selectStartDate.value = false;
                                    logic.selectIndex.value = -1;
                                    if (logic.stopDate.value != null) {
                                      logic.initDateTime.value = logic.stopDate.value!;
                                    }
                                  },
                                  child: Container(
                                      height: 35,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(4),
                                          border: Border.all(
                                              color: logic.selectStopDate.value
                                                  ? const Color(0xffFD7B7B)
                                                  : const Color(0xffdddddd),
                                              width: 1)),
                                      child: Obx(() {
                                        return Text(
                                            logic.stopDate.value == null
                                                ? "结束时间"
                                                : DateUtil.getDateTimeFromDateTime(logic.stopDate.value!, "yyyy-MM-dd"),
                                            style: const TextStyle(fontSize: 12));
                                      })))),
                          const SizedBox(width: 15)
                        ]),
                        SizedBox(height: logic.showScrollDatePicker.value ? 0 : 20)
                      ]
                    : [],
                ...logic.selectTabIndex.value == 0
                    ? [
                        SizedBox(
                            height: 200,
                            child: ScrollDatePicker(
                                minimumDate: DateTime(2010, 1, 1),
                                maximumDate: DateTime.now(),
                                viewType: [DatePickerViewType.year, DatePickerViewType.month],
                                selectedDate: logic.initDateTime.value,
                                locale: const Locale('zh'),
                                onDateTimeChanged: (DateTime value) {
                                  logic.initDateTime.value = value;
                                  logic.selectMonth.value = value;
                                },
                                indicator: Container(
                                    height: 50,
                                    margin: const EdgeInsets.symmetric(horizontal: 15),
                                    decoration: const BoxDecoration(
                                        border: Border(
                                            top: BorderSide(color: Color(0xffdddddd)),
                                            bottom: BorderSide(color: Color(0xffdddddd))))),
                                options: const DatePickerOptions(
                                    isLoop: false, itemExtent: 50, backgroundColor: Colors.white),
                                scrollViewOptions: const DatePickerScrollViewOptions(
                                    year: ScrollViewDetailOptions(
                                        selectedTextStyle: TextStyle(fontSize: 16),
                                        isLoop: false,
                                        margin: EdgeInsets.symmetric(horizontal: 30),
                                        label: "年"),
                                    month: ScrollViewDetailOptions(
                                        selectedTextStyle: TextStyle(fontSize: 16),
                                        isLoop: false,
                                        margin: EdgeInsets.symmetric(horizontal: 30),
                                        label: "月"))))
                      ]
                    : [],
                ...logic.showScrollDatePicker.value && logic.selectTabIndex.value == 1
                    ? [
                        SizedBox(
                            height: 200,
                            child: ScrollDatePicker(
                                minimumDate: DateTime(2010, 1, 1),
                                maximumDate: DateTime.now(),
                                viewType: [DatePickerViewType.year, DatePickerViewType.month, DatePickerViewType.day],
                                selectedDate: logic.initDateTime.value,
                                locale: const Locale('zh'),
                                onDateTimeChanged: (DateTime value) {
                                  if (logic.selectStartDate.value) {
                                    logic.startDate.value = value;
                                  }
                                  if (logic.selectStopDate.value) {
                                    logic.stopDate.value = value;
                                  }
                                  logic.initDateTime.value = value;
                                },
                                indicator: Container(
                                    height: 50,
                                    margin: const EdgeInsets.symmetric(horizontal: 15),
                                    decoration: const BoxDecoration(
                                        border: Border(
                                            top: BorderSide(color: Color(0xffdddddd)),
                                            bottom: BorderSide(color: Color(0xffdddddd))))),
                                options: const DatePickerOptions(
                                    isLoop: false, itemExtent: 50, backgroundColor: Colors.white),
                                scrollViewOptions: const DatePickerScrollViewOptions(
                                    year: ScrollViewDetailOptions(
                                        selectedTextStyle: TextStyle(fontSize: 16),
                                        isLoop: false,
                                        margin: EdgeInsets.symmetric(horizontal: 30),
                                        label: "年"),
                                    month: ScrollViewDetailOptions(
                                        selectedTextStyle: TextStyle(fontSize: 16),
                                        isLoop: false,
                                        margin: EdgeInsets.symmetric(horizontal: 30),
                                        label: "月"),
                                    day: ScrollViewDetailOptions(
                                        selectedTextStyle: TextStyle(fontSize: 16),
                                        isLoop: false,
                                        margin: EdgeInsets.symmetric(horizontal: 30),
                                        label: "日"))))
                      ]
                    : [],
                GestureDetector(
                    onTap: logic.submit,
                    child: Container(
                        margin:
                            EdgeInsets.only(bottom: 10 + MediaQuery.of(context).padding.bottom, left: 15, right: 15),
                        height: 45,
                        alignment: Alignment.center,
                        decoration:
                            BoxDecoration(color: const Color(0xffFA5050), borderRadius: BorderRadius.circular(4)),
                        child: const Text("确定", style: TextStyle(color: Colors.white, fontSize: 18))))
              ]);
            })));
  }
}

class SelectTimeController extends GetxController with GetSingleTickerProviderStateMixin {
  late TabController tabController;

  var selectTabIndex = 0.obs;

  var selectIndex = (-1).obs;

  var startDate = Rx<DateTime?>(null);

  var stopDate = Rx<DateTime?>(null);

  var selectStartDate = false.obs;

  var selectStopDate = false.obs;

  var initDateTime = DateTime.now().obs;

  var showScrollDatePicker = false.obs;

  SelectTimeController({String? minTime, String? maxTime, String? selectMonth}) {
    if (selectMonth != null) {
      selectTabIndex.value = 0;
      initDateTime.value = DateTime.parse("$selectMonth-01");
    } else if (maxTime != null && minTime != null) {
      selectTabIndex.value = 1;
      startDate.value = DateTime.parse(minTime);
      stopDate.value = DateTime.parse(maxTime);

      if (DateUtils.isSameDay(stopDate.value, DateTime.now())) {
        if (DateUtils.isSameDay(startDate.value, DateUtil.calculateOffsetDate(1))) {
          selectIndex.value = 0;
        } else if (DateUtils.isSameDay(startDate.value, DateUtil.calculateOffsetDate(3))) {
          selectIndex.value = 1;
        } else if (DateUtils.isSameDay(startDate.value, DateUtil.calculateOffsetDate(6))) {
          selectIndex.value = 2;
        } else if (DateUtils.isSameDay(startDate.value, DateUtil.calculateSameDayPreviousYear())) {
          selectIndex.value = 3;
        } else {
          selectIndex.value = -1;
        }
      } else {
        selectIndex.value = -1;
      }
    } else {
      selectTabIndex.value = 0;
      initDateTime.value = DateTime.now();
    }
    tabController = TabController(length: 2, vsync: this, initialIndex: selectTabIndex.value);
  }

  var selectMonth = DateTime.now().obs;

  void submit() {
    if (selectTabIndex.value == 1) {
      if (startDate.value == null || stopDate.value == null) {
        Get.back();
        return;
      } else {
        if (startDate.value!.isAfter(stopDate.value!)) {
          EasyLoading.showToast("结束时间不能小于开始时间");
          return;
        }
      }
    }

    Get.back(
        result: selectTabIndex.value == 0
            ? {"selectMonth": DateUtil.getDateTimeFromDateTime(selectMonth.value, "yyyy-MM")}
            : {
                "startDate": DateUtil.getDateTimeFromDateTime(startDate.value!, "yyyy-MM-dd"),
                "stopDate": DateUtil.getDateTimeFromDateTime(stopDate.value!, "yyyy-MM-dd")
              });
  }

  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }
}
