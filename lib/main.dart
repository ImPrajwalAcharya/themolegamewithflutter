import 'package:flutter/material.dart';
import 'package:themole/screens/welcome_screen.dart';

void main() {
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'the mole',
      theme: ThemeData(
      colorScheme: Theme.of(context).colorScheme.copyWith(
        primary: Colors.green,
      )
      ),
      home: const WelcomeScreen(),
    );
  }
}
