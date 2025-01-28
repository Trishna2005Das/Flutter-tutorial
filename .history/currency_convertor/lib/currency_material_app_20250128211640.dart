import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Currency extends StatefulWidget {
  const Currency({super.key});

  @override
  State<Currency> createState() => _CurrencyState();
}

class _CurrencyState extends State<Currency> {
  double result = 0;
  double conversionRate = 0;
  final TextEditingController controller = TextEditingController();
  String selectedCurrency = 'usd'; // Default source currency
  String targetCurrency = 'inr'; // Default target currency
  
  @override
  void initState() {
    super.initState();
    fetchConversionRate(); // Fetch initial conversion rate
  }

  Future<void> fetchConversionRate() async {
    final url =
        'https://cdn.jsdelivr.net/npm/@fawazahmed0/currency-api@latest/v1/currencies/$selectedCurrency/$targetCurrency.json';
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        setState(() {
          conversionRate = data[targetCurrency] ?? 0;
        });
      } else {
        print('Failed to fetch conversion rate');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final border = OutlineInputBorder(
      borderSide: const BorderSide(
        color: Color.fromARGB(255, 250, 250, 250),
        width: 2.0,
        style: BorderStyle.solid,
      ),
      borderRadius: const BorderRadius.all(
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
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '${targetCurrency.toUpperCase()} ${result.toStringAsFixed(2)}',
                style: const TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              TextField(
                controller: controller,
                style: const TextStyle(
                  color: Colors.white,
                ),
                decoration: InputDecoration(
                  hintText: 'Enter amount in ${selectedCurrency.toUpperCase()}',
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
                keyboardType: const TextInputType.numberWithOptions(
                  decimal: true,
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  DropdownButton<String>(
                    value: selectedCurrency,
                    dropdownColor: Colors.black,
                    style: const TextStyle(color: Colors.white),
                    items: const [
                      DropdownMenuItem(value: 'usd', child: Text('USD')),
                      DropdownMenuItem(value: 'inr', child: Text('INR')),
                      DropdownMenuItem(value: 'eur', child: Text('EUR')),
                      DropdownMenuItem(value: 'gbp', child: Text('GBP')),
                    ],
                    onChanged: (value) {
                      if (value != null) {
                        setState(() {
                          selectedCurrency = value;
                          fetchConversionRate();
                          result = 0; // Reset result when currency changes
                        });
                      }
                    },
                  ),
                  DropdownButton<String>(
                    value: targetCurrency,
                    dropdownColor: Colors.black,
                    style: const TextStyle(color: Colors.white),
                    items: const [
                      DropdownMenuItem(value: 'usd', child: Text('USD')),
                      DropdownMenuItem(value: 'inr', child: Text('INR')),
                      DropdownMenuItem(value: 'eur', child: Text('EUR')),
                      DropdownMenuItem(value: 'gbp', child: Text('GBP')),
                    ],
                    onChanged: (value) {
                      if (value != null) {
                        setState(() {
                          targetCurrency = value;
                          fetchConversionRate();
                          result = 0; // Reset result when currency changes
                        });
                      }
                    },
                  ),
                ],
              ),
              const SizedBox(height: 10),
              TextButton(
                onPressed: convert,
                style: TextButton.styleFrom(
                  backgroundColor: Colors.lightGreen,
                  foregroundColor: Colors.white,
                  minimumSize: const Size(double.infinity, 50),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                ),
                child: const Text('Convert'),
              ),
            ],
          ),
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