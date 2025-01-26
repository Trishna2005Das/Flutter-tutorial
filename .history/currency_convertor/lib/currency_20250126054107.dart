import 'package:flutter/material.dart';

class CurrencyConverter extends StatelessWidget {
  const CurrencyConverter({super.key});
  @override
  Widget build(BuildContext context) {
    final border= OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Color.fromARGB(255, 250, 250, 250),
                    width: 2.0,
                    style: BorderStyle.solid,
                    // strokeAlign: BorderSide.strokeAlignOutside
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
            const Text('0',
                style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                  color: const Color.fromARGB(255, 255, 255, 255),
                )),
            TextField(
              style: const TextStyle(
                color: Colors.white,
              ),
              decoration: const InputDecoration(
                // label:Text('Please enter the amount in INR',
                // style:TextStyle(
                //   color: Colors.white,
                // ),
                // ),
                // enabledBorder: OutlineInputBorder(
                //   borderSide: BorderSide(color: Colors.white),
                // ),
                // focusedBorder: OutlineInputBorder(
                //   borderSide: BorderSide(color: Colors.white),
                // ),

                hintText: 'Please enter the amount in INR',
                hintStyle: const TextStyle(
                  color: Colors.white,
                ),
                prefixIcon: Icon(Icons.monetization_on),
                prefixIconColor: Colors.white,
                filled: true,
                fillColor: Color.fromARGB(255, 39, 190, 213),
                focusedBorder:border,
                enabledBorder:border,
              
              ),
            ),
          ],
        ),
      ),
    );
  }
}
//parent widgets cannot be const