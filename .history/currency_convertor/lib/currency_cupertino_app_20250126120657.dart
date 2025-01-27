import 'package:flutter/cupertino.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  double result = 0;
  final TextEditingController controller = TextEditingController();
  void convert() {
    result = (double.parse(controller.text) * 86.5);
    setState(() {});
  }
  @override
  Widget build(BuildContext context) {
   v
  }
}