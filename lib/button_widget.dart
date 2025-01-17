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
        color: Theme.of(context).brightness == Brightness.dark
            ? Colors.grey.shade800 // Dark theme button color
            : Colors.grey.shade100, // Light theme button color
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).brightness == Brightness.dark
                ? Colors.black45 // Dark shadow for dark theme
                : Colors.grey.shade400, // Light shadow for light theme
            blurRadius: 7,
            offset: const Offset(2, 8), // Subtle shadow offset
          ),
          BoxShadow(
            color: Theme.of(context).brightness == Brightness.dark
                ? Colors.black26 // Highlight effect for dark theme
                : const Color.fromARGB(255, 255, 255, 255), // Highlight effect
            blurRadius: 2,
            offset: const Offset(-2, -2),
          ),
        ],
      ),
      child: InkWell(
        onTap: onPressed,
        borderRadius:
            BorderRadius.circular(50), // Ensures ripple effect is circular
        child: Container(
          height: 70, // Adjust the size of the button
          width: 70,
          alignment: Alignment.center,
          child: Text(
            label,
            style: GoogleFonts.poppins(
              fontSize: 26,
              fontWeight: FontWeight.w400,
              color: Theme.of(context).brightness == Brightness.dark
                  ? Colors.white // Light text for dark theme
                  : Colors.black, // Dark text for light theme
            ),
          ),
        ),
      ),
    );
  }
}
