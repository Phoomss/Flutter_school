import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'logo_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "My App",
        home: Scaffold(
            appBar: AppBar(
              title: const Text("My Application"),
              leading: IconButton(
                icon: const Icon(Icons.home_filled),
                onPressed: () {},
              ),
              actions: [
                IconButton(
                  icon: const Icon(Icons.account_circle),
                  onPressed: () {},
                ),
                IconButton(
                  icon: const Icon(Icons.add_a_photo),
                  onPressed: () {},
                ),
              ],
            ),
            body: const SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  LogoWidget(
                    color: Colors.black,
                    color2: Colors.red,
                    color3: Colors.blue,
                  ),
                  LogoWidget(
                    color: Colors.green,
                    color2: Colors.white,
                    color3: Colors.black,
                  ),
                  LogoWidget(
                    color: Colors.blue,
                    color2: Colors.red,
                    color3: Colors.yellow,
                  ),
                ],
              ),
            )));
  }
}
