import 'package:flutter/material.dart';

class IconTextView extends StatelessWidget {
  final String text;
  final String imagePath;
  final Size size;
  final double fontSize;
  final VoidCallback? onTap;

  const IconTextView(
      {super.key,
      required this.text,
      required this.imagePath,
      this.onTap,
      this.size = const Size(30, 30),
      this.fontSize = 13});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: GestureDetector(
            onTap: onTap?.call,
            behavior: HitTestBehavior.translucent,
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              Image.asset(imagePath, width: size.width, height: size.height),
              const SizedBox(height: 3),
              Text("$text\n",
                  style: TextStyle(color: Colors.black, fontSize: fontSize, fontWeight: FontWeight.w500),
                  textAlign: TextAlign.center,
                  maxLines: 2)
            ])));
  }
}
