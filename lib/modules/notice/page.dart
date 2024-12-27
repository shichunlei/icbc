import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NoticePage extends StatelessWidget {
  const NoticePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xffF3F4F6),
        body: Stack(children: [
          Image.asset("assets/images/wealth/invest9_bg.webp", width: double.infinity, fit: BoxFit.fitWidth),
          AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              centerTitle: true,
              title: const Text("消息中心", style: TextStyle(fontSize: 16, color: Colors.white)),
              actions: [
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Image.asset("assets/images/message/chat_read_icon.png", width: 20, height: 20),
                  const Text("全部已读", style: TextStyle(color: Colors.white, fontSize: 10))
                ]),
                const SizedBox(width: 10),
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Image.asset("assets/images/message/subscribe_manage_icon.png", width: 20, height: 20),
                  const Text("消息管理", style: TextStyle(color: Colors.white, fontSize: 10))
                ]),
                const SizedBox(width: 15)
              ],
              leading: Center(
                  child: GestureDetector(
                      onTap: Get.back, child: Image.asset("assets/images/ic_back.png", width: 20, height: 20)))),
          Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(children: [
                SizedBox(height: kToolbarHeight + MediaQuery.of(context).padding.top),
                Container(
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.white),
                    child: Column(children: [
                      Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          alignment: Alignment.centerLeft,
                          height: 70,
                          child: Row(children: [
                            Image.asset("assets/images/message/chat_header_service.png", width: 40),
                            const SizedBox(width: 10),
                            const Expanded(
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                  Text("我的客服"),
                                  SizedBox(height: 3),
                                  Text("您好，我是工小智，很高兴为您服务。", style: TextStyle(fontSize: 12, color: Color(0xff666666)))
                                ]))
                          ])),
                      const Divider(height: 0, color: Color(0xffeeeeee), indent: 10, endIndent: 10),
                      Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          alignment: Alignment.centerLeft,
                          height: 70,
                          child: Row(children: [
                            Image.asset("assets/images/message/chat_header_account.png", width: 40),
                            const SizedBox(width: 10),
                            const Expanded(
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                  Text("动账通知"),
                                  SizedBox(height: 3),
                                  Text("余额变动及时知晓 安全免费", style: TextStyle(fontSize: 12, color: Color(0xff666666)))
                                ]))
                          ])),
                      const Divider(height: 0, color: Color(0xffeeeeee), indent: 10, endIndent: 10),
                      Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          alignment: Alignment.centerLeft,
                          height: 70,
                          child: Row(children: [
                            Image.asset("assets/images/message/chat_header_todo.png", width: 40),
                            const SizedBox(width: 10),
                            const Expanded(
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                  Text("待办事项"),
                                  SizedBox(height: 3),
                                  Text("代办提醒 省心省力", style: TextStyle(fontSize: 12, color: Color(0xff666666)))
                                ]))
                          ])),
                      const Divider(height: 0, color: Color(0xffeeeeee), indent: 10, endIndent: 10),
                      Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          alignment: Alignment.centerLeft,
                          height: 70,
                          child: Row(children: [
                            Image.asset("assets/images/message/chat_header_deal.png", width: 40),
                            const SizedBox(width: 10),
                            const Expanded(
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                  Text("交易提醒"),
                                  SizedBox(height: 3),
                                  Text("交易信息 全面掌握", style: TextStyle(fontSize: 12, color: Color(0xff666666)))
                                ]))
                          ]))
                    ])),
                Container(
                    margin: const EdgeInsets.only(top: 10),
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.white),
                    child: Column(children: [
                      Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          alignment: Alignment.centerLeft,
                          height: 70,
                          child: Row(children: [
                            Image.asset("assets/images/message/chat_header_rights.png", width: 40),
                            const SizedBox(width: 10),
                            const Expanded(
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                  Text("权益中心"),
                                  SizedBox(height: 3),
                                  Text("惊喜福利 一手玩转", style: TextStyle(fontSize: 12, color: Color(0xff666666)))
                                ]))
                          ])),
                      const Divider(height: 0, color: Color(0xffeeeeee), indent: 10, endIndent: 10),
                      Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          alignment: Alignment.centerLeft,
                          height: 70,
                          child: Row(children: [
                            Image.asset("assets/images/message/chat_header_announce.png", width: 40),
                            const SizedBox(width: 10),
                            const Expanded(
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                  Text("服务公告"),
                                  SizedBox(height: 3),
                                  Text("重要通知 一条不落", style: TextStyle(fontSize: 12, color: Color(0xff666666)))
                                ]))
                          ])),
                      const Divider(height: 0, color: Color(0xffeeeeee), indent: 10, endIndent: 10),
                      Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          alignment: Alignment.centerLeft,
                          height: 70,
                          child: Row(children: [
                            Image.asset("assets/images/message/chat_header_discount.png", width: 40),
                            const SizedBox(width: 10),
                            const Expanded(
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                  Text("优惠活动"),
                                  SizedBox(height: 3),
                                  Text("活动动态 及时掌握", style: TextStyle(fontSize: 12, color: Color(0xff666666)))
                                ]))
                          ])),
                      const Divider(height: 0, color: Color(0xffeeeeee), indent: 10, endIndent: 10),
                      Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          alignment: Alignment.centerLeft,
                          height: 70,
                          child: Row(children: [
                            Image.asset("assets/images/message/chat_header_news.png", width: 40),
                            const SizedBox(width: 10),
                            const Expanded(
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                  Text("行情资讯"),
                                  SizedBox(height: 3),
                                  Text("金融行情 专家观点", style: TextStyle(fontSize: 12, color: Color(0xff666666)))
                                ]))
                          ])),
                      const Divider(height: 0, color: Color(0xffeeeeee), indent: 10, endIndent: 10),
                      Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          alignment: Alignment.centerLeft,
                          height: 70,
                          child: Row(children: [
                            Image.asset("assets/images/message/chat_header_product.png", width: 40),
                            const SizedBox(width: 10),
                            const Expanded(
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                  Text("产品推荐"),
                                  SizedBox(height: 3),
                                  Text("热销产品 专业推荐", style: TextStyle(fontSize: 12, color: Color(0xff666666)))
                                ]))
                          ]))
                    ]))
              ]))
        ]));
  }
}
