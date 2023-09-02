import 'package:esmabatu/pages/home_page.dart';
import 'package:esmabatu/route.dart';
import 'package:esmabatu/utils/bindings.dart';
import 'package:esmabatu/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp.router(
      title: appTitle,
      getPages: GetRoute.route,
      defaultTransition: Transition.noTransition,
      routerDelegate: AppRouterDelegate(),
      debugShowCheckedModeBanner: false,
      initialBinding: MainBinding(),
      fallbackLocale: const Locale("tr"),
      // theme: Colors.blueGrey
      themeMode: ThemeMode.dark,
    );
  }
}

class AppRouterDelegate extends GetDelegate {
  @override
  Widget build(BuildContext context) {
    return Navigator(
      onPopPage: (route, result) => route.didPop(result),
      pages: currentConfiguration != null
          ? [currentConfiguration!.currentPage!]
          : [GetNavConfig.fromRoute(MyRoute.main)!.currentPage!],
    );
  }
}
