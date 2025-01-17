import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class ButtonWidget extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;

  const ButtonWidget({required this.label, required this.onPressed, super.key});

@override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8), // Margin around each button for spacing
      decoration: BoxDecoration(
        shape: BoxShape.circle, // Makes the button circular
        color: Colors.grey.shade100, // Light button color
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade400, // Slight shadow for a lifted effect
            blurRadius: 7,
            offset: const Offset(2, 8), // Subtle shadow offset
          ),
          BoxShadow(
            color: const Color.fromARGB(255, 255, 255, 255), // Highlight effect
            blurRadius: 2,
            offset: const Offset(-2, -2),
          ),
        ],
      ),
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(50), // Ensures ripple effect is circular
        child: Container(
          height: 70, // Adjust the size of the button
          width: 70,
          alignment: Alignment.center,
          child: Text(
            label,
            style: GoogleFonts.poppins(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.deepPurple, // Dark text for contrast
            ),
          ),
        ),
      ),
    );
  }
}