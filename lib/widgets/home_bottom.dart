import 'package:flutter/material.dart';

class HomeBottomView extends StatelessWidget {
  const HomeBottomView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
          margin: const EdgeInsets.symmetric(horizontal: 15),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.white),
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 12),
          child: Row(children: [
            const SizedBox(width: 5),
            Image.asset("assets/images/home/bottom_tousu_icon.webp", width: 25),
            const SizedBox(width: 5),
            const Expanded(
                child:
                    Text("客户投诉指南", style: TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.w500))),
            Image.asset("assets/images/right_arrow_entry_icon.webp", width: 25)
          ])),
      Container(
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Row(children: [
            Expanded(
                child:
                    Image.asset("assets/images/home/home_bottom_1.png", width: double.infinity, fit: BoxFit.fitWidth)),
            Expanded(
                child:
                    Image.asset("assets/images/home/home_bottom_2.png", width: double.infinity, fit: BoxFit.fitWidth)),
            Expanded(
                child:
                    Image.asset("assets/images/home/home_bottom_3.png", width: double.infinity, fit: BoxFit.fitWidth))
          ])),
      const SizedBox(height: 10),
      RichText(
          text: TextSpan(children: [
        const TextSpan(text: "中国工商银行支持  "),
        WidgetSpan(
            child: Row(mainAxisSize: MainAxisSize.min, children: [
          Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(horizontal: 3),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.redAccent, width: 1), borderRadius: BorderRadius.circular(24)),
              child: const Text("IPV6",
                  style: TextStyle(color: Colors.redAccent, fontSize: 9, fontWeight: FontWeight.w600)))
        ])),
        const TextSpan(text: "  网络")
      ], style: const TextStyle(color: Colors.black, fontSize: 13, fontWeight: FontWeight.w500))),
      const SizedBox(height: 15),
      const Text("ICP备案号：京ICP证030247号-60A", style: TextStyle(color: Color(0xff999999), fontSize: 11)),
      const SizedBox(height: 3),
      RichText(
          text: const TextSpan(children: [
        TextSpan(text: "备案系统网址 "),
        TextSpan(text: "http://beian.miit.gov.cn/", style: TextStyle(color: Colors.blueAccent))
      ], style: TextStyle(color: Colors.black, fontSize: 11))),
      const SizedBox(height: 40)
    ]);
  }
}
