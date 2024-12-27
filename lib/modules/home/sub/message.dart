import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icbc/modules/home/logic.dart';
import 'package:icbc/modules/notice/page.dart';
import 'package:icbc/widgets/home_bottom.dart';

class MessageView extends StatelessWidget {
  const MessageView({super.key});

  HomeLogic get logic => Get.find<HomeLogic>();

  @override
  Widget build(BuildContext context) {
    return Material(
        type: MaterialType.transparency,
        child: SingleChildScrollView(
            child: Column(children: [
          Container(
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10))),
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 15),
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              child: Column(children: [
                Row(children: [
                  const Text("动账通知", style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600)),
                  const Spacer(),
                  GestureDetector(
                      onTap: () {
                        Get.to(() => const NoticePage());
                      },
                      child: const Text("更多", style: TextStyle(color: Color(0xff666666), fontSize: 14)))
                ]),
                Container(
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: const Color(0xffF9FAFC)),
                    margin: const EdgeInsets.only(top: 8),
                    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                    child: Column(children: [
                      Row(children: [
                        Image.asset("assets/images/message/chat_header_account.png", width: 25),
                        const SizedBox(width: 3),
                        const Text("您近期暂无动账通知",
                            style: TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.w500))
                      ]),
                      const SizedBox(height: 10),
                      Row(children: [
                        const Expanded(
                            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                          Text("前往消息中心",
                              style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w500)),
                          Text("查看全部动账通知", style: TextStyle(color: Color(0xff666666), fontSize: 11))
                        ])),
                        GestureDetector(
                            onTap: () {
                              Get.to(() => const NoticePage());
                            },
                            child: Container(
                                alignment: Alignment.center,
                                height: 30,
                                width: 80,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30), color: const Color(0xffCD0200)),
                                child: const Text("立即查看", style: TextStyle(color: Colors.white, fontSize: 14))))
                      ])
                    ]))
              ])),
          Container(
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10)),
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                const Text("服务提醒", style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600)),
                Container(
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: const Color(0xffF9FAFC)),
                    margin: const EdgeInsets.only(top: 8),
                    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                    child: Column(children: [
                      Row(children: [
                        Image.asset("assets/images/message/chat_header_deal.png", width: 25),
                        const SizedBox(width: 3),
                        const Text("您近期暂无服务提醒消息",
                            style: TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.w500))
                      ]),
                      const SizedBox(height: 10),
                      Row(children: [
                        const Expanded(
                            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                          Text("前往消息中心",
                              style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w500)),
                          Text("查看全部消息", style: TextStyle(color: Color(0xff666666), fontSize: 11))
                        ])),
                        GestureDetector(
                            onTap: () {
                              Get.to(() => const NoticePage());
                            },
                            child: Container(
                                alignment: Alignment.center,
                                height: 30,
                                width: 80,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30), color: const Color(0xffCD0200)),
                                child: const Text("立即查看", style: TextStyle(color: Colors.white, fontSize: 14))))
                      ])
                    ]))
              ])),
          Container(
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10)),
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 15),
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                const Text("精选内容", style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600)),
                Container(
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: const Color(0xffF9FAFC)),
                    margin: const EdgeInsets.only(top: 8),
                    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                    child: Column(children: [
                      Row(children: [
                        Image.asset("assets/images/message/chat_header_news.png", width: 25),
                        const SizedBox(width: 3),
                        const Text("您近期暂无精选内容",
                            style: TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.w500))
                      ]),
                      const SizedBox(height: 10),
                      Row(children: [
                        const Expanded(
                            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                          Text("前往消息中心",
                              style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w500)),
                          Text("查看全部消息", style: TextStyle(color: Color(0xff666666), fontSize: 11))
                        ])),
                        GestureDetector(
                            onTap: () {
                              Get.to(() => const NoticePage());
                            },
                            child: Container(
                                alignment: Alignment.center,
                                height: 30,
                                width: 80,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30), color: const Color(0xffCD0200)),
                                child: const Text("立即查看", style: TextStyle(color: Colors.white, fontSize: 14))))
                      ])
                    ]))
              ])),
          Container(
              margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: Colors.white),
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              child: Column(children: [
                Center(
                    child: Row(mainAxisSize: MainAxisSize.min, children: [
                  Container(
                      height: 35,
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          border: Border.all(width: 1, color: const Color(0xff3963CB))),
                      child: const Text("查看全部消息",
                          style: TextStyle(color: Color(0xff3963CB), fontSize: 16, fontWeight: FontWeight.w600)))
                ])),
                const SizedBox(height: 10),
                const Text("进入消息中心查看", style: TextStyle(color: Color(0xff999999), fontSize: 12))
              ])),
          const HomeBottomView()
        ])));
  }
}
