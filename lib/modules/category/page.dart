import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'logic.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({super.key});

  CategoryLogic get logic => Get.find<CategoryLogic>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Center(
                child: Container(
                    height: 30,
                    width: double.infinity,
                    margin: const EdgeInsets.only(left: 10, right: 15),
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(30), color: const Color(0xffdddddd)),
                    child: Row(children: [
                      const SizedBox(width: 8),
                      Image.asset("assets/images/icon_search_b.png", width: 15, height: 15),
                      const SizedBox(width: 5),
                      const Expanded(child: Text("全部应用", style: TextStyle(color: Color(0xff999999), fontSize: 12)))
                    ]))),
            centerTitle: true,
            leading: GestureDetector(
                onTap: Get.back,
                child: Container(
                    width: kToolbarHeight,
                    height: kToolbarHeight,
                    alignment: Alignment.center,
                    child: Image.asset("assets/images/base_im_icon_back.png", width: 25)))),
        body: CustomScrollView(slivers: [
          SliverToBoxAdapter(
              child: SizedBox(
                  height: 50,
                  child: Row(children: [
                    const Text("我的应用"),
                    Expanded(child: Container()),
                    Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                            border: Border.all(color: Colors.red, width: .5)),
                        child: const Text("管理", style: TextStyle(color: Colors.red, fontSize: 12)))
                  ]))),
          SliverToBoxAdapter(
              child: Container(
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.white),
                  margin: EdgeInsets.only(top: 15),
                  height: 50,
                  child: Row(children: [
                    const Text("我的应用"),
                    Expanded(child: Container()),
                    Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                            border: Border.all(color: Colors.red, width: .5)),
                        child: const Text("管理", style: TextStyle(color: Colors.red, fontSize: 12)))
                  ])))
        ]));
  }
}
