import 'package:flutter/material.dart';
import 'package:icbc/widgets/icon_text.dart';
import 'package:icbc/widgets/normal_appbar.dart';

class CardMorePage extends StatelessWidget {
  final List<Map<String, dynamic>> list;

  const CardMorePage({super.key, this.list = const []});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: NormalAppbar(title: "更多"),
        body: GridView.builder(
            padding: EdgeInsets.only(top: 10),
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 5, mainAxisSpacing: 0, crossAxisSpacing: 0, childAspectRatio: 1),
            itemBuilder: (BuildContext context, int index) {
              return IconTextView(text: list[index]["title"], imagePath: list[index]["imagePath"]);
            },
            itemCount: list.length));
  }
}
