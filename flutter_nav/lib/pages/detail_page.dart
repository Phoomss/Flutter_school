import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_nav/Chapter.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  var id;
  List<Chapter> chapters = [];

  Future<void> fetchDetail(int id) async {
    try {
      var url = "https://api.codingthailand.com/api/course/$id";
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body)['data'] as List;
        chapters =
            data.map((chapterData) => Chapter.fromJson(chapterData)).toList();
        setState(() {});
      } else {
        print("Error: ${response.statusCode}");
      }
    } catch (e) {
      print("Error $e");
    }
  }

  @override
  void initState() {
    super.initState();
    id = int.parse(Get.parameters['id'] ??
        ''); // Use int.parse to convert the String to int
    fetchDetail(id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail Page"),
      ),
      body: chapters.isEmpty
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: chapters.length,
              itemBuilder: (context, index) {
                final chapter = chapters[index];
                return ListTile(
                  title: Text(chapter.chUrl),
                  // Add more details or customize ListTile as needed
                );
              },
            ),
    );
  }
}
