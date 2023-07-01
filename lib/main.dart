// Import the material design library from Flutter
import 'package:flutter/material.dart';
// Import the home screen from the local package
import 'package:flutter_proxigo_v1/screens/home.dart';

// The main function is the entry point of the application
void main() {
  // Ensure that widget bindings are properly initialized
  WidgetsFlutterBinding.ensureInitialized();
  // Run the MyApp widget, which is the root of the application
  runApp(const MyApp());
}

// MyApp is a StatelessWidget, meaning it does not have mutable state
class MyApp extends StatelessWidget {
  // Constructor for MyApp, taking an optional Key parameter
  const MyApp({super.key});

  // Build method to describe how to display this widget
  @override
  Widget build(BuildContext context) {
    // Return a MaterialApp, which serves as the root of the app's widget tree
    return const MaterialApp(
      // Set the title of the app
      title: "Profile",
      // Set the home screen of the app to be an instance of Home
      home: Home(),
    );
  }
}
