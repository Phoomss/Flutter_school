import 'dart:convert';
import 'package:bottom_navigetionbar/course.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ProductHero extends StatefulWidget {
  const ProductHero({Key? key});

  @override
  State<ProductHero> createState() => _ProductHeroState();
}

class _ProductHeroState extends State<ProductHero> {
  List<Course> courses = [];

  Future<void> fetchCourses() async {
    try {
      var url = "https://api.codingthailand.com/api/course";
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body)['data'] as List;
        courses = data.map((courseData) => Course.fromJson(courseData)).toList();
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
    super.initState();
    fetchCourses();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("คอร์สเรียนแนะนำ"),
      ),
      body: ListView(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(
                courses.length,
                (index) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Image.network(
                        courses[index].picture,
                        height: 80,
                        width: 80,
                        fit: BoxFit.fill,
                      ),
                      const SizedBox(height: 4.0),
                      Text(courses[index].title),
                    ],
                  ),
                ),
              ),
            ),
          ),
          GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 8.0,
              mainAxisSpacing: 8.0,
            ),
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: courses.length >= 6 ? 6 : courses.length,
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
        ],
      ),
    );
  }
}
