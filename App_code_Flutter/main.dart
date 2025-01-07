import 'package:flutter/material.dart';
import 'splash_screen.dart';


void main() {
  runApp(const ESPApp());
}

class ESPApp extends StatelessWidget {
  const ESPApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ESP Relay Control',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const SplashScreen(),
    );
  }
}
