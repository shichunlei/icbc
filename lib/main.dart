import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:icbc/db_helper/record_db_helper.dart';
import 'package:icbc/router/router.dart';
import 'package:intl/intl.dart';

import 'beans/income_expenditure_record.dart';
import 'db_helper/realm_manager.dart';
import 'global/tools.dart';

void main() {
  try {
    runZonedGuarded(() async {
      WidgetsFlutterBinding.ensureInitialized();
      await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
      runApp(const MyApp());

      // 小白条、导航栏沉浸
      if (Platform.isAndroid) {
        final androidInfo = await DeviceInfoPlugin().androidInfo;
        if (androidInfo.version.sdkInt >= 29) {
          SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
        }
        SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
            systemNavigationBarColor: Colors.transparent,
            systemNavigationBarDividerColor: Colors.transparent,
            statusBarColor: Colors.transparent));
      }
    }, (Object error, StackTrace stack) {
      // Log.e(error.toString());
    });
  } catch (e) {
    // Log.e(e.toString());
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenUtils.init(context);
    return GetMaterialApp(
        title: '中国工商银行',
        theme: ThemeData.light().copyWith(
            scaffoldBackgroundColor: const Color(0xffF3F4F6),
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            bottomNavigationBarTheme: const BottomNavigationBarThemeData(backgroundColor: Colors.white),
            appBarTheme:
                const AppBarTheme(backgroundColor: Colors.white, scrolledUnderElevation: 0, centerTitle: true)),
        getPages: AppRouter().routes(),
        themeMode: ThemeMode.light,
        initialRoute: AppRouter.initialRoutePath,
        initialBinding: InitialBinding(),
        navigatorObservers: const [],
        debugShowCheckedModeBanner: false,
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate
        ],
        defaultTransition: AppRouter.defaultTransition,
        transitionDuration: AppRouter.defaultTransitionDuration,
        locale: const Locale("zh", "CN"),
        fallbackLocale: const Locale("zh", "CN"),
        builder: (BuildContext context, Widget? child) {
          ScreenUtils.init(context);
          return MediaQuery(
              data: MediaQuery.of(context).copyWith(textScaler: const TextScaler.linear(1.0)),
              child: FlutterEasyLoading(child: child!));
        });
  }
}

class InitialBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<GlobalController>(GlobalController(), permanent: true);
  }
}

class GlobalController extends GetxController {
  /// 登录状态
  var isLogin = false.obs;

  /// 总负债
  var liabilities = 0;

  /// 全局余额
  final num _balance = 0;

  var balanceStr = "0.00".obs;

  GlobalController() {
    balanceStr.value = NumberFormat("#,##0.00", "en_US").format(_balance);
  }

  void updateBalance(double value) {
    balanceStr.value = NumberFormat("#,##0.00", "en_US").format(value);
  }

  /// 登录时间
  Rx<DateTime?> loginTime = Rx<DateTime?>(null);

  void login() async {
    EasyLoading.show(status: "正在登录...");
    List<IncomeExpenditureRecord> list = await RecordDbHelper().queryAllRecords();
    if (list.isEmpty) {
      String response = await rootBundle.loadString("assets/data/records_items.json");
      List<IncomeExpenditureRecord> _list =
          (json.decode(response) as List).map((item) => IncomeExpenditureRecord.fromJson(item)).toList();

      for (var item in _list) {
        await RecordDbHelper().upsert(entityToRealm(item));
      }
    }

    updateBalance(await RecordDbHelper().queryLastRecords() as double);

    isLogin.value = true;
    loginTime.value = DateTime.now();
    EasyLoading.dismiss();
  }

  void logout() {
    isLogin.value = false;
    loginTime.value = null;
  }

  /// 用户名
  String userName = "包汉林";

  String starName = "*汉林";

  String address = "大连";

  @override
  void onClose() {
    RealmManager().close();
    super.onClose();
  }
}
