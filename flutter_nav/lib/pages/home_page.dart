import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var product = {'id': 999, 'name': "Chocolate"};
    var contract = {
      'department': "Information Technology",
      "StuName": "Narongsak P."
    };
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
                onPressed: () => Get.toNamed("/about?token=999&name=Jack"),
                child: const Text("About")),
            ElevatedButton(
                onPressed: () => Get.toNamed("/product", arguments: product),
                child: const Text("Product")),
            ElevatedButton(
                onPressed: () => Get.toNamed("/contract", arguments: contract),
                child: const Text(
                  "Contract",
                ))
          ],
        ),
      ),
    );
  }
}
