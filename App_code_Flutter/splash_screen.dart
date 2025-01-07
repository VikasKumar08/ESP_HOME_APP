// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'esp_home.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const ESPHome()),
      );
    });

    return const Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "BACHIDA VENTURES",
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            //SizedBox(height: 10),
            //CircularProgressIndicator(color: Colors.white),
          ],
        ),
      ),
    );
  }
}
