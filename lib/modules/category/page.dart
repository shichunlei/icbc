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
            title: Container(
                height: 30,
                width: double.infinity,
                margin: const EdgeInsets.only(left: 10, right: 15),
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(30), color: const Color(0xff999999))),
            centerTitle: true,
            leading: GestureDetector(
                onTap: Get.back,
                child: Container(
                    width: kToolbarHeight,
                    height: kToolbarHeight,
                    alignment: Alignment.center,
                    child: Image.asset("assets/images/base_im_icon_back.png", width: 25)))),
        body: CustomScrollView(slivers: []));
  }
}
