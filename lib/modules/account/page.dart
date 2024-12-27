import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icbc/widgets/normal_appbar.dart';

import 'logic.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  AccountLogic get logic => Get.find<AccountLogic>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: NormalAppbar(title: "我的账户", actions: [
          Center(
              child: TextButton(child: const Text("更多", style: TextStyle(color: Color(0xff5F7484))), onPressed: () {}))
        ]),
        body: SingleChildScrollView(child: Column(children: [

        ])));
  }
}
