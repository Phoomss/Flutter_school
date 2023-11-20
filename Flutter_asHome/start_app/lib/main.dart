import 'package:flutter/material.dart';
import 'package:start_app/Student.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Student stu = Student();
    stu.id = "65039";
    stu.name = "Narongsak P.";
    stu.address = "Bang Len";
    stu.tel = "088888888";
    stu.imgPath = "images/student.jpeg";
    return MaterialApp(
      title: "App02",
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Simple App 02"),
        ),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(stu.id),
            Text(stu.name),
            Text(stu.address),
            Text(stu.tel),
           Image.asset(stu.imgPath)
          ],
        )),
      ),
    );
  }
}
