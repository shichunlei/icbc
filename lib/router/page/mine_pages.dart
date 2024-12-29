import 'package:get/get.dart';
import 'package:icbc/modules/account/binding.dart';
import 'package:icbc/modules/account/page.dart';
import 'package:icbc/modules/assets/binding.dart';
import 'package:icbc/modules/assets/page.dart';
import 'package:icbc/modules/category/binding.dart';
import 'package:icbc/modules/category/page.dart';
import 'package:icbc/modules/income_expenditure/binding.dart';
import 'package:icbc/modules/income_expenditure/page.dart';
import 'package:icbc/modules/income_expenditure_detail/binding.dart';
import 'package:icbc/modules/income_expenditure_detail/page.dart';
import 'package:icbc/modules/query_detail_info/binding.dart';
import 'package:icbc/modules/query_detail_info/page.dart';
import 'package:icbc/modules/query_details/binding.dart';
import 'package:icbc/modules/query_details/page.dart';

class MinePages {
  /// 我的账户
  GetPage accountRoute = GetPage(name: '/account', bindings: [AccountBinding()], page: () => const AccountPage());

  /// 首页分类管理
  GetPage categoryRoute = GetPage(name: '/category', bindings: [CategoryBinding()], page: () => const CategoryPage());

  /// 我的资产
  GetPage assetsRoute = GetPage(name: '/assets', bindings: [AssetsBinding()], page: () => const AssetsPage());

  /// 收支
  GetPage incomeExpenditureRoute = GetPage(
      name: '/incomeExpenditure', bindings: [IncomeExpenditureBinding()], page: () => const IncomeExpenditurePage());

  /// 收支详情
  GetPage incomeExpenditureDetailRoute = GetPage(
      name: '/incomeExpenditureDetail',
      bindings: [IncomeExpenditureDetailBinding()],
      page: () => const IncomeExpenditureDetailPage());

  /// 查询明细
  GetPage queryDetailsRoute =
      GetPage(name: '/queryDetails', bindings: [QueryDetailsBinding()], page: () => const QueryDetailsPage());

  /// 明细详情
  GetPage queryDetailInfoRoute =
      GetPage(name: '/queryDetailInfo', bindings: [QueryDetailInfoBinding()], page: () => const QueryDetailInfoPage());
}
