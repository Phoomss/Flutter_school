import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    var product = Get.arguments;
    return Scaffold(
      appBar: AppBar(title: const Text("About Page")),
      body: Center(
        child: Column(
          children: [
            Text("ID:${product['id']}"),
            Text( "Name: ${product['name']}"),
            ElevatedButton(
                onPressed: () => Get.back(), child: const Text("Back"))
          ],
        ),
      ),
    );
  }
}
