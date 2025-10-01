import 'package:flutter/material.dart';



class SplashLogo extends StatelessWidget {
  const SplashLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 43,
      top: 389,
      child: Container(
        width: 316,
        height: 150,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/splash_logo.png"),
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
} 