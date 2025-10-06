import 'package:flutter/material.dart';
import '/common/colors.dart';
import '/common/navigator.dart';

import '../../../common/custom_buttons.dart';

import '../../auth/view/login_screen.dart';

class SplashScreen2 extends StatelessWidget {
  const SplashScreen2({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Background image (replace with asset)
        //   Container(
        //     width: 402,
        //     height: 640,
        //     decoration: BoxDecoration(
        //       image: DecorationImage(
        //         image: AssetImage("assets/images/splash_2bg.png"),
        //         fit: BoxFit.cover,
        //       ),
        //     ),
        //   ),
        //   // Overlay
        //   Opacity(
        //     opacity: 0.71,
        //     child: Container(
        //       width: 402,
        //       height: 874,
        //       color: const Color(0xFF080B1C),
        //     ),
        //   ),
        //   // Gradient and content
        //   Positioned(
        //     left: 0,
        //     top: 484,
        //     child: SizedBox(
        //       width: 402,
        //       height: 390,
        //       child: Stack(
        //         children: [
        //           // Gradient
        //           Container(
        //             width: 402,
        //             height: 390,
        //             decoration: const BoxDecoration(
        //               gradient: LinearGradient(
        //                 begin: Alignment(0.50, -0.00),
        //                 end: Alignment(0.50, 1.00),
        //                 colors: [
        //                   Color(0x23141414),
        //                   Color(0x7A080B1C),
        //                   Color(0xFF080B1C),
        //                   Color(0xFF080B1C),
        //                 ],
        //               ),
        //             ),
        //           ),
        //           // Title

        //           // Page Indicator
        //           // Positioned(
        //           //   left: 173,
        //           //   top: 304,
        //           //   child: const PageIndicator2(),
        //           // ),
        //         ],
        //       ),
        //     ),
        //   ),
        Positioned.fill(
          child: Image.asset("assets/images/splash_2.jpg", fit: BoxFit.cover),
        ),
        Positioned(
          bottom: 50,
          left: 30,
          right: 30,
          child: Column(
            spacing: 25,
            children: [
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'An AI Powered',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 42,
                        fontFamily: 'Outfit',
                        fontWeight: FontWeight.w600,
                        height: 1.14,
                        decoration: TextDecoration.none,
                      ),
                    ),
                    TextSpan(
                      text: ' \nFitness Coaching',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 42,
                        fontFamily: 'Outfit',
                        fontWeight: FontWeight.w600,
                        height: 1.14,
                        decoration: TextDecoration.none,
                      ),
                    ),
                  ],
                ),
              ),
              // Description
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Text(
                  'Your high-protein diet and workout plans will generate by AI\nadapting automatically based on  feedback and progress updates.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontFamily: 'Outfit',
                    fontWeight: FontWeight.w400,
                    decoration: TextDecoration.none,
                  ),
                ),
              ),
              // Button
              CustomButton(
                text: "Let's Go",
                onTap: () => navigateTo(context, LoginScreen()),
              ),
              // vPad15,
              SizedBox(
                width: 55,
                height: 8,
                child: Row(
                  spacing: 8,
                  children: [
                    CircleAvatar(
                      radius: 4.5,
                      foregroundColor: customWhite,
                      backgroundColor: customWhite,
                    ),
                    Expanded(
                      child: Container(
                        width: double.infinity,
                        height: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: customWhite,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
