import 'package:flutter/material.dart';
import 'package:kenvinorellana/common/gaps.dart';
import '/common/colors.dart';
import '/common/navigator.dart';
import '../../../common/custom_buttons.dart';

import 'splash_screen2.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // const SplashBackground(),
        // const SplashCircles(),
        // const SplashLogo(),
        Positioned.fill(
          child: Image.asset("assets/images/Splash_1.png", fit: BoxFit.cover),
        ),
        Positioned(
          left: 30,
          right: 30,
          bottom: 50,
          child: Column(
            children: [
              CustomButton(
                // width: 200,
                onTap: () =>
                    animatedNavigateReplaceAll(context, SplashScreen2()),
                text: 'Gets Stared',
              ),

              vPad15,
              vPad10,
              SizedBox(
                width: 55,
                height: 8,
                child: Row(
                  spacing: 8,
                  children: [
                    Expanded(
                      child: Container(
                        width: double.infinity,
                        height: double.infinity,
                        decoration: BoxDecoration(
                          color: customWhite,
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                    ),

                    CircleAvatar(
                      radius: 4.5,
                      foregroundColor: customWhite,
                      backgroundColor: customWhite,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        // Positioned(
        //   left: 173,
        //   top: 788,
        //   child: const PageIndicator(),
        // ),
      ],
    );
  }
}
