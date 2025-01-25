import 'package:flutter/material.dart';
import 'package:currency_convertor/cuurency.dart';
void main(){
  runApp(const MyApp());
}
//types of widget for ui
//stateless widget
//stateful widget
//custom widget


//material design
//cupertino design
class MyApp extends StatelessWidget{
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:CurrencyConverter(),
    );
  }
}
//Material tree is a collection of widgets.

//while returing widget we use const because it is static.It does not have to be rebuilt.
//Text is a widget that displays text on screen