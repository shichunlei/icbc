import 'package:get/get.dart';
import 'package:icbc/modules/account/binding.dart';
import 'package:icbc/modules/account/page.dart';
import 'package:icbc/modules/assets/binding.dart';
import 'package:icbc/modules/assets/page.dart';
import 'package:icbc/modules/category/binding.dart';
import 'package:icbc/modules/category/page.dart';

class MinePages {
  /// 我的账户
  GetPage accountRoute = GetPage(name: '/account', bindings: [AccountBinding()], page: () => const AccountPage());

  /// 首页分类管理
  GetPage categoryRoute = GetPage(name: '/category', bindings: [CategoryBinding()], page: () => const CategoryPage());

  /// 我的资产
  GetPage assetsRoute = GetPage(name: '/assets', bindings: [AssetsBinding()], page: () => const AssetsPage());
}
