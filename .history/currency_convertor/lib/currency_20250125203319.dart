import 'package:flutter/material.dart';

class CurrencyConverter extends StatelessWidget{
  const CurrencyConverter({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:ColoredBox(
      color: Color.fromRGBO(228, 16, 12, 0.494),
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