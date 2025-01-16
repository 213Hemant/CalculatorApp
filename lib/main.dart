import 'package:flutter/material.dart';
import 'calculator_layout.dart'; // Import the new layout file

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      home: CalculatorLayout(), // Use the CalculatorLayout widget here
    );
  }
}
