import 'package:flutter/material.dart';

void main(){
  runApp(Text("hello world",textDirection: TextDirection.rtl));
}
//types of widget for ui
//stateless widget
//stateful widget
//custom widget

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Text