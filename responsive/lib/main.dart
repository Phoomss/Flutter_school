import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
        home: HomePage(),
      );
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    Widget layout = Text('');

    if (width <= 500) {
      layout = layoutTwoRows();
    } else if (width > 500 && width < 700) {
      layout = layoutThreeRows();
    } else if (width >= 700) {
      layout = layoutFiveRows();
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('MediaQuery'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: layout,
      ),
    );
  }

  var mainAlign = MainAxisAlignment.spaceEvenly;

  Widget layoutTwoRows() => Column(
        children: [
          Row(
            mainAxisAlignment: mainAlign,
            children: [
              boxContainer('One'),
              boxContainer('Two'),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: mainAlign,
            children: [
              boxContainer('Three'),
              boxContainer('Four'),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: mainAlign,
            children: [
              boxContainer('Five'),
              boxContainer('Six'),
            ],
          )
        ],
      );

  Widget layoutThreeRows() => Column(
        children: [
          Row(
            mainAxisAlignment: mainAlign,
            children: [
              boxContainer('One'),
              boxContainer('Two'),
              boxContainer('Three'),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: mainAlign,
            children: [
              boxContainer('Four'),
              boxContainer('Five'),
              boxContainer('Six'),
            ],
          ),
        ],
      );

  Widget layoutFiveRows() => Column(
        children: [
          Row(
            mainAxisAlignment: mainAlign,
            children: [
              boxContainer('One'),
              boxContainer('Two'),
              boxContainer('Three'),
              boxContainer('Four'),
              boxContainer('Five'),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: mainAlign,
            children: [
              boxContainer('Six'),
              boxContainer('Seven'),
              boxContainer('Eight'),
              boxContainer('Nine'),
              boxContainer('Ten'),
            ],
          ),
        ],
      );

  Widget boxContainer(String text) => Container(
        child: Text(text, textScaleFactor: 1.5),
        width: 100,
        height: 100,
        color: Colors.black12,
        margin: const EdgeInsets.all(20),
        alignment: Alignment.center,
      );
}
