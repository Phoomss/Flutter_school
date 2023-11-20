import 'package:flutter/material.dart';
import 'package:start_app/Student.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // List<String> names = ['John', 'Jack', 'Jo', 'Jim'];
    Student std = Student();
    std.id = "65309";
    std.name = "Narongsak";
    std.address = "Bang Len";
    std.tel = "08888888";
    std.imgPath = "images/student.png";
    return MaterialApp(
      title: "App02",
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Simole App 02"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // for(String name in names)
              //  Text(name),
              // for (int i = 0; i < 4; i++)
              // Text(names[i]),
              Text(std.id),
              Text(std.name),
              Text(std.address),
              Text(std.tel),
              Image.asset(std.imgPath)
            ],
          ),
        ),
      ),
    );
  }
}
