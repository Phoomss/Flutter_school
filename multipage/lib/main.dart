import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multipage/pages/about_page.dart';
import 'package:multipage/pages/contract_page.dart';
import 'package:multipage/pages/home_page.dart';
import 'package:multipage/pages/product_page.dart';
import 'package:multipage/pages/service_page.dart';

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
        GetPage(name: "/home", page: () => const HomePage()),
        GetPage(name: "/product", page: () => const ProductPage()),
        GetPage(name: "/about", page: () => const AboutPage()),
        GetPage(name: "/service", page: ()=>const ServicePage()),
        GetPage(name: "/contract", page: ()=>const ContractPage())
      ],
    );
  }
}
