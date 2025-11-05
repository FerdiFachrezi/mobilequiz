import 'package:flutter/material.dart';
import './welcome_screen.dart'; // Import the new welcome screen

void main() => runApp(const MyApp());

// MyApp can now be a StatelessWidget since the state is managed
// in other screens.
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Hides the debug banner
      title: 'Flutter Quiz App',
      // 5. Apply the custom font theme globally
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        fontFamily: 'Montserrat',
        textTheme: const TextTheme(
          // Default text style for the app
          bodyMedium: TextStyle(fontSize: 16.0),
          // Style for headlines or titles
          displayLarge: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
          ),
          // Style for buttons
          labelLarge: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      // 2. Start the app on the new WelcomeScreen
      home: WelcomeScreen(),
    );
  }
}