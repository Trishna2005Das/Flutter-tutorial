import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class CurrencyConverter extends StatefulWidget {
  const CurrencyConverter({super.key});

  @override
  State<CurrencyConverter> createState() => _CurrencyConverterState();
}

class _CurrencyConverterState extends State<CurrencyConverter> {
  final TextEditingController controller = TextEditingController();
  String selectedCurrency = 'usd';
  String targetCurrency = 'inr';
  double conversionRate = 0;
  double result = 0;

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
        print('Conversion rate fetched: $conversionRate');
      } else {
        print('Failed to fetch conversion rate. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching conversion rate: $e');
    }
  }

  void convert() {
    setState(() {
      double input = double.tryParse(controller.text) ?? 0;
      if (conversionRate > 0) {
        result = input * conversionRate;
        print('Input: $input, Conversion Rate: $conversionRate, Result: $result');
      } else {
        result = 0;
        print('Conversion rate is zero or invalid.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final border = OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.white, width: 2.0),
      borderRadius: const BorderRadius.all(Radius.circular(60)),
    );

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          'Currency Converter',
          style: TextStyle(color: Colors.white),
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
                result > 0
                    ? '${targetCurrency.toUpperCase()} ${result.toStringAsFixed(2)}'
                    : 'Enter valid input and select currencies',
                style: const TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              TextField(
                controller: controller,
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: 'Enter amount in $selectedCurrency',
                  hintStyle: const TextStyle(color: Colors.white),
                  prefixIcon: const Icon(Icons.monetization_on, color: Colors.white),
                  filled: true,
                  fillColor: const Color.fromARGB(255, 39, 190, 213),
                  focusedBorder: border,
                  enabledBorder: border,
                ),
                keyboardType: const TextInputType.numberWithOptions(decimal: true),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  DropdownButton<String>(
                    value: selectedCurrency,
                    dropdownColor: Colors.black,
                    items: ['usd', 'eur', 'gbp'].map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value.toUpperCase(),
                          style: const TextStyle(color: Colors.white),
                        ),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedCurrency = value ?? 'usd';
                        fetchConversionRate();
                      });
                    },
                  ),
                  const SizedBox(width: 20),
                  DropdownButton<String>(
                    value: targetCurrency,
                    dropdownColor: Colors.black,
                    items: ['inr', 'usd', 'eur'].map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value.toUpperCase(),
                          style: const TextStyle(color: Colors.white),
                        ),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        targetCurrency = value ?? 'inr';
                        fetchConversionRate();
                      });
                    },
                  ),
                ],
              ),
              const SizedBox(height: 20),
              TextButton(
                onPressed: convert,
                style: TextButton.styleFrom(
                  backgroundColor: Colors.lightGreen,
                  foregroundColor: Colors.white,
                  minimumSize: const Size(double.infinity, 50),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
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