import 'package:flutter/material.dart';
import 'calculator_layout.dart'; // Import the new layout file
import 'package:flutter/services.dart';


void main() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent, // Makes the status bar transparent
      systemNavigationBarColor: Color.fromARGB(255,200,180,250), // Makes the status bar transparent
      statusBarIconBrightness: Brightness.dark, // Dark icons for light backgrounds
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      debugShowCheckedModeBanner: false,
      home: CalculatorLayout(), // Use the CalculatorLayout widget here
    );
  }
}
