import 'package:flutter/material.dart';
import 'signin.dart';
import 'constants.dart';
import 'home_screen.dart';
import 'login_screen.dart';
import 'package:firebase_core/firebase_core.dart';

/* void main() {
  runApp(InitialScreen());
}*/

void main() async {
  WidgetsFlutterBinding
      .ensureInitialized(); // Ensures all bindings are initialized
  await Firebase.initializeApp(); // Initialize Firebase
  runApp(InitialScreen());
}

class InitialScreen extends StatelessWidget {
  const InitialScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginScreen(),
      title: appName,
      debugShowCheckedModeBanner: false,
    );
  }
}

// uEpV9tS5eGdKHwkFBV474zRasX42
// YjBgs2SWWgT5zHBme1C6rFWolqS2
// cFjXl5wlvfeKT6u9gO9V0zC8ogK2
