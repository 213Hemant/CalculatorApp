import 'package:flutter/material.dart';

class DisplayWidget extends StatelessWidget {
  final String displayText;

  const DisplayWidget({required this.displayText, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Text(
        displayText,
        style: const TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
        textAlign: TextAlign.right,
      ),
    );
  }
}
