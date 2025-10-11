import 'package:flutter/material.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF263133),
      body: Stack(
        children: [
          Positioned.fill(
            top: 0,
            bottom: 0,
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
                        // const SizedBox(width: 12),
                        IconButton(
                          onPressed: () => Navigator.of(context).pop(),
                          icon: const Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                          ),
                        ),
                        Expanded(
                          child: Center(
                            child: Text(
                              'Privacy Policy',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontFamily: 'Outfit',
                                fontWeight: FontWeight.w600,
                                // letterSpacing: -0.5,
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
                        child: Text(
                          'By using the Business Coach Chatbot, you agree to the following terms:\n'
                          '1. The chatbot provides general business guidance and advice but is not a substitute for professional consulting services.\n'
                          '2. We offer both free and paid subscription plans. Paid plans are billed on a recurring basis unless canceled.\n'
                          '3. User data is handled securely and in accordance with our Privacy Policy.\n'
                          '4. We are not responsible for decisions made based on the chatbot\'s advice or any resulting outcomes.\n'
                          '5. Misuse of the service or violation of these terms may result in termination of access.\n\n'
                          'By continuing to use the chatbot, you accept these terms. For questions, contact our support team.',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 13,
                            fontFamily: 'Outfit',
                            fontWeight: FontWeight.w400,
                            height: 1.5,
                          ),
                          textAlign: TextAlign.justify,
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
