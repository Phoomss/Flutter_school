import 'dart:convert';
import 'package:bottom_navigetionbar/Chapter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';
import 'package:intl/intl.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);

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
    id = int.parse(Get.parameters['id'] ?? '');
    fetchDetail(id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("เนื้อหาการสอน"),
      ),
      body: chapters.isEmpty
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: chapters.length,
              itemBuilder: (context, index) {
                final chapter = chapters[index];

                // Parse the time in "mm:ss" format
                DateTime time = DateFormat("mm:ss").parse(chapter.chTimetotal);

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AspectRatio(
                      aspectRatio: 16 / 9,
                      child: Chewie(
                        controller: ChewieController(
                          videoPlayerController: VideoPlayerController.network(
                            chapter.chUrl,
                          ),
                          aspectRatio: 16 / 9,
                          autoPlay: false,
                          looping: false,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      chapter.chTitle,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'เวลา: ${time.minute}:${time.second}',
                      style: const TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(height: 16),
                  ],
                );
              },
            ),
    );
  }
}
