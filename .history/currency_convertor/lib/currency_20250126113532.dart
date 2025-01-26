import 'package:flutter/material.dart';

//1.Create a variable that dstores the currency value
//2.Create a function that converts the currency
//3.Display the value of the variable we created
//4.Display the variable

class Currency extends StatefulWidget {
  const Currency({super.key});

  @override
  State<Currency> createState() => _CurrencyState();
}

class _CurrencyState extends State<Currency> {
  double result = 0;
  final TextEditingController controller = TextEditingController();
  void convert() {
    result = (double.parse(controller.text) * 86.5);
    setState(() {});
  }

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
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
        title: const Text(
          'Currency Converter',
          style: TextStyle(
            color: Color.fromARGB(255, 255, 255, 255),
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'INR $result',
              style: TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 255, 255, 255),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: controller,
                style: const TextStyle(
                  color: Colors.white,
                ),
                decoration: InputDecoration(
                  hintText: 'Please enter the amount in USD',
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
              child: TextButton(
                //returns void
                onPressed: convert, //cannot call convert() as it is a function of void type so if we call the 
                //when we pass a function as parameter so we cannot make TextButton const widget even though it has a const constructor
                style: TextButton.styleFrom(
                  backgroundColor: Colors.lightGreen,
                  foregroundColor: Colors.white,
                  minimumSize: Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
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
// class CurrencyConverter extends StatelessWidget { //statelss widget is immutable
  

//   @override
  
// }

 //3 types of mode in flutter
  //debug,release,profile
  //debug->debug mode-it is the default mode 
  //release->release mode- it is the production mode
  //profile->profile mode  - it is the development mode        