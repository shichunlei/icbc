import 'dart:async';
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:icbc/router/router.dart';

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
    return GetMaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData.light().copyWith(
            scaffoldBackgroundColor: const Color(0xffF3F4F6),
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            bottomNavigationBarTheme: const BottomNavigationBarThemeData(backgroundColor: Colors.white)),
        getPages: AppRouter().routes(),
        themeMode: ThemeMode.light,
        initialRoute: AppRouter.initialRoutePath,
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
          return MediaQuery(
              data: MediaQuery.of(context).copyWith(textScaler: const TextScaler.linear(1.0)),
              child: FlutterEasyLoading(child: child!));
        });
  }
}
