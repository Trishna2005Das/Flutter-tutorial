import 'package:flutter/material.dart';

class CurrencyConverter extends StatelessWidget{
  const CurrencyConverter({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:ColoredBox(
      color: Color.fromRGBO(225, 23, 20, 0.494),
      child:Column(
        
          mainAxisAlignment: MainAxisAlignment.center, 
               
          children: [
            Text('0'),
          ],
      ),
      ),
    );}


}