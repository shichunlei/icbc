import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icbc/main.dart';

class CustomAppBar extends StatelessWidget {
  final double opacity;
  final String? imagePathW;
  final String? imagePathB;
  final bool isLife;
  final bool isMine;

  const CustomAppBar(
      {super.key, required this.opacity, this.imagePathB, this.imagePathW, this.isLife = false, this.isMine = false});

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white.withOpacity(opacity),
        height: kToolbarHeight + MediaQuery.of(context).padding.top,
        padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        child: Row(children: [
          GestureDetector(
              onTap: () {
                if (isLife) {
                } else {}
              },
              child: Row(mainAxisSize: MainAxisSize.min, children: [
                Image.asset(
                    opacity > .5 || isMine
                        ? isLife
                            ? "assets/images/location_small_icon.webp"
                            : "assets/images/location_mine_black.png"
                        : isLife
                            ? "assets/images/location_small_icon_6.webp"
                            : "assets/images/location_mine_light.png",
                    width: 35,
                    height: 40),
                Obx(() {
                  return Text(Get.find<GlobalController>().isLogin.value ? Get.find<GlobalController>().address : "全国",
                      style: TextStyle(
                          fontSize: 14,
                          color: isMine
                              ? Colors.black
                              : Color.fromARGB(255, (255 * (1 - opacity)).floor(), (255 * (1 - opacity)).floor(),
                                  (255 * (1 - opacity)).floor())));
                })
              ])),
          Expanded(
              child: isMine
                  ? const SizedBox.expand()
                  : Container(
                      margin: const EdgeInsets.only(left: 8),
                      height: 30,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: const Color(0xffF2F2F2).withOpacity(opacity),
                          border: Border.all(width: .5, color: Colors.white.withOpacity(1 - opacity))),
                      child: Row(children: [
                        const SizedBox(width: 8),
                        Image.asset(
                            opacity > .5 ? "assets/images/icon_search_b.png" : "assets/images/icon_search_w.png",
                            width: 15,
                            height: 15),
                        const SizedBox(width: 5),
                        Expanded(
                            child: Text("搜功能  搜产品",
                                style: TextStyle(
                                    color: Color.fromARGB(255, (255 * (1 - opacity)).floor(),
                                        (255 * (1 - opacity)).floor(), (255 * (1 - opacity)).floor()),
                                    fontSize: 12))),
                        Image.asset(opacity > .5 ? "assets/images/icon_mic_b.png" : "assets/images/icon_mic_w.png",
                            width: 15, height: 15),
                        const SizedBox(width: 8)
                      ]))),
          Image.asset(
              opacity > .5 || isMine
                  ? imagePathB ?? "assets/images/epass_home_service_icon.webp"
                  : imagePathW ?? "assets/images/standard_personal_8_service_w.png",
              width: 40,
              height: 40),
          Image.asset(opacity > .5 || isMine ? "assets/images/msg_mine_black.png" : "assets/images/msg_mine_light.png",
              width: 40, height: 40),
          Image.asset(
              opacity > .5 || isMine ? "assets/images/more_mine_black.png" : "assets/images/more_mine_light.png",
              width: 40,
              height: 40),
        ]));
  }
}
