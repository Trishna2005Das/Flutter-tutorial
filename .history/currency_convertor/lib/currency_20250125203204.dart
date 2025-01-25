import 'package:flutter/material.dart';
class CurrencyConverter extends StatelessWidget{
  const CurrencyConverter({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:ColoredBox(
      color: Colors.fromRGBO(0, 0, 0, 0.5),
      child:Column(
        
          mainAxisAlignment: MainAxisAlignment.center, 
          crossAxisAlignment: CrossAxisAlignment.center,         
          children: [
            Text('0'),
          ],
      ),
      ),
    );}


}