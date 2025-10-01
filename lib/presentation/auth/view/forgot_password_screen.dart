import 'package:flutter/material.dart';
import 'package:kenvinorellana/common/app_bars.dart';
import 'package:kenvinorellana/common/gaps.dart';
import 'package:kenvinorellana/common/navigator.dart';
import 'package:kenvinorellana/common/snack_bar.dart';

import '../../../application/auth/auth_repo.dart';
import '../../../common/custom_buttons.dart';
import 'otp_verification_screen.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  bool isLoading = false;
  final emailController = TextEditingController();
  final AuthRepo authRepo = AuthRepo();
  void sendOtp() async {
    setState(() {
      isLoading = true;
    });
    final (data, error) = await authRepo.sentOTP(email: emailController.text);

    if (data != null) {
      showToast(context: context, title: data, isSuccess: true);
      setState(() {
        isLoading = false;
      });
      animatedNavigateTo(context, VerifyOtpView(email: emailController.text));
    } else {
      showToast(
        context: context,
        title: error?.title ?? "Unable to send otp.",
        isSuccess: false,
      );
      setState(() {
        isLoading = false;
      });
    }

    // setState(() {
    //   isLoading = false;
    // });
    // send req
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: childAppBar(context: context),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: defaultPadding * 1.5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              spacing: 10,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 0.0),
                  child: Text(
                    'Reset your password',
                    style: TextStyle(
                      color: const Color(0xFF343F41),
                      fontSize: 23,
                      fontFamily: 'Outfit',
                      fontWeight: FontWeight.w600,
                      decoration: TextDecoration.none,
                    ),
                  ),
                ),
                Text(
                  'Please enter your email to get OTP for the next step to reset your password',
                  style: TextStyle(
                    color: const Color(0xFF767781),
                    fontSize: 13,
                    fontFamily: 'Outfit',
                    fontWeight: FontWeight.w400,
                    decoration: TextDecoration.none,
                  ),
                ),

                vPad35,
                Column(
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.mail_outline,
                          size: 16,
                          color: const Color(0xFF767781),
                        ),
                        SizedBox(width: 7),
                        Expanded(
                          child: TextField(
                            controller: emailController,
                            style: TextStyle(
                              color: const Color(0xFF222A2C),
                              fontSize: 14,
                              fontFamily: 'Outfit',
                              fontWeight: FontWeight.w400,
                              decoration: TextDecoration.none,
                            ),
                            decoration: InputDecoration(
                              hintText: 'Email Address',
                              hintStyle: TextStyle(
                                color: const Color(0xFF767781),
                                fontSize: 14,
                                fontFamily: 'Outfit',
                                fontWeight: FontWeight.w400,
                              ),
                              border: InputBorder.none,
                              isDense: true,
                              // contentPadding: EdgeInsets.symmetric(vertical: 5.h),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      width: double.infinity,
                      height: 1,
                      color: const Color(0xFF767781),
                    ),
                  ],
                ),
              ],
            ),

            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 20,
              children: [
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: "By Singing up You're agree with our",
                        style: TextStyle(
                          color: const Color(0xFF767781),
                          fontSize: 12,
                          fontFamily: 'Outfit',
                          fontWeight: FontWeight.w400,
                          height: 1.45,
                          decoration: TextDecoration.none,
                        ),
                      ),
                      TextSpan(text: ' '),
                      TextSpan(
                        text: 'Terms & Condition',
                        style: TextStyle(
                          color: const Color(0xFF1C96CC),
                          fontSize: 12,
                          fontFamily: 'Outfit',
                          fontWeight: FontWeight.w400,
                          height: 1.45,
                          decoration: TextDecoration.none,
                        ),
                      ),
                      TextSpan(
                        text: ' and ',
                        style: TextStyle(
                          // color: const Color(0xFF1C96CC),
                          fontSize: 12,
                          fontFamily: 'Outfit',
                          fontWeight: FontWeight.w400,
                          height: 1.45,
                          decoration: TextDecoration.none,
                        ),
                      ),
                      TextSpan(
                        text: 'Privacy Policy',
                        style: TextStyle(
                          color: const Color(0xFF1C96CC),
                          fontSize: 12,
                          fontFamily: 'Outfit',
                          fontWeight: FontWeight.w400,
                          height: 1.45,
                          decoration: TextDecoration.none,
                        ),
                      ),
                    ],
                  ),
                ),

                primaryFilledButton(
                  onTap: () {
                    // animatedNavigateTo(context, VerifyOtpView());
                    sendOtp();
                  },
                  title: "Continue",
                  isEnable: true,
                  isLoading: isLoading,
                  // isLoading: false,
                ),
              ],
            ),

            vPad35,
          ],
        ),
      ),
    );
  }
}
