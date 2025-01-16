import 'package:flutter/material.dart';
import 'button_widget.dart'; // Import the button widget
import 'display_widget.dart'; // Import the display widget
import 'calculator_logic.dart'; // Import the calculator logic

class CalculatorLayout extends StatefulWidget {
  const CalculatorLayout({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CalculatorLayoutState createState() => _CalculatorLayoutState();
}

class _CalculatorLayoutState extends State<CalculatorLayout> {
  String displayText = ""; // To hold the current input and result

  // Function to handle button presses
  void handleButtonPress(String value) {
    setState(() {
      displayText = handleButtonAction(displayText, value); // Update the display based on the action
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Simple Calculator')),
      body: Column(
        children: [
          DisplayWidget(displayText: displayText), // Display area
          Expanded(
            child: GridView.count(
              crossAxisCount: 4, // 4 buttons per row
              children: [
                ButtonWidget(label: '(', onPressed: () => handleButtonPress('(')),
                ButtonWidget(label: ')', onPressed: () => handleButtonPress(')')),
                ButtonWidget(label: 'C', onPressed: () => handleButtonPress('C')),
                ButtonWidget(label: '/', onPressed: () => handleButtonPress('/')),
                ButtonWidget(label: '7', onPressed: () => handleButtonPress('7')),
                ButtonWidget(label: '8', onPressed: () => handleButtonPress('8')),
                ButtonWidget(label: '9', onPressed: () => handleButtonPress('9')),
                ButtonWidget(label: '*', onPressed: () => handleButtonPress('*')),
                ButtonWidget(label: '4', onPressed: () => handleButtonPress('4')),
                ButtonWidget(label: '5', onPressed: () => handleButtonPress('5')),
                ButtonWidget(label: '6', onPressed: () => handleButtonPress('6')),
                ButtonWidget(label: '-', onPressed: () => handleButtonPress('-')),
                ButtonWidget(label: '1', onPressed: () => handleButtonPress('1')),
                ButtonWidget(label: '2', onPressed: () => handleButtonPress('2')),
                ButtonWidget(label: '3', onPressed: () => handleButtonPress('3')),
                ButtonWidget(label: '+', onPressed: () => handleButtonPress('+')),
                ButtonWidget(label: '0', onPressed: () => handleButtonPress('0')),
                ButtonWidget(label: '.', onPressed: () => handleButtonPress('.')),
                ButtonWidget(label: '⬅', onPressed: () => handleButtonPress('DEL')),
                ButtonWidget(label: '=', onPressed: () => handleButtonPress('=')),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
