import 'package:flutter/material.dart';
import 'package:kenvinorellana/common/colors.dart';
import 'package:kenvinorellana/common/gaps.dart';

class HelpAndSupportScreen extends StatefulWidget {
  const HelpAndSupportScreen({super.key});

  @override
  State<HelpAndSupportScreen> createState() => _HelpAndSupportScreenState();
}

class _HelpAndSupportScreenState extends State<HelpAndSupportScreen> {
  bool isLoading = false;

  void sendMail() {}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/ai_recommended_bg.png',
              fit: BoxFit.cover,
            ),
          ),

          Positioned.fill(
            // left: 0,
            child: SafeArea(
              child: Column(
                children: [
                  Row(
                    children: [
                      // const SizedBox(width: 12),
                      hPad5,
                      IconButton(
                        onPressed: () => Navigator.of(context).pop(),
                        icon: const Icon(Icons.arrow_back, color: Colors.white),
                      ),
                      Expanded(
                        child: Center(
                          child: Text(
                            'Help & Support',
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
                  vPad15,
                  Expanded(
                    child: SingleChildScrollView(
                      padding: EdgeInsets.symmetric(horizontal: defaultPadding),
                      child: Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(16.0),
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
                            child: TextField(
                              maxLines: null,
                              minLines: 7,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontFamily: 'Poppins',
                              ),
                              decoration: InputDecoration(
                                border: InputBorder.none,

                                // hintText: LocalizationService.getText('help_support.describe_problem', languageCode: currentLanguage).startsWith('help_support.') ? 'Describe Your Problem' : LocalizationService.getText('help_support.describe_problem', languageCode: currentLanguage),
                                hintStyle: TextStyle(
                                  color: const Color(0xFFA0A0A6),
                                  fontSize: 16,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w400,
                                ),
                                isDense: true,
                                contentPadding: EdgeInsets.zero,
                                // errorText: showError && problem.trim().isEmpty ? (LocalizationService.getText('help_support.required_field', languageCode: currentLanguage).startsWith('help_support.') ? 'This field is required' : LocalizationService.getText('help_support.required_field', languageCode: currentLanguage)) : null,
                                errorStyle: TextStyle(
                                  color: Colors.redAccent,
                                  fontSize: 12,
                                ),
                              ),
                              onChanged: (value) {
                                // ref.read(_problemProvider.notifier).state = value;
                                // if (showError && value.trim().isNotEmpty) {
                                //   ref.read(_showErrorProvider.notifier).state = false;
                                // }
                              },
                            ),
                          ),

                          vPad20,
                          ElevatedButton(
                            onPressed: isLoading ? null : sendMail,
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.zero,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6),
                              ),
                              elevation: 0,
                              backgroundColor: Colors.transparent,
                              shadowColor: Colors.transparent,
                            ),
                            child: Ink(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: const Alignment(-0.22, -0.21),
                                  end: const Alignment(1.20, 1.22),
                                  colors: [
                                    Colors.white,
                                    const Color(0xFF3A4646),
                                  ],
                                ),
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: Container(
                                alignment: Alignment.center,
                                height: 50,
                                child: isLoading
                                    ? SizedBox(
                                        width: 24,
                                        height: 24,
                                        child: CircularProgressIndicator(
                                          strokeWidth: 2,
                                          valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                                const Color(0xFF263133),
                                              ),
                                        ),
                                      )
                                    : Text(
                                        "Send",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: const Color(0xFF263133),
                                          fontSize: 18,
                                          fontFamily: 'Outfit',
                                          fontWeight: FontWeight.w700,
                                          height: 0.96,
                                          letterSpacing: -0.46,
                                        ),
                                      ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
