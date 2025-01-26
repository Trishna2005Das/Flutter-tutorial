import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CurrencyConverter extends StatelessWidget {
  const CurrencyConverter({super.key});

  @override
  Widget build(BuildContext context) {
    final border = OutlineInputBorder(
      borderSide: const BorderSide(
        color: Color.fromARGB(255, 250, 250, 250),
        width: 2.0,
        style: BorderStyle.solid,
      ),
      borderRadius: BorderRadius.all(
        Radius.circular(60),
      ),
    );

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 0, 0, 0),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              '0',
              style: TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 255, 255, 255),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                style: const TextStyle(
                  color: Colors.white,
                ),
                decoration: InputDecoration(
                  hintText: 'Please enter the amount in INR',
                  hintStyle: const TextStyle(
                    color: Colors.white,
                  ),
                  prefixIcon: const Icon(Icons.monetization_on),
                  prefixIconColor: Colors.white,
                  filled: true,
                  fillColor: const Color.fromARGB(255, 39, 190, 213),
                  focusedBorder: border,
                  enabledBorder: border,
                ),
                keyboardType: TextInputType.numberWithOptions(
                  decimal: true,
                ),
              ),
            ),
            //button=raised and appears like a text
            //appears like a text
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(//returns void
                onPressed: (){
                 if(kDebugMode){
                   print('converted');
                 }
              
                  // debugPrint('converted');
                },//when we pass a function as parameter so we caanot make TextButton const widget even though it has a const constructor
                style: const ButtonStyle(
                  elevation: WidgetStatePropertyAll(30),
                  shadowColor: Colors,
                  backgroundColor: WidgetStatePropertyAll(
                    Colors.lightGreen
                  ),
                  foregroundColor: WidgetStatePropertyAll(
                    Colors.white
                  ),
                  minimumSize: WidgetStatePropertyAll(
                    Size(double.infinity, 50)
                  )
                ),
              
                child: Text('Convert'),
                
              ),
            )
          ],
        ),
      ),
    );
  }
}

 //3 types of mode in flutter
  //debug,release,profile
  //debug->debug mode-it is the default mode 
  //release->release mode- it is the production mode
  //profile->profile mode  - it is the development mode        