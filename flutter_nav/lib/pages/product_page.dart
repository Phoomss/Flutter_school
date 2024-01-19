import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_nav/course.dart';
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
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body)['data'] as List;
        courses =
            data.map((courseData) => Course.fromJson(courseData)).toList();
        setState(() {});
      } else {
        print("Error: ${response.statusCode}");
      }
    } catch (e) {
      print("Error: $e");
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchCourses();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Courese"),
      ),
      body: ListView.separated(
          separatorBuilder: (context, index) => const Divider(),
          itemCount: courses.length,
          itemBuilder: (context, index) => ListTile(
                title: Text(courses[index].title),
                subtitle: Text(courses[index].detail),
                leading: ConstrainedBox(
                  constraints: const BoxConstraints(
                      maxHeight: 80, minHeight: 80, maxWidth: 80, minWidth: 80),
                  child: Image.network(
                    courses[index].picture,
                    fit: BoxFit.fill,
                  ),
                ),
                onTap: () {
                  int id = courses[index].id;
                  Get.toNamed("/detail/$id");
                },
              )),
    );
  }
}
