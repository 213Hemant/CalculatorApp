import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/services.dart';
import 'calculator_layout.dart'; // Your calculator layout widget

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Use addPostFrameCallback to ensure the system UI settings are applied after the widget is built
    WidgetsBinding.instance.addPostFrameCallback((_) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarColor:
              Colors.transparent, // Makes the status bar transparent
          systemNavigationBarColor:
              MediaQuery.of(context).platformBrightness == Brightness.dark
                  ? Colors.grey.shade900 // Dark mode navigation bar color
                  : Color.fromARGB(255, 200, 180, 250), // Light mode navigation bar color

          statusBarIconBrightness:
              MediaQuery.of(context).platformBrightness == Brightness.dark
                  ? Brightness.light // Light icons for dark background
                  : Brightness.dark, // Dark icons for light background

          systemNavigationBarIconBrightness:
              MediaQuery.of(context).platformBrightness == Brightness.dark
                  ? Brightness.light // Light icons in dark mode
                  : Brightness.dark, // Dark icons in light mode
        ),
      );
    });

    return MaterialApp(
      title: 'Calculator',
      themeMode: ThemeMode
          .system, // Automatically switch themes based on system settings
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // Light mode theme settings
        brightness: Brightness.light,
        primarySwatch: Colors.deepPurple,
        scaffoldBackgroundColor: Colors.white, // Light mode background color
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: GoogleFonts
            .poppinsTextTheme(), // Consistent text theme across the app
      ),
      darkTheme: ThemeData(
        // Dark mode theme settings
        brightness: Brightness.dark,
        primarySwatch: Colors.deepPurple,
        scaffoldBackgroundColor: Colors.black, // Dark mode background color
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: GoogleFonts
            .poppinsTextTheme(), // Consistent text theme across the app
      ),
      home: CalculatorLayout(), // Your main calculator layout
    );
  }
}
