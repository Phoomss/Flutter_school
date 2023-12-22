import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

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
