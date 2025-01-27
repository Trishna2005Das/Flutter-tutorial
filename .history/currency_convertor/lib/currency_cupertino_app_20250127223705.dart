import 'package:flutter/cupertino.dart';

class CurrencyConverterCupertino extends StatefulWidget {
  const CurrencyConverterCupertino({super.key});

  @override
  State<CurrencyConverterCupertino> createState() => _CurrencyConverterCupertinoState();
}

class _CurrencyConverterCupertinoState extends State<CurrencyConverterCupertino> {
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

    return CupertinoPageScaffold(
      backgroundColor: CupertinoColors.black,
      navigationBar: CupertinoNavigationBar(
        backgroundColor:  CupertinoColors.black,
        middle: const Text(
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
                'INR ${result!=0?result.toStringAsFixed(2): result.toStringAsFixed(0)}',
                style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
              ),
          
              CupertinoTextField(
                controller: controller,
                style: const TextStyle(
                  color: CupertinoColors.white,
                ),
                decoration: BoxDecoration(
    color: const Color.fromARGB(255, 39, 190, 213),
    border: Border.all(color: CupertinoColors.white, width: 2),
    borderRadius: BorderRadius.circular(8),
  ),
  placeholder: 'please entr the amount in usd',
  prefix: const Icon(CupertinoIcons.money_dollar),
                keyboardType: TextInputType.numberWithOptions(
                  decimal: true,
                ),
              ),
              //button=raised and appears like a text
              //appears like a text
              // Container( //container does not have a constant constructor so it is rebuilt everytime
              //   height: 10,
              // ),
              const SizedBox(height: 10),
              CupertinoButton(
                //returns void
                onPressed:
                    convert, //cannot call convert() as it is a function of void type so if we call the function you return a type of void and we cannot assign void
                //when we pass a function as parameter so we cannot make TextButton const widget even though it has a const constructor
              color: Cup
                child: Text('Convert'),
              )
            ],
          ),
        ),
      ),
    );
  }
}