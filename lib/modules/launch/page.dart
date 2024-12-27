import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icbc/modules/launch/logic.dart';

class LaunchPage extends StatelessWidget {
  const LaunchPage({super.key});

  LaunchLogic get logic => Get.find<LaunchLogic>();

  @override
  Widget build(BuildContext context) {
    precacheImage(logic.image, context);
    return GetBuilder<LaunchLogic>(
        init: logic,
        builder: (logic) {
          return Container(
              color: Colors.white,
              width: double.infinity,
              height: double.infinity,
              child: Image(
                  image: logic.image,
                  fit: BoxFit.cover,
                  gaplessPlayback: true,
                  width: double.infinity,
                  height: double.infinity));
        });
  }
}
