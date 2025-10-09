import 'package:flutter/material.dart';
import 'package:kenvinorellana/common/gaps.dart';


class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF263133),
      body: Stack(
        children: [
          // Background image (top half)
          Positioned.fill(
            left: 0,
            top: 0,
            right: 0,
            child: Image.asset(
              'assets/images/ai_recommended_bg.png',
              fit: BoxFit.cover,
            ),
          ),
          // Back button
          Positioned(
            left: 12,
            top: 48,
            child: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.white,),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ),
          // Title
          Positioned(
            left: 0,
            right: 0,
            top: 60,
            child: Center(
              child: Text(
                'About Us',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontFamily: 'Outfit',
                  fontWeight: FontWeight.w600,
                  height: 0.71,
                  letterSpacing: -0.5,
                ),
              ),
            ),
          ),
          // Logo (as text)
          Positioned(
            left: 0,
            right: 0,
            top: 134,
            child: Column(
              children: [
                Text(
                  'KEVIN ORELLANA',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontFamily: 'Outfit',
                    fontWeight: FontWeight.w400,
                    letterSpacing: 3.5,
                  ),
                ),
             vPad10,
                Text(
                  'HEALTH  &  FITNESS  APP',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontFamily: 'Outfit',
                    fontWeight: FontWeight.w300,
                    letterSpacing: 2.5,
                  ),
                ),
              ],
            ),
          ),
          // Description
          Positioned(
            left: 41,
            top: 272,
            right: 41,
            child: SizedBox(
              width: 308,
              child: Text(
                'Hai aims to guide participants and those supporting them through the difficult and often confusing National Disability Insurance Scheme (NDIS) landscape. Hai is a personalised companion and assistant powered by Ai integration built to simplify the challenges of NDIS budget management and funding use. It has been trained on NDIS documentation!',
                textAlign: TextAlign.justify,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontFamily: 'Outfit',
                  fontWeight: FontWeight.w400,
                  height: 1.5,
                ),
              ),
            ),
          ),
          // Email
          Positioned(
            left: 46,
            top: 451,
            child: Row(
              children: [
                Icon(Icons.email, color: Colors.white, size: 20),
                SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Email',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontFamily: 'Outfit',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                   vPad5,
                    Text(
                      'Sam12345@gmail.com',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontFamily: 'Outfit',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          // Cell
          Positioned(
            left: 46,
            top: 503,
            child: Row(
              children: [
                Icon(Icons.phone, color: Colors.white, size: 20),
              hPad10,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Cell',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontFamily: 'Outfit',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                vPad5,
                    Text(
                      '+8801777890990',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontFamily: 'Outfit',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          // App Version
          Positioned(
            left: 46,
            top: 562,
            child: Row(
              children: [
                Container(
                  width: 21,
                  height: 21,
                  decoration: BoxDecoration(
                    color: const Color(0xFF1C96CC),
                    borderRadius: BorderRadius.circular(10.5),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    'i',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'App Version',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontFamily: 'Outfit',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 2),
                    Text(
                      '0.1',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontFamily: 'Outfit',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
} 