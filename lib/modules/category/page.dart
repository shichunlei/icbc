import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icbc/beans/category_bean.dart';
import 'package:icbc/global/tools.dart';
import 'package:icbc/widgets/custom_sticky_header_delegate.dart';
import 'package:icbc/widgets/icon_text.dart';

import 'logic.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({super.key});

  CategoryLogic get logic => Get.find<CategoryLogic>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.white,
            titleSpacing: 0,
            title: Center(
                child: Container(
                    height: 30,
                    width: double.infinity,
                    margin: const EdgeInsets.only(right: 15),
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
        body: Obx(() => logic.categoryBean.value != null
            ? CustomScrollView(slivers: [
                SliverToBoxAdapter(
                    child: SizedBox(
                        height: 50,
                        child: Row(children: [
                          const SizedBox(width: 15),
                          const Text("我的应用"),
                          Expanded(child: Container()),
                          Container(
                              margin: const EdgeInsets.only(right: 10),
                              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.white,
                                  border: Border.all(color: Colors.red, width: .5)),
                              child: const Text("管理", style: TextStyle(color: Colors.red, fontSize: 13)))
                        ]))),
                SliverToBoxAdapter(
                    child: Column(children: [
                  buildCategoryItemView(
                      logic.categoryBean.value!.common!.title!, logic.categoryBean.value!.common!.items),
                  const SizedBox(height: 10),
                  buildCategoryItemView(
                      logic.categoryBean.value!.recommend!.title!, logic.categoryBean.value!.recommend!.items),
                  const SizedBox(height: 10)
                ])),
                SliverPersistentHeader(
                    delegate: CustomSliverPersistentHeaderDelegate(
                        secondColor: Colors.white,
                        height: 50,
                        child: Container(
                            height: 50,
                            decoration: const BoxDecoration(color: Colors.white),
                            child: TabBar(
                                tabs: logic.categoryBean.value!.category
                                    .map((item) => Tab(text: '${item.title}'))
                                    .toList(),
                                indicatorColor: Colors.black,
                                dividerColor: const Color(0xff999999),
                                dividerHeight: .2,
                                controller: logic.tabController,
                                isScrollable: true,
                                unselectedLabelStyle: const TextStyle(fontSize: 15, color: Color(0xff666666)),
                                labelStyle:
                                    const TextStyle(fontSize: 15, color: Colors.black, fontWeight: FontWeight.w600),
                                indicatorSize: TabBarIndicatorSize.label,
                                tabAlignment: TabAlignment.start))),
                    pinned: true),
                SliverList.builder(
                    itemBuilder: (_, index) {
                      return buildCategoryItemView("${logic.categoryBean.value!.category[index].title}",
                          logic.categoryBean.value!.category[index].items);
                    },
                    itemCount: logic.categoryBean.value!.category.length),
                SliverToBoxAdapter(child: SizedBox(height: 1.sh - 200))
              ])
            : Container()));
  }

  Widget buildCategoryItemView(String title, List<ItemsEntity> items) {
    return Container(
        color: Colors.white,
        child: Column(children: [
          Container(
              height: 40,
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.only(left: 15),
              child: Text(title, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500))),
          GridView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 5, mainAxisSpacing: 0, crossAxisSpacing: 0, childAspectRatio: 1),
              itemBuilder: (BuildContext context, int index) {
                return IconTextView(text: "${items[index].title}", imagePath: "${items[index].imagePath}");
              },
              itemCount: items.length)
        ]));
  }
}
