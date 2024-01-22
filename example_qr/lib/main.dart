import 'package:example_qr/pages/HomePage.dart';
import 'package:example_qr/pages/ScanPage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: "/home",
      getPages: [
        GetPage(name: "/home", page: () => const HomePage()),
        GetPage(name: "/scan", page: () => const ScanPage())
      ],
      debugShowCheckedModeBanner: false,
    );
  }
}
