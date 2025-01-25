import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Align(
          alignment: Alignment.topLeft,
          child: Container(
            width: 375,
            height: 116,
            margin: const EdgeInsets.only(left: 0, top: 0),
            decoration: BoxDecoration(
              color: Colors.transparent, // Matches #00000000
              shape: BoxShape.rectangle,
            ),
          ),
        ),
      ),
    );
  }
}
