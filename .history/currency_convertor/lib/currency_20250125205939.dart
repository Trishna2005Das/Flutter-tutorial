import 'package:flutter/material.dart';

class CurrencyConverter extends StatelessWidget{
  const CurrencyConverter({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 0, 0, 0),
      body:Center(
     
      child:Column(
        
          mainAxisAlignment: MainAxisAlignment.center, 
               
          children: [
            Text('0',
            style:TextStyle(
              fontSize: 50,
              fontWeight: FontWeight.bold,
              color: const Color.fromARGB(255, 255, 255, 255),
              )
              ),
              
          ],
      ),
      ),
    );}


}