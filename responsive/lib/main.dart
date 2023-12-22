import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Responsive"),
        ),
        body: Container(
          alignment: Alignment.topCenter,
          child: Text("Height: ${height},\n Width: ${width}"),
        ),
      ),
    );
  }
}
