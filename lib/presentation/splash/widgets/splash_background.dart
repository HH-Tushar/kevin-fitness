import 'package:flutter/material.dart';

class SplashBackground extends StatelessWidget {
  const SplashBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Background image (now using asset)
        Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/splash_2bg.png"),
              fit: BoxFit.cover,
            ),
          ),
        ),
        // Overlay
        Opacity(
          opacity: 0.6,
          child: Container(
            width: double.infinity,
            height: double.infinity,
            color: const Color(0xFF080B1C),
          ),
        ),

        // Gradient bottom
        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          child: Container(
            // width: 402,
            height: 400,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment(0.50, -0.00),
                end: Alignment(0.50, 1.00),
                colors: [
                  Color(0x23141414),
                  // Color(0x7A080B1C),
                  Color(0xFF080B1C),
                  Color(0xFF080B1C),
                  Color(0xFF080B1C),
                  Color(0xFF080B1C),
                  Color(0xFF080B1C),
                  Colors.black,
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
