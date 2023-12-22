import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ContractPage extends StatelessWidget {
  const ContractPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("About Page"),
        ),
        body: Column(
          children: [
            Center(
              child: ElevatedButton(
                  onPressed: () {
                    Get.back();
                  },
                  child: const Text(
                    "Home",
                    style: TextStyle(fontSize: 20),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
