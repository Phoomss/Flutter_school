import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ContractPage extends StatelessWidget {
  const ContractPage({super.key});

  @override
  Widget build(BuildContext context) {
    var contract = Get.arguments;
    return Scaffold(
      appBar: AppBar(title: const Text("Contract Page")),
      body: Center(
        child: Column(
          children: [
             Text( "Department: ${contract['department']}"),
             Text("StuName: ${contract['StuName']}"),
            ElevatedButton(
                onPressed: () => Get.back(), child: const Text("Back"))
          ],
        ),
      ),
    );
  }
}
