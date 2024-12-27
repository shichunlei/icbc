import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icbc/modules/home/logic.dart';
import 'package:icbc/modules/notice/page.dart';

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
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10))),
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 15),
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              child: Column(children: [
                Row(children: [
                  Text("动账通知", style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600)),
                  const Spacer(),
                  GestureDetector(
                      onTap: () {
                        Get.to(() => NoticePage());
                      },
                      child: Text("更多", style: TextStyle(color: Color(0xff666666), fontSize: 14)))
                ]),
                Container(
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: Color(0xffF9FAFC)),
                    margin: EdgeInsets.only(top: 8),
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                    child: Column(children: [
                      Row(children: [
                        Image.asset("assets/images/message/chat_header_account.png", width: 25),
                        SizedBox(width: 3),
                        Text("您近期暂无动账通知",
                            style: TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.w500))
                      ]),
                      SizedBox(height: 10),
                      Row(children: [
                        Expanded(
                            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                          Text("前往消息中心",
                              style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w500)),
                          Text("查看全部动账通知", style: TextStyle(color: Color(0xff666666), fontSize: 11))
                        ])),
                        GestureDetector(
                            onTap: () {
                              Get.to(() => NoticePage());
                            },
                            child: Container(
                                alignment: Alignment.center,
                                height: 30,
                                width: 80,
                                decoration:
                                    BoxDecoration(borderRadius: BorderRadius.circular(30), color: Color(0xffCD0200)),
                                child: Text("立即查看", style: TextStyle(color: Colors.white, fontSize: 14))))
                      ])
                    ]))
              ])),
          Container(
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10)),
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text("服务提醒", style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600)),
                Container(
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: Color(0xffF9FAFC)),
                    margin: EdgeInsets.only(top: 8),
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                    child: Column(children: [
                      Row(children: [
                        Image.asset("assets/images/message/chat_header_deal.png", width: 25),
                        SizedBox(width: 3),
                        Text("您近期暂无服务提醒消息",
                            style: TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.w500))
                      ]),
                      SizedBox(height: 10),
                      Row(children: [
                        Expanded(
                            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                          Text("前往消息中心",
                              style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w500)),
                          Text("查看全部消息", style: TextStyle(color: Color(0xff666666), fontSize: 11))
                        ])),
                        GestureDetector(
                            onTap: () {
                              Get.to(() => NoticePage());
                            },
                            child: Container(
                                alignment: Alignment.center,
                                height: 30,
                                width: 80,
                                decoration:
                                    BoxDecoration(borderRadius: BorderRadius.circular(30), color: Color(0xffCD0200)),
                                child: Text("立即查看", style: TextStyle(color: Colors.white, fontSize: 14))))
                      ])
                    ]))
              ])),
          Container(
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10)),
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 15),
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text("精选内容", style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600)),
                Container(
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: Color(0xffF9FAFC)),
                    margin: EdgeInsets.only(top: 8),
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                    child: Column(children: [
                      Row(children: [
                        Image.asset("assets/images/message/chat_header_news.png", width: 25),
                        SizedBox(width: 3),
                        Text("您近期暂无精选内容",
                            style: TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.w500))
                      ]),
                      SizedBox(height: 10),
                      Row(children: [
                        Expanded(
                            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                          Text("前往消息中心",
                              style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w500)),
                          Text("查看全部消息", style: TextStyle(color: Color(0xff666666), fontSize: 11))
                        ])),
                        GestureDetector(
                            onTap: () {
                              Get.to(() => NoticePage());
                            },
                            child: Container(
                                alignment: Alignment.center,
                                height: 30,
                                width: 80,
                                decoration:
                                    BoxDecoration(borderRadius: BorderRadius.circular(30), color: Color(0xffCD0200)),
                                child: Text("立即查看", style: TextStyle(color: Colors.white, fontSize: 14))))
                      ])
                    ]))
              ])),
          Container(
              margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: Colors.white),
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              child: Column(children: [
                Center(
                    child: Row(mainAxisSize: MainAxisSize.min, children: [
                  Container(
                      height: 35,
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          border: Border.all(width: 1, color: Color(0xff3963CB))),
                      child: Text("查看全部消息",
                          style: TextStyle(color: Color(0xff3963CB), fontSize: 16, fontWeight: FontWeight.w600)))
                ])),
                SizedBox(height: 10),
                Text("进入消息中心查看", style: TextStyle(color: Color(0xff999999), fontSize: 12))
              ])),
          Container(
              margin: EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.white),
              padding: EdgeInsets.symmetric(horizontal: 5, vertical: 12),
              child: Row(children: [
                SizedBox(width: 5),
                Image.asset("assets/images/home/bottom_tousu_icon.webp", width: 25),
                SizedBox(width: 5),
                Expanded(
                    child: Text("客户投诉指南",
                        style: TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.w500))),
                Image.asset("assets/images/right_arrow_entry_icon.webp", width: 25)
              ])),
          Container(
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Row(children: [
                Expanded(
                    child: Image.asset("assets/images/home/home_bottom_1.png",
                        width: double.infinity, fit: BoxFit.fitWidth)),
                Expanded(
                    child: Image.asset("assets/images/home/home_bottom_2.png",
                        width: double.infinity, fit: BoxFit.fitWidth)),
                Expanded(
                    child: Image.asset("assets/images/home/home_bottom_3.png",
                        width: double.infinity, fit: BoxFit.fitWidth))
              ])),
          SizedBox(height: 10),
          RichText(
              text: TextSpan(children: [
            TextSpan(text: "中国工商银行支持  "),
            WidgetSpan(
                child: Row(mainAxisSize: MainAxisSize.min, children: [
              Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(horizontal: 3),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.redAccent, width: 1), borderRadius: BorderRadius.circular(24)),
                  child:
                      Text("IPV6", style: TextStyle(color: Colors.redAccent, fontSize: 9, fontWeight: FontWeight.w600)))
            ])),
            TextSpan(text: "  网络")
          ], style: TextStyle(color: Colors.black, fontSize: 13, fontWeight: FontWeight.w500))),
          SizedBox(height: 15),
          Text("ICP备案号：京ICP证030247号-60A", style: TextStyle(color: Color(0xff999999), fontSize: 11)),
          SizedBox(height: 3),
          RichText(
              text: TextSpan(children: [
            TextSpan(text: "备案系统网址 "),
            TextSpan(text: "http://beian.miit.gov.cn/", style: TextStyle(color: Colors.blueAccent))
          ], style: TextStyle(color: Colors.black, fontSize: 11))),
          SizedBox(height: 40)
        ])));
  }
}
