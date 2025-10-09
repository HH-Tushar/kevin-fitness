import 'package:flutter/material.dart';
import 'package:kenvinorellana/common/gaps.dart';

class TermsConditionsScreen extends StatelessWidget {
  const TermsConditionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF263133),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/ai_recommended_bg.png',
              fit: BoxFit.cover,
            ),
          ),
          SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 0),
                child: Column(
                  children: [
                    // const SizedBox(height: 32),
                    Row(
                      children: [
                        hPad5,
                        IconButton(
                          onPressed: () => Navigator.of(context).pop(),
                          icon: const Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                            // size: 22,
                          ),
                        ),
                        Expanded(
                          child: Center(
                            child: Text(
                              'Terms & Conditions',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontFamily: 'Outfit',
                                fontWeight: FontWeight.w600,
                                letterSpacing: -0.5,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 34),
                      ],
                    ),
                    const SizedBox(height: 28),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: const Color(0xFF2D393A),
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0x26000000),
                              blurRadius: 4,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        padding: const EdgeInsets.symmetric(
                          vertical: 24,
                          horizontal: 18,
                        ),
                        child: RichText(
                          text: TextSpan(
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 13,
                              fontFamily: 'Outfit',
                              fontWeight: FontWeight.w400,
                              height: 1.5,
                            ),
                            children: [
                              const TextSpan(
                                text:
                                    'By using the Fitness Coach Chatbot (“Service”), you agree to the following terms:\n',
                              ),
                              const TextSpan(
                                text:
                                    '1. General Guidance\n   The chatbot offers general fitness and wellness advice. It is not a substitute for professional medical or fitness consultation.\n',
                              ),
                              const TextSpan(
                                text:
                                    '2. Subscription Plans\n   We offer free and paid subscription plans. Paid plans are billed on a recurring basis and renew automatically unless canceled before the billing cycle ends.\n',
                              ),
                              const TextSpan(
                                text:
                                    '3. User Responsibility\n   Use of the chatbot\'s advice is at your own risk. Always consult a doctor or certified trainer before starting any new fitness program. We are not responsible for any health issues or injuries resulting from the use of this Service.\n',
                              ),
                              const TextSpan(
                                text:
                                    '4. Privacy\n   Your data is securely handled in accordance with our ',
                              ),
                              TextSpan(
                                text: 'Privacy Policy',
                                style: const TextStyle(
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                              const TextSpan(
                                text:
                                    '. By using the Service, you consent to these practices.\n',
                              ),
                              const TextSpan(
                                text:
                                    '5. Misuse & Termination\n   Abuse of the Service or violations of these terms may lead to suspension or termination without notice.\n',
                              ),
                              const TextSpan(
                                text:
                                    "6. Acceptance\n   By continuing to use the Fitness Coach Chatbot, you confirm that you've read, understood, and agree to these terms.\n",
                              ),
                              const TextSpan(
                                text:
                                    '7. Contact\n   Questions? Reach out to our support team at [insert contact email].',
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
