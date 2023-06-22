import 'package:flutter/material.dart';
import 'package:quotation/utils/my_strings.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          splashImg,
          height: 100,
          width: 100,
        ),
      ),
    );
  }
}
