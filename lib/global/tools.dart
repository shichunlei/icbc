import 'package:flutter/material.dart';

class ScreenUtils {
  ScreenUtils._();

  /// 是否初始化
  static bool _isInit = false;

  /// 屏幕宽度
  static double screenWidth = 0;

  /// 屏幕高度
  static double screenHeight = 0;

  /// 状态栏高度
  static double statusBarHeight = 0;

  /// 导航栏高度
  static double navbarHeight = 46;

  /// 底部安全高度高度
  static double safeBottomHeight = 0;

  /// 屏幕适配初始化
  static void init(BuildContext context) {
    _isInit = true;
    if (screenWidth != 0 && statusBarHeight != 0) return;
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    statusBarHeight = MediaQuery.of(context).padding.top;
    safeBottomHeight = MediaQuery.of(context).padding.bottom;
  }
}

extension ScreenUtilsExtension on num {
  ///屏幕宽度的倍数
  ///Multiple of screen width
  double get sw => ScreenUtils.screenWidth * this;
}
