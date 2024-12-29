import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:scroll_date_picker/scroll_date_picker.dart';

class SelectTimeDialog extends StatelessWidget {
  const SelectTimeDialog({super.key});

  SelectTimeController get logic => Get.put(SelectTimeController());

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.black12,
        child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
          Container(
              color: Colors.white,
              child: Column(mainAxisSize: MainAxisSize.min, children: [
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
                                logic.selectTabIndex.value = index;
                              })),
                      GestureDetector(
                          onTap: Get.back,
                          child: Container(
                              alignment: Alignment.center,
                              height: 50,
                              width: 40,
                              child: Image.asset("assets/images/detail/my_detail_suspend_layer_close.png", width: 25)))
                    ])),
                const SizedBox(height: 20),
                Row(children: [
                  const SizedBox(width: 15),
                  Expanded(
                      child: GestureDetector(onTap: () {
                    logic.selectIndex.value = 0;
                  }, child: Obx(() {
                    return Container(
                        alignment: Alignment.center,
                        height: 30,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            color: logic.selectIndex.value == 0 ? const Color(0xffFD7B7B) : const Color(0xfff4f4f4)),
                        child:
                            Text("近1月", style: TextStyle(color: logic.selectIndex.value == 0 ? Colors.white : null)));
                  }))),
                  const SizedBox(width: 10),
                  Expanded(
                      child: GestureDetector(onTap: () {
                    logic.selectIndex.value = 1;
                  }, child: Obx(() {
                    return Container(
                        alignment: Alignment.center,
                        height: 30,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            color: logic.selectIndex.value == 1 ? const Color(0xffFD7B7B) : const Color(0xfff4f4f4)),
                        child:
                            Text("近3月", style: TextStyle(color: logic.selectIndex.value == 1 ? Colors.white : null)));
                  }))),
                  const SizedBox(width: 10),
                  Expanded(
                      child: GestureDetector(onTap: () {
                    logic.selectIndex.value = 2;
                  }, child: Obx(() {
                    return Container(
                        alignment: Alignment.center,
                        height: 30,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            color: logic.selectIndex.value == 2 ? const Color(0xffFD7B7B) : const Color(0xfff4f4f4)),
                        child:
                            Text("近6月", style: TextStyle(color: logic.selectIndex.value == 2 ? Colors.white : null)));
                  }))),
                  const SizedBox(width: 10),
                  Expanded(
                      child: GestureDetector(onTap: () {
                    logic.selectIndex.value = 3;
                  }, child: Obx(() {
                    return Container(
                        alignment: Alignment.center,
                        height: 30,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            color: logic.selectIndex.value == 3 ? const Color(0xffFD7B7B) : const Color(0xfff4f4f4)),
                        child:
                            Text("近12月", style: TextStyle(color: logic.selectIndex.value == 3 ? Colors.white : null)));
                  }))),
                  const SizedBox(width: 15)
                ]),
                const SizedBox(height: 20),
                Row(children: [
                  const SizedBox(width: 15),
                  Expanded(
                      child: GestureDetector(onTap: () {
                    logic.selectStartDate.value = true;
                    logic.selectStopDate.value = false;
                    logic.selectIndex.value = -1;
                    if (logic.startDate.value != null) logic.initDateTime.value = logic.startDate.value!;
                  }, child: Obx(() {
                    return Container(
                        height: 35,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            border: Border.all(
                                color: logic.selectStartDate.value ? const Color(0xffFD7B7B) : const Color(0xffdddddd),
                                width: 1)),
                        child: Obx(() {
                          return Text(
                              logic.startDate.value == null
                                  ? "开始时间"
                                  : DateFormat("yyyy-MM-dd").format(logic.startDate.value!),
                              style: const TextStyle(fontSize: 12));
                        }));
                  }))),
                  Container(
                      width: 20,
                      height: 2,
                      color: const Color(0xffdddddd),
                      margin: const EdgeInsets.symmetric(horizontal: 10)),
                  Expanded(
                      child: GestureDetector(onTap: () {
                    logic.selectStopDate.value = true;
                    logic.selectStartDate.value = false;
                    logic.selectIndex.value = -1;
                    if (logic.stopDate.value != null) logic.initDateTime.value = logic.stopDate.value!;
                  }, child: Obx(() {
                    return Container(
                        height: 35,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            border: Border.all(
                                color: logic.selectStopDate.value ? const Color(0xffFD7B7B) : const Color(0xffdddddd),
                                width: 1)),
                        child: Obx(() {
                          return Text(
                              logic.stopDate.value == null
                                  ? "结束时间"
                                  : DateFormat("yyyy-MM-dd").format(logic.stopDate.value!),
                              style: const TextStyle(fontSize: 12));
                        }));
                  }))),
                  const SizedBox(width: 15)
                ]),
                SizedBox(
                    height: 200,
                    child: Obx(() {
                      return ScrollDatePicker(
                          minimumDate: DateTime(2010, 1, 1),
                          maximumDate: DateTime.now(),
                          viewType: [
                            DatePickerViewType.year,
                            DatePickerViewType.month,
                            ...logic.selectTabIndex.value == 1 ? [DatePickerViewType.day] : []
                          ],
                          selectedDate: logic.initDateTime.value,
                          locale: const Locale('zh'),
                          onDateTimeChanged: (DateTime value) {
                            if (logic.selectStartDate.value) {
                              logic.startDate.value = value;
                            }
                            if (logic.selectStopDate.value) {
                              logic.stopDate.value = value;
                            }
                          },
                          indicator: Container(
                              height: 50,
                              margin: const EdgeInsets.symmetric(horizontal: 15),
                              decoration: const BoxDecoration(
                                  border: Border(
                                      top: BorderSide(color: Color(0xffdddddd)),
                                      bottom: BorderSide(color: Color(0xffdddddd))))),
                          options:
                              const DatePickerOptions(isLoop: false, itemExtent: 50, backgroundColor: Colors.white),
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
                                  label: "日")));
                    })),
                GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: Container(
                        margin:
                            EdgeInsets.only(bottom: 10 + MediaQuery.of(context).padding.bottom, left: 15, right: 15),
                        height: 45,
                        alignment: Alignment.center,
                        decoration:
                            BoxDecoration(color: const Color(0xffFA5050), borderRadius: BorderRadius.circular(4)),
                        child: const Text("确定", style: TextStyle(color: Colors.white, fontSize: 18))))
              ]))
        ]));
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

  SelectTimeController() {
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }
}
