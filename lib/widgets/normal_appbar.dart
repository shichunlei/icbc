import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NormalAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;

  const NormalAppbar({super.key, required this.title, this.actions});

  @override
  Widget build(BuildContext context) {
    return AppBar(
        leading: GestureDetector(
            onTap: Get.back,
            child: Container(
                width: kToolbarHeight,
                height: kToolbarHeight,
                alignment: Alignment.center,
                child: Image.asset("assets/images/base_im_icon_back.png", width: 25))),
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: Color(0xff5F7484))),
        actions: actions ??
            [
              Image.asset("assets/images/base_im_icon_service.png", width: 20),
              const SizedBox(width: 15),
              Image.asset("assets/images/base_im_icon_more.png", width: 20),
              const SizedBox(width: 10)
            ],
        centerTitle: true);
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
