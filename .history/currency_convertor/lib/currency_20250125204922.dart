import 'package:flutter/material.dart';

class CurrencyConverter extends StatelessWidget{
  const CurrencyConverter({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Center(
     
      child:Column(
        
          mainAxisAlignment: MainAxisAlignment.center, 
               
          children: [
            Text('0',
            style:TextStyle(
              fontSize: 50,
              fontWeight: FontWeight.bold,
              color: Colors.black
              )
              ),
          ],
      ),
      ),
    );}


}