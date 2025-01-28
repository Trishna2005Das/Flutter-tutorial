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
  final TextEditingController controller = TextEditingController();
  String selectedCurrency = 'usd';
  Map<String, dynamic> conversionRates = {};

  @override
  void initState() {
    super.initState();
    fetchConversionRates();
  }

  Future<void> fetchConversionRates() async {
    final response = await http.get(Uri.parse(
        'https://cdn.jsdelivr.net/npm/@fawazahmed0/currency-api@latest/v1/currencies/$selectedCurrency.json'));
    if (response.statusCode == 200) {
      setState(() {
        conversionRates = json.decode(response.body)[selectedCurrency];
      });
    } else {
      throw Exception('Failed to load conversion rates');
    }
  }

  void convert() {
    if (conversionRates.isNotEmpty) {
      double amount = double.parse(controller.text);
      setState(() {
        result = amount * conversionRates['inr'];
      });
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
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'INR ${result != 0 ? result.toStringAsFixed(2) : result.toStringAsFixed(0)}',
                style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
              ),
              DropdownButton<String>(
                value: selectedCurrency,
                onChanged: (String? newValue) {
                  setState(() {
                    selectedCurrency = newValue!;
                    fetchConversionRates();
                  });
                },
                items: <String>['usd', 'eur', 'gbp', 'jpy']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(
                      value.toUpperCase(),
                      style: TextStyle(color: Colors.white),
                    ),
                  );
                }).toList(),
              ),
              TextField(
                controller: controller,
                style: const TextStyle(
                  color: Colors.white,
                ),
                decoration: InputDecoration(
                  hintText: 'Please enter the amount in $selectedCurrency',
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
              const SizedBox(height: 10),
              TextButton(
                onPressed: convert,
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
              )
            ],
          ),
        ),
      ),
    );
  }
}