import 'package:flutter/material.dart';

void main(){
  runApp;
}
//types of widget for ui
//stateless widget
//stateful widget
//custom widget

class MyApp extends StatelessWidget{
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return Text("hello world",textDirection: TextDirection.rtl);
  }
}