import 'package:flutter/material.dart';

class ImageCardView extends StatelessWidget {
  final String text;
  final String imagePath;
  final String subText;
  final VoidCallback? onTap;

  const ImageCardView({super.key, required this.text, this.onTap, required this.imagePath, required this.subText});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: GestureDetector(
            onTap: onTap?.call,
            child: Stack(children: [
              Image.asset(imagePath, width: double.infinity, fit: BoxFit.fitWidth),
              Container(
                  padding: const EdgeInsets.only(left: 10, top: 10),
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    Text(text, style: const TextStyle(fontSize: 14, color: Colors.black, fontWeight: FontWeight.w600)),
                    const SizedBox(height: 3),
                    Text(subText, style: const TextStyle(fontSize: 12, color: Color(0xff666666)))
                  ]))
            ])));
  }
}
