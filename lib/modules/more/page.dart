import 'package:flutter/material.dart';
import 'package:icbc/beans/category_bean.dart';
import 'package:icbc/widgets/icon_text.dart';
import 'package:icbc/widgets/normal_appbar.dart';

class CardMorePage extends StatelessWidget {
  final List<ItemsEntity> list;

  const CardMorePage({super.key, this.list = const []});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: const NormalAppbar(title: "更多"),
        body: GridView.builder(
            padding: const EdgeInsets.only(top: 10),
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 5, mainAxisSpacing: 0, crossAxisSpacing: 0, childAspectRatio: 1),
            itemBuilder: (BuildContext context, int index) {
              return IconTextView(text: "${list[index].title}", imagePath: "${list[index].imagePath}");
            },
            itemCount: list.length));
  }
}
