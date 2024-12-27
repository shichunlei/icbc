import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icbc/widgets/home_appbar.dart';

import 'logic.dart';
import 'sub/common.dart';
import 'sub/message.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with AutomaticKeepAliveClientMixin {
  HomeLogic get logic => Get.find<HomeLogic>();

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
        backgroundColor: const Color(0xffF3F4F6),
        body: Stack(children: [
          Obx(() => logic.selectIndex.value == 1
              ? Image.asset("assets/images/home/top_1.png", width: double.infinity, fit: BoxFit.fitWidth)
              : Image.asset("assets/images/home/top_2.png", width: double.infinity, fit: BoxFit.fitWidth)),
          NestedScrollView(
              controller: logic.controller,
              headerSliverBuilder: (_, __) {
                return [
                  SliverToBoxAdapter(child: SizedBox(height: kToolbarHeight + MediaQuery.of(context).padding.top)),
                  SliverToBoxAdapter(
                      child: Container(
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10))),
                          width: double.infinity,
                          margin: const EdgeInsets.symmetric(horizontal: 15),
                          child: Column(children: [
                            SizedBox(
                                height: 50,
                                child: Row(children: [
                                  Container(
                                      width: 80,
                                      alignment: Alignment.center,
                                      child: const Text("通用",
                                          style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500))),
                                  Container(
                                      width: 80,
                                      alignment: Alignment.center,
                                      child: const Text("消息",
                                          style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500))),
                                  const Spacer(),
                                  const Icon(Icons.more_vert, color: Colors.black),
                                  const SizedBox(width: 10)
                                ]))
                          ])))
                ];
              },
              body: TabBarView(controller: logic.tabController, children: const [CommonView(), MessageView()])),
          Obx(() {
            return HomeAppBar(
                tabController: logic.tabController,
                opacity: logic.appBarOpacity.value,
                selectIndex: logic.selectIndex.value,
                onChangeIndex: (value) {
                  logic.selectIndex.value = value;
                  logic.tabController.animateTo(value);
                });
          })
        ]));
  }

  @override
  bool get wantKeepAlive => true;
}
