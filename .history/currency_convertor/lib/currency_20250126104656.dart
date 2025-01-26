import 'package:flutter/material.dart';
//1.Create a variable that dstores the currency value
//2.Create a function that converts the currency
//3.Display the value of the variable we created
//4.Display the variable

class Currency extends StatefulWidget {
  const Currency({super.key});

  @override
  State <Currency> createState() {
  print('create state fn');
  return _CurrencyState();

  }
}
class _CurrencyState extends State <Currency>{
  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
  
}
class CurrencyConverter extends StatelessWidget { //statelss widget is immutable
  CurrencyConverter({super.key});
  final TextEditingController controller= TextEditingController();  

  @override
  
}

 //3 types of mode in flutter
  //debug,release,profile
  //debug->debug mode-it is the default mode 
  //release->release mode- it is the production mode
  //profile->profile mode  - it is the development mode        