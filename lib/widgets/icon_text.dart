import 'package:flutter/material.dart';

class IconTextView extends StatelessWidget {
  final String text;
  final String imagePath;
  final Size size;
  final double fontSize;
  final VoidCallback? onTap;
  final int maxLines;
  final FontWeight? fontWeight;
  final Color textColor;

  const IconTextView(
      {super.key,
      required this.text,
      required this.imagePath,
      this.onTap,
      this.size = const Size(30, 30),
      this.fontSize = 13,
      this.maxLines = 2,
      this.fontWeight,
      this.textColor = Colors.black});

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
                  style: TextStyle(color: textColor, fontSize: fontSize, fontWeight: fontWeight ?? FontWeight.w500),
                  textAlign: TextAlign.center,
                  maxLines: maxLines)
            ])));
  }
}
