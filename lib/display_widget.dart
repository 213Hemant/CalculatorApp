// import 'package:flutter/material.dart';

// class DisplayWidget extends StatelessWidget {
//   final String displayText;

//   const DisplayWidget({required this.displayText, super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(20.0),
//       child: Text(
//         displayText,
//         style: const TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
//         textAlign: TextAlign.right,
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DisplayWidget extends StatelessWidget {
  final String displayText;

  const DisplayWidget({required this.displayText, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Text(
        displayText,
        style: GoogleFonts.poppins(  // Apply Google font (Roboto in this case)
          fontSize: 36,  // Font size
          color: const Color.fromARGB(233, 75, 4, 97),  // Text color
          fontWeight: FontWeight.w400,  // Font weight
          letterSpacing: 1.2,  // Adjust letter spacing
          height: 1.3,  // Adjust line height if you want more vertical spacing
        ),
        textAlign: TextAlign.right,  // Align the text to the right
      ),
    );
  }
}
