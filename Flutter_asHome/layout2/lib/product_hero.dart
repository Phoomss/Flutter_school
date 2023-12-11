import 'package:flutter/material.dart';

class ProductHero extends StatelessWidget {
  final String images;
  const ProductHero({super.key, required this.images});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.asset(images),
    );
  }
}
