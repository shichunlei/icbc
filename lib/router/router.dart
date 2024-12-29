import 'package:get/get.dart';
import 'package:icbc/modules/credit/binding.dart';
import 'package:icbc/modules/home/binding.dart';
import 'package:icbc/modules/index/binding.dart';
import 'package:icbc/modules/index/page.dart';
import 'package:icbc/modules/launch/binding.dart';
import 'package:icbc/modules/launch/page.dart';
import 'package:icbc/modules/life/binding.dart';
import 'package:icbc/modules/mine/binding.dart';
import 'package:icbc/modules/wealth/binding.dart';
import 'package:icbc/router/page/mine_pages.dart';

class AppRouter {
  static AppRouter? _instance;

  factory AppRouter() => _instance ??= AppRouter._();

  AppRouter._();

  /// 默认路由动画
  static const defaultTransition = Transition.native;

  /// 默认路由动画时间
  static const defaultTransitionDuration = Duration(milliseconds: 180);

  /// 默认路由
  static const String initialRoutePath = "/";

  static MinePages minePages = MinePages();

  /// 启动页面
  final GetPage initialRoute = GetPage(
      name: initialRoutePath,
      binding: LaunchBinding(),
      page: () => const LaunchPage(),
      transitionDuration: Duration.zero,
      transition: Transition.noTransition);

  /// 主入口
  GetPage indexRoute = GetPage(
      name: '/index',
      bindings: [IndexBinding(), HomeBinding(), WealthBinding(), CreditBinding(), LifeBinding(), MineBinding()],
      page: () => const IndexPage(),
      transition: Transition.fadeIn);

  List<GetPage> routes() {
    return [
      initialRoute,
      indexRoute,
      minePages.accountRoute,
      minePages.assetsRoute,
      minePages.categoryRoute,
      minePages.incomeExpenditureRoute,
      minePages.incomeExpenditureDetailRoute,
      minePages.queryDetailsRoute,
      minePages.queryDetailInfoRoute
    ];
  }
}
