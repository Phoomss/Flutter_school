import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // fscaff
    return Scaffold(
      appBar: AppBar(
        title: const Text('Title'),
        actions: [
          IconButton(
              onPressed: () {
                Get.toNamed("/scan");
              },
              icon: const Icon(Icons.qr_code_scanner))
        ],
      ),
      body: Center(
        child: QrImageView(
          data: '1234567890',
          version: QrVersions.auto,
          size: 200.0,
          gapless: false,
          embeddedImage: const AssetImage('images/images.jpg'),
          embeddedImageStyle: const QrEmbeddedImageStyle(size: Size(50, 40)),
        ),
      ),
    );
  }
}
