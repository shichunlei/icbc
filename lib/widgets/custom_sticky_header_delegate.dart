import 'package:flutter/material.dart';

class CustomSliverPersistentHeaderDelegate extends SliverPersistentHeaderDelegate {
  final Widget child;
  final ValueChanged<bool>? headerVisible;
  final double? height;
  final double? maxHeight;
  final double? minHeight;
  final Color? firstColor;
  final Color? secondColor;

  const CustomSliverPersistentHeaderDelegate(
      {required this.child,
      this.height,
      this.headerVisible,
      this.maxHeight,
      this.minHeight,
      this.firstColor,
      this.secondColor});

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    headerVisible?.call(overlapsContent);
    return Container(
        alignment: Alignment.centerLeft,
        color: overlapsContent ? firstColor ?? Colors.white : secondColor ?? Colors.white,
        child: child);
  }

  @override
  double get maxExtent => maxHeight ?? height ?? 50;

  @override
  double get minExtent => minHeight ?? height ?? 50;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => true;
}
