import 'package:flutter/material.dart';
import 'package:flutter_nav/pages/about_page.dart';
import 'package:flutter_nav/pages/contract_page.dart';
import 'package:flutter_nav/pages/home_page.dart';
import 'package:flutter_nav/pages/product_page.dart';
import 'package:flutter_nav/pages/tab_page.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: '/home',
      getPages: [
        GetPage(
            name: "/home",
            page: () => const HomePage(),
            transition: Transition.zoom),
        GetPage(
            name: "/about",
            page: () => const AboutPage(),
            transition: Transition.fade),
        GetPage(
            name: "/product",
            page: () => const ProductPage(),
            transition: Transition.cupertino),
        GetPage(
            name: "/contract",
            page: () => const TabPage (),
            transition: Transition.upToDown)
      ],
    );
  }
}

