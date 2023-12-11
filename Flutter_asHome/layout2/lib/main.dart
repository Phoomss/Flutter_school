import 'package:flutter/material.dart';
import 'package:layout2/card_product.dart';
import 'package:layout2/product_hero.dart';
import 'package:layout2/utils/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: getThemeData(),
      title: "My App",
      home: Scaffold(
        appBar: AppBar(
          title: const Text("STONG || SHOSE"),
          leading: IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {},
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {
                // Implement search functionality
              },
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ProductHero(images: "assets/images/nike1.jpg"),
                    ProductHero(images: "assets/images/nike2.jpg"),
                    ProductHero(images: "assets/images/nike3.jpg"),
                    ProductHero(images: "assets/images/nike1.jpg"),
                    ProductHero(images: "assets/images/nike2.jpg"),
                    ProductHero(images: "assets/images/nike3.jpg"),
                    ProductHero(images: "assets/images/nike1.jpg"),
                    ProductHero(images: "assets/images/nike2.jpg"),
                    ProductHero(images: "assets/images/nike3.jpg"),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "New Model",
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                    GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 8.0,
                        mainAxisSpacing: 8.0,
                      ),
                      itemCount: 12,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return const CardProduct(
                            card: "assets/images/nike1.jpg");
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
