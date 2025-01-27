import 'package:flutter/material.dart';
// import 'package:currency_convertor/pages/currency.dart';
import 'currency-material_app.dart'; 
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
    return const MaterialApp(
      home:Currency(),
    );
  }
}
//Material tree is a collection of widgets.

//while returing widget we use const because it is static.It does not have to be rebuilt.
//Text is a widget that displays text on screen

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}