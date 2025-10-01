import 'package:flutter/material.dart';

class SplashCircles extends StatelessWidget {
  const SplashCircles({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          left: 379,
          top: 859,
          child: Transform.rotate(
            angle: -2.76,
            child: Container(
              width: 846,
              height: 846,
              decoration: ShapeDecoration(
                shape: OvalBorder(
                  side: BorderSide(
                    width: 1.5,
                    color: const Color(0xFF767781),
                  ),
                ),
              ),
            ),
          ),
        ),
        Positioned(
          left: 179,
          top: 240,
          child: Transform.rotate(
            angle: 0.67,
            child: Container(
              width: 393.50,
              height: 393.50,
              decoration: ShapeDecoration(
                shape: OvalBorder(
                  side: BorderSide(
                    width: 1.5,
                    color: const Color(0xFF767781),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
} 