import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final double opacity;

  const CustomAppBar({super.key, required this.opacity});

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white.withValues(alpha: opacity),
        height: kToolbarHeight + MediaQuery.of(context).padding.top,
        padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        child: Row(children: [
          Image.asset(opacity > .5 ? "assets/images/location_mine_black.png" : "assets/images/location_mine_light.png",
              width: 40, height: 40),
          Text("全国",
              style: TextStyle(
                  fontSize: 14,
                  color: Color.fromARGB(255, (255 * (1 - opacity)).floor(), (255 * (1 - opacity)).floor(),
                      (255 * (1 - opacity)).floor()))),
          Expanded(
              child: Container(
                  margin: EdgeInsets.only(left: 8),
                  height: 30,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Color(0xffF2F2F2).withValues(alpha: opacity),
                      border: Border.all(width: .5, color: Colors.white.withValues(alpha: 1 - opacity))),
                  child: Row(children: [
                    SizedBox(width: 8),
                    Image.asset(opacity > .5 ? "assets/images/icon_search_b.png" : "assets/images/icon_search_w.png",
                        width: 15, height: 15),
                    SizedBox(width: 5),
                    Expanded(
                        child: Text("搜功能  搜产品",
                            style: TextStyle(
                                color: Color.fromARGB(255, (255 * (1 - opacity)).floor(), (255 * (1 - opacity)).floor(),
                                    (255 * (1 - opacity)).floor()),
                                fontSize: 12))),
                    Image.asset(opacity > .5 ? "assets/images/icon_mic_b.png" : "assets/images/icon_mic_w.png",
                        width: 15, height: 15),
                    SizedBox(width: 8)
                  ]))),
          Image.asset(
              opacity > .5
                  ? "assets/images/epass_home_service_icon.webp"
                  : "assets/images/standard_personal_8_service_w.png",
              width: 40,
              height: 40),
          Image.asset(opacity > .5 ? "assets/images/msg_mine_black.png" : "assets/images/msg_mine_light.png",
              width: 40, height: 40),
          Image.asset(opacity > .5 ? "assets/images/more_mine_black.png" : "assets/images/more_mine_light.png",
              width: 40, height: 40),
        ]));
  }
}
