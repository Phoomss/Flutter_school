import 'package:flutter/material.dart';

class LogoWidget extends StatelessWidget {
  final Color color;
  final Color color2;
  const LogoWidget({super.key, required this.color, required this.color2});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        decoration: BoxDecoration(
          color: Colors.amber[600],
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
          boxShadow: const [
            BoxShadow(color: Colors.green, blurRadius: 10, offset: Offset(4, 7))
          ],
        ),
        width: 60,
        height: 60,
      ),
      Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
            color: color,
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                bottomRight: Radius.circular(20))),
      ),
      Container(
        width: 40,
        height: 40,
        decoration:  BoxDecoration(
            color: color2,
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                bottomRight: Radius.circular(20))),
      )
    ]);
  }
}
