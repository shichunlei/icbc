import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icbc/main.dart';

class SelectUserDialog extends StatelessWidget {
  const SelectUserDialog({super.key});

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
                    const Center(child: Text("用户选择", style: TextStyle(color: Colors.black, fontSize: 17))),
                    GestureDetector(
                        onTap: Get.back,
                        child: Container(
                            alignment: Alignment.center,
                            height: 50,
                            width: 40,
                            child: Image.asset("assets/images/detail/my_detail_suspend_layer_close.png", width: 25)))
                  ])),
              const Divider(height: 0, color: Color(0xffdddddd)),
              SizedBox(
                  height: 70,
                  child: Row(children: [
                    const SizedBox(width: 15),
                    Image.asset("assets/images/detail/icon_checkbox.webp", width: 20),
                    const SizedBox(width: 5),
                    Text(Get.find<GlobalController>().starName,
                        style: const TextStyle(fontSize: 14, color: Colors.black))
                  ])),
              GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Container(
                      margin: EdgeInsets.only(bottom: 10 + MediaQuery.of(context).padding.bottom, left: 15, right: 15),
                      height: 45,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(color: Colors.red, borderRadius: BorderRadius.circular(4)),
                      child: const Text("确定", style: TextStyle(color: Colors.white, fontSize: 18))))
            ])));
  }
}
