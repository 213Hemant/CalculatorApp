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
      displayText = handleButtonAction(
          displayText, value); // Update the display based on the action
    });
  }

  final deleteIcon = Icon(
    Icons.delete,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: const Text('Simple Calculator')),
      body: Container(
        decoration: BoxDecoration(
          gradient: Theme.of(context).brightness == Brightness.dark
              ? LinearGradient(
                  colors: [
                    Colors.black,
                    Colors.grey.shade800
                  ], // Dark mode colors
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                )
              : LinearGradient(
                  colors: [
                    Colors.white,
                    Color.fromARGB(255, 200, 180, 250)
                  ], // Light mode colors
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
        ),
        child: Column(
          children: [
            SizedBox(
              height: 300, // Adjust the height as needed
              child: Container(
                margin: const EdgeInsets.only(
                  top: 20, // Top margin
                  right: 14, // Right margin
                  bottom: 0, // Bottom margin
                  left: 14, // Left margin
                ),
                padding: const EdgeInsets.only(
                  top: 8, // Top padding inside the container
                  right: 8, // Right padding inside the container
                  bottom: 4, // Bottom padding inside the container
                  left: 8, // Left padding inside the container
                ),
                decoration: BoxDecoration(
                  color: Colors.transparent, // Transparent background
                  borderRadius: BorderRadius.circular(12), // Rounded corners
                  boxShadow: [
                    BoxShadow(
                      color: Colors
                          .transparent, // No shadow (or customize if needed)
                      blurRadius: 8,
                      offset: const Offset(4, 4), // Slight shadow offset
                    ),
                  ],
                ),
                width: double.infinity, // Ensure it takes full available width
                child: SingleChildScrollView(
                  reverse: true, // Makes the content scroll from bottom up
                  child: Align(
                    alignment:
                        Alignment.bottomRight, // Align the text to bottom-right
                    child: DisplayWidget(displayText: displayText),
                  ),
                ),
              ),
            ),
            Divider(
              height: 5,
              color: Colors.white30, // Line color
              thickness: 3.0, // Line thickness
              indent: 5.0, // Space from the left
              endIndent: 5.0, // Space from the right
            ),
            Expanded(
              child: GridView.count(
                crossAxisCount: 4, // 4 buttons per row
                children: [
                  ButtonWidget(
                      label: '(', onPressed: () => handleButtonPress('(')),
                  ButtonWidget(
                      label: ')', onPressed: () => handleButtonPress(')')),
                  ButtonWidget(
                      label: 'C', onPressed: () => handleButtonPress('C')),
                  ButtonWidget(
                      label: '/', onPressed: () => handleButtonPress('/')),
                  ButtonWidget(
                      label: '7', onPressed: () => handleButtonPress('7')),
                  ButtonWidget(
                      label: '8', onPressed: () => handleButtonPress('8')),
                  ButtonWidget(
                      label: '9', onPressed: () => handleButtonPress('9')),
                  ButtonWidget(
                      label: '*', onPressed: () => handleButtonPress('*')),
                  ButtonWidget(
                      label: '4', onPressed: () => handleButtonPress('4')),
                  ButtonWidget(
                      label: '5', onPressed: () => handleButtonPress('5')),
                  ButtonWidget(
                      label: '6', onPressed: () => handleButtonPress('6')),
                  ButtonWidget(
                      label: '-', onPressed: () => handleButtonPress('-')),
                  ButtonWidget(
                      label: '1', onPressed: () => handleButtonPress('1')),
                  ButtonWidget(
                      label: '2', onPressed: () => handleButtonPress('2')),
                  ButtonWidget(
                      label: '3', onPressed: () => handleButtonPress('3')),
                  ButtonWidget(
                      label: '+', onPressed: () => handleButtonPress('+')),
                  ButtonWidget(
                      label: '0', onPressed: () => handleButtonPress('0')),
                  ButtonWidget(
                      label: '.', onPressed: () => handleButtonPress('.')),
                  ButtonWidget(
                      label: 'DEL', onPressed: () => handleButtonPress('DEL')),
                  ButtonWidget(
                      label: '=', onPressed: () => handleButtonPress('=')),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
