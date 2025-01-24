import 'package:flutter/material.dart';

void main(){
  runApp(const MyApp());
}
//types of widget for ui
//stateless widget
//stateful widget
//custom widget

class MyApp extends StatelessWidget{
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return constText("hello world",textDirection: TextDirection.rtl);
  }
}
//while returing widget we have 