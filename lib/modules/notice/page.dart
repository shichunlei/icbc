import 'package:flutter/material.dart';

class NoticePage extends StatelessWidget {
  const NoticePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffF3F4F6),
        body: Stack(children: [
          Image.asset("assets/images/wealth/invest9_bg.webp", width: double.infinity, fit: BoxFit.fitWidth),
          AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              centerTitle: true,
              title: Text("消息中心", style: TextStyle(fontSize: 16, color: Colors.white)),
              actions: []),
          Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Column(children: [
                SizedBox(height: kToolbarHeight + MediaQuery.of(context).padding.top),
                Container(
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.white),
                    child: Column(children: [
                      Container(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          alignment: Alignment.centerLeft,
                          height: 70,
                          child: Row(children: [
                            Image.asset("assets/images/message/chat_header_service.png", width: 40),
                            SizedBox(width: 10),
                            Expanded(
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [Text("我的客服"), Text("您好，我是工小智，很高兴为您服务。")]))
                          ])),
                      Divider(height: 0, color: Color(0xffeeeeee)),
                      Container(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          alignment: Alignment.centerLeft,
                          height: 70,
                          child: Row(children: [
                            Image.asset("assets/images/message/chat_header_service.png", width: 40),
                            SizedBox(width: 10),
                            Expanded(
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [Text("我的客服"), Text("您好，我是工小智，很高兴为您服务。")]))
                          ])),
                      Divider(height: 0, color: Color(0xffeeeeee)),
                      Container(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          alignment: Alignment.centerLeft,
                          height: 70,
                          child: Row(children: [
                            Image.asset("assets/images/message/chat_header_service.png", width: 40),
                            SizedBox(width: 10),
                            Expanded(
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [Text("我的客服"), Text("您好，我是工小智，很高兴为您服务。")]))
                          ])),
                      Divider(height: 0, color: Color(0xffeeeeee)),
                      Container(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          alignment: Alignment.centerLeft,
                          height: 70,
                          child: Row(children: [
                            Image.asset("assets/images/message/chat_header_service.png", width: 40),
                            SizedBox(width: 10),
                            Expanded(
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [Text("我的客服"), Text("您好，我是工小智，很高兴为您服务。")]))
                          ]))
                    ]))
              ]))
        ]));
  }
}
