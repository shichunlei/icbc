import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SelectAccountDialog extends StatelessWidget {
  final String? account;

  const SelectAccountDialog({super.key, this.account});

  SelectAccountController get logic => Get.put(SelectAccountController(account));

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.black12,
        child: Container(
            color: Colors.white,
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              SizedBox(
                  height: 50,
                  child: Stack(children: [
                    const Center(child: Text("账户选择", style: TextStyle(color: Colors.black, fontSize: 17))),
                    GestureDetector(
                        onTap: Get.back,
                        child: Container(
                            alignment: Alignment.center,
                            height: 50,
                            width: 40,
                            child: Image.asset("assets/images/detail/my_detail_suspend_layer_close.png", width: 25)))
                  ])),
              const Divider(height: 0, color: Color(0xffdddddd)),
              GestureDetector(
                  onTap: () {
                    logic.allChecked.toggle();
                  },
                  behavior: HitTestBehavior.translucent,
                  child: SizedBox(
                      height: 70,
                      child: Row(children: [
                        Obx(() {
                          return Checkbox(
                              value: logic.allChecked.value,
                              onChanged: (value) {
                                logic.allChecked.value = value!;
                              },
                              activeColor: Colors.red);
                        }),
                        Image.asset("assets/images/detail/my_detail_allaccount.png", width: 25),
                        const SizedBox(width: 10),
                        const Text("全部账户", style: TextStyle(fontSize: 14, color: Colors.black))
                      ]))),
              const Divider(height: 0, color: Color(0xffdddddd)),
              ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (_, index) {
                    return GestureDetector(
                        onTap: () {
                          logic.allChecked.toggle();
                        },
                        behavior: HitTestBehavior.translucent,
                        child: SizedBox(
                            height: 70,
                            child: Row(children: [
                              Obx(() {
                                return Checkbox(
                                    value: !logic.allChecked.value,
                                    onChanged: (value) {
                                      logic.allChecked.value = value!;
                                    },
                                    activeColor: Colors.red);
                              }),
                              Image.asset("assets/images/detail/grayweight_card.webp", width: 60, height: 40),
                              const SizedBox(width: 10),
                              const Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("借记卡(I类)", style: TextStyle(fontSize: 14, color: Color(0xff888888))),
                                    SizedBox(height: 6),
                                    Text("6217****0554", style: TextStyle(fontSize: 16, color: Colors.black))
                                  ])
                            ])));
                  },
                  separatorBuilder: (_, index) {
                    return const Divider(height: 0, color: Color(0xffdddddd));
                  },
                  itemCount: 1),
              GestureDetector(
                  onTap: () {
                    Get.back(result: logic.allChecked.value ? "" : "尾号0554");
                  },
                  child: Container(
                      margin:
                      EdgeInsets.only(bottom: 10 + MediaQuery.of(context).padding.bottom, left: 15, right: 15),
                      height: 45,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(color: Colors.red, borderRadius: BorderRadius.circular(4)),
                      child: const Text("确定", style: TextStyle(color: Colors.white, fontSize: 18))))
            ])));
  }
}

class SelectAccountController extends GetxController {
  SelectAccountController(String? account) {
    if (account == null) {
      allChecked.value = true;
    } else {
      allChecked.value = false;
    }
  }

  var allChecked = true.obs;
}
