import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Multipage"),
        ),
        body: Column(
          children: [
            Center(
              child: ElevatedButton(
                  onPressed: () {
                    Get.toNamed("about");
                  },
                  child: const Text(
                    "About",
                    style: TextStyle(fontSize: 20),
                  )),
            ),
            Center(
              child: ElevatedButton(
                  onPressed: () {
                    Get.toNamed("product");
                  },
                  child: const Text(
                    "Product",
                    style: TextStyle(fontSize: 20),
                  )),
            ),
            Center(
              child: ElevatedButton(
                  onPressed: () {
                    Get.toNamed("service");
                  },
                  child: const Text(
                    "Service",
                    style: TextStyle(fontSize: 20),
                  )),
            ),
            Center(
              child: ElevatedButton(
                  onPressed: () {
                    Get.toNamed("contract");
                  },
                  child: const Text(
                    "Contract",
                    style: TextStyle(fontSize: 20),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
