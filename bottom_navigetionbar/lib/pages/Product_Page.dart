import 'dart:convert';

import 'package:bottom_navigetionbar/course.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ProductPage extends StatefulWidget {
  const ProductPage({Key? key}) : super(key: key);

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  List<Course> courses = [];

  Future<void> fetchCourses() async {
    try {
      var url = "https://api.codingthailand.com/api/course";
      final res = await http.get(Uri.parse(url));
      if (res.statusCode == 200) {
        final data = jsonDecode(res.body)['data'] as List;
        courses = data.map((courseData) => Course.fromJson(courseData)).toList();
        setState(() {});
      } else {
        print("Error: ${res.statusCode}");
      }
    } catch (e) {
      print("Error: $e");
    }
  }

  @override
  void initState() {
    super.initState();
    fetchCourses();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("คอร์สเรียนทั้งหมด"),
      ),
      body: SingleChildScrollView(
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8.0,
            mainAxisSpacing: 8.0,
          ),
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: courses.length ,
          itemBuilder: (context, index) {
            return Card(
              child: InkWell(
                onTap: () {
                  int id = courses[index].id;
                  Get.toNamed("/detail/$id");
                },
                child: Column(
                  children: [
                    Image.network(
                      courses[index].picture,
                      height: 120,
                      width: double.infinity,
                      fit: BoxFit.fill,
                    ),
                    const SizedBox(height: 8.0),
                    Text(
                      courses[index].title,
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      courses[index].detail,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
