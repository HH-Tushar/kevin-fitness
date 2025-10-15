import 'package:flutter/material.dart';

// import 'package:go_router/go_router.dart';
import 'package:flutter/gestures.dart';
import 'package:kenvinorellana/application/auth/auth_controller.dart';
import 'package:kenvinorellana/common/colors.dart';
import 'package:kenvinorellana/common/navigator.dart';
import 'package:kenvinorellana/common/snack_bar.dart';
import 'package:provider/provider.dart';

import '../../../common/gaps.dart';
import '../../../translation/localization.dart';
import '../../profile/new_user/basic_info_screen.dart';
part 'components/signup_fields.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  String email = "";
  String password = "";
  String confirmPassword = "";
  String? emailValidator(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Email is required';
    }

    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(value.trim())) {
      return 'Enter a valid email address';
    }

    return null;
  }

  void register() async {
    final (data, error) = await Provider.of<AuthController>(
      context,
      listen: false,
    ).register(email: email, password: password);

    if (data != null) {
      showToast(
        context: context,
        title: "Successfully register. Please fill up your profile",
        isSuccess: true,
      );
      animatedNavigateTo(context, BasicInfoScreen());
    } else {
      showToast(
        context: context,
        title: error?.title ?? "Something went wrong",
        isSuccess: false,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height * 0.5;
    final LanguageProvider translator = context.watch();
    final authTranslator = translator.authTranslation;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // Top background image with overlay and logo
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: SizedBox(
              width: double.infinity,
              height: height,
              child: Stack(
                children: [
                  Image.asset(
                    "assets/images/login_bg.png",
                    fit: BoxFit.cover,
                    height: double.infinity,
                    width: double.infinity,
                  ),
                  Container(
                    width: double.infinity,
                    height: height,
                    color: const Color(0xA01E1E1E),
                  ),

                  Positioned(
                    child: Center(
                      child: Image.asset("assets/images/splash_logo.png"),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // White rounded container and all content inside it
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            // top: 383,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 41),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height: 33),
                  Text(
                    'Hey there,',
                    style: TextStyle(
                      color: const Color(0xFF222A2C),
                      fontSize: 17,
                      fontFamily: 'Outfit',
                      fontWeight: FontWeight.w400,
                      decoration: TextDecoration.none,
                    ),
                  ),
                  SizedBox(height: 6),
                  Text(
                    'Create Your Account',
                    style: TextStyle(
                      color: const Color(0xFF222A2C),
                      fontSize: 27,
                      fontFamily: 'Outfit',
                      fontWeight: FontWeight.w700,
                      decoration: TextDecoration.none,
                    ),
                  ),
                  SizedBox(height: 32),
                  _EmailField(
                    icon: Icons.mail_outline,
                    hint: 'Enter Your Email',
                    onChange: (e) {
                      email = e;
                    },
                  ),
                  vPad15,
                  _PasswordField(
                    icon: Icons.key,
                    hint: 'Create Password',
                    onChange: (e) {
                      password = e;
                      setState(() {});
                    },
                  ),
                  // SizedBox(height: 24),
                  vPad15,
                  _PasswordField(
                    icon: Icons.key,
                    hint: 'Confirm Password',
                    onChange: (e) {
                      confirmPassword = e;
                    },
                    currentPassword: password,
                  ),
                  // SizedBox(height: 16),
                  vPad35,
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
                  SizedBox(height: 24),
                  Center(
                    child: GestureDetector(
                      // onTap: () => GoRouter.of(context).go('/main'),
                      onTap: () {
                        if (emailValidator(email) != null ||
                            password.length < 6) {
                          showToast(
                            context: context,
                            title: "Please fill up the required fields first",
                            isSuccess: false,
                          );
                          return;
                        }

                        register();
                      },
                      child: Container(
                        width: 160,
                        height: 44,
                        decoration: BoxDecoration(
                          color: const Color(0xFF343F41),
                          border: Border.all(
                            color: const Color(0xFF767781),
                            width: 0.69,
                          ),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Center(
                          child: Text(
                            authTranslator.signUp,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontFamily: 'Outfit',
                              fontWeight: FontWeight.w400,
                              decoration: TextDecoration.none,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 12),
                  Center(
                    child: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: "${authTranslator.alreadyHaveAccount} ",
                            style: TextStyle(
                              color: const Color(0xFF767781),
                              fontSize: 12,
                              fontFamily: 'Outfit',
                              fontWeight: FontWeight.w400,
                              height: 1.45,
                              decoration: TextDecoration.none,
                            ),
                          ),
                          TextSpan(
                            text: authTranslator.login,
                            style: TextStyle(
                              color: const Color(0xFF1C96CC),
                              fontSize: 12,
                              fontFamily: 'Outfit',
                              fontWeight: FontWeight.w400,
                              height: 1.45,
                              decoration: TextDecoration.none,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () => Navigator.pop(context),

                            // GoRouter.of(context).push('/signup'),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 8),
                  Center(
                    child: Text(
                      'Or',
                      style: TextStyle(
                        color: const Color(0xFF767781),
                        fontSize: 12,
                        fontFamily: 'Outfit',
                        fontWeight: FontWeight.w500,
                        height: 1.45,
                        decoration: TextDecoration.none,
                      ),
                    ),
                  ),
                  SizedBox(height: 8),
                  Center(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.g_mobiledata, size: 24, color: Colors.black),
                        SizedBox(width: 16),
                        Icon(Icons.apple, size: 22, color: Colors.black),
                      ],
                    ),
                  ),
                  // SizedBox(height: 24),
                  vPad20,
                  vPad35,
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
