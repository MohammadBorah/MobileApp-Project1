import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Unit Converter',
      theme: ThemeData(
        primarySwatch: Colors.cyan,
      ),
      home: ConverterScreen(),
    );
  }
}

class ConverterScreen extends StatefulWidget {
  @override
  _ConverterScreenState createState() => _ConverterScreenState();
}

class _ConverterScreenState extends State<ConverterScreen> {
  TextEditingController inputController = TextEditingController();
  String output = '';
  String selectedUnit = 'Fahrenheit to Celsius';

  void convert() {
    double inputValue = double.tryParse(inputController.text) ?? 0;

    switch (selectedUnit) {
      case 'Fahrenheit to Celsius':
        output = ((inputValue - 32) * 5 / 9).toStringAsFixed(2) ;
        break;
      case 'Celsius to Fahrenheit':
        output = ((inputValue * 9 / 5) + 32).toStringAsFixed(2);
        break;
      case 'Inch to Centimeter':
        output = (inputValue * 2.54).toStringAsFixed(2);
        break;
      case 'Centimeter to Inch':
        output = (inputValue / 2.54).toStringAsFixed(2);
        break;
      case 'Feet to Meter':
        output = (inputValue * 0.3048).toStringAsFixed(2);
        break;
      case 'Meter to Feet':
        output = (inputValue / 0.3048).toStringAsFixed(2);
        break;
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Unit Converter By Moe Borah'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: inputController,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              decoration: InputDecoration(
                labelText: 'Enter value',
              ),
            ),
            SizedBox(height: 16.0),
            DropdownButton<String>(
              value: selectedUnit,
              onChanged: (String? newValue) {
                setState(() {
                  selectedUnit = newValue!;
                });
              },
              items: <String>[
                'Fahrenheit to Celsius',
                'Celsius to Fahrenheit',
                'Inch to Centimeter',
                'Centimeter to Inch',
                'Feet to Meter',
                'Meter to Feet',
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: convert,
              child: Text('Convert'),
            ),
            SizedBox(height: 16.0),
            Text(
              'Result: $output',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
