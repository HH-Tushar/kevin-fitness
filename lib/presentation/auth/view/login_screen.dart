import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/gestures.dart';
import 'package:kenvinorellana/application/auth/auth_controller.dart';
import 'package:kenvinorellana/common/custom_buttons.dart';
import 'package:kenvinorellana/common/gaps.dart';
import 'package:kenvinorellana/common/navigator.dart';
import 'package:kenvinorellana/common/snack_bar.dart';
import 'package:kenvinorellana/presentation/auth/view/forgot_password_screen.dart';
import 'package:kenvinorellana/presentation/auth/view/signup_screen.dart';
import 'package:kenvinorellana/presentation/home/home_screen.dart';
import 'package:provider/provider.dart';

import '../../../common/colors.dart';
import '../../../translation/localization.dart';
import '../../landing/landing.dart';

part 'components/login_fields.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String email = "";
  String password = "";
  bool isLoading = false;
  bool isEnable = false;

  void toggleEnable() {
    if (email.isNotEmpty && password.isNotEmpty && isEnable == false) {
      setState(() {
        isEnable = true;
      });
    }
  }

  Future<void> login() async {
    if (email.isEmpty && password.isEmpty) return;
    setState(() {
      isLoading = true;
      isEnable = false;
    });
    final (data, error) = await Provider.of<AuthController>(
      context,
      listen: false,
    ).login(email: email, password: password);

    if (data != null) {
      showToast(context: context, title: "Login Successfully", isSuccess: true);
      animatedNavigateTo(context, LandingView());
    } else {
      showToast(
        context: context,
        title: error?.title ?? "Unable to Login",
        isSuccess: false,
      );
    }

    setState(() {
      isLoading = false;
      isEnable = true;
    });
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
                  // SizedBox(width: double.infinity),
                  // Container(
                  //   width: 402,
                  //   height: 383,
                  //   decoration: BoxDecoration(
                  //     image: DecorationImage(
                  //       image: AssetImage("assets/images/login_bg.png"),
                  //       fit: BoxFit.fill,
                  //     ),
                  //   ),
                  // ),
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
                    authTranslator.heyThere,
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
                    authTranslator.welcomeBack,
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
                    hint: authTranslator.enterYourEmail,
                    onChange: (e) {
                      email = e;
                      toggleEnable();
                    },
                  ),
                  SizedBox(height: 24),
                  _PasswordField(
                    icon: Icons.key,
                    hint: authTranslator.password,
                    onChange: (e) {
                      password = e;
                      toggleEnable();
                    },
                  ),
                  vPad10,
                  Align(
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
                      onTap: () =>
                          animatedNavigateTo(context, ForgotPasswordScreen()),
                      child: Text(
                        authTranslator.forgotPassword,
                        style: TextStyle(
                          color: const Color(0xFF222A2C),
                          fontSize: 11,
                          fontFamily: 'Outfit',
                          fontWeight: FontWeight.w400,
                          decoration: TextDecoration.none,
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 16),
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
                    // child: GestureDetector(
                    //   // onTap: () => GoRouter.of(context).go('/main'),
                    //   child: Container(
                    //     width: 180,
                    //     height: 44,
                    //     decoration: BoxDecoration(
                    //       color: const Color(0xFF343F41),
                    //       border: Border.all(
                    //         color: const Color(0xFF767781),
                    //         width: 0.69,
                    //       ),
                    //       borderRadius: BorderRadius.circular(6),
                    //     ),
                    //     child: Center(
                    //       child: Text(
                    //         authTranslator.login,
                    //         style: TextStyle(
                    //           color: Colors.white,
                    //           fontSize: 18,
                    //           fontFamily: 'Outfit',
                    //           fontWeight: FontWeight.w400,
                    //           decoration: TextDecoration.none,
                    //         ),
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    child: primaryFilledButton(
                      onTap: () {
                        login();
                      },
                      title: authTranslator.login,
                      isEnable: isEnable,
                      isLoading: isLoading,
                    ),
                  ),

                  SizedBox(height: 12),
                  Center(
                    child: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: "${authTranslator.dontHaveAccount} ",
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
                            text: authTranslator.signUp,
                            style: TextStyle(
                              color: const Color(0xFF1C96CC),
                              fontSize: 12,
                              fontFamily: 'Outfit',
                              fontWeight: FontWeight.w400,
                              height: 1.45,
                              decoration: TextDecoration.none,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () =>
                                  animatedNavigateTo(context, SignUpScreen()),
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

class _LoginField extends StatelessWidget {
  final IconData icon;
  final String hint;
  final bool isPassword;
  final bool showForgot;
  const _LoginField({
    required this.icon,
    required this.hint,
    this.isPassword = false,
    this.showForgot = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(icon, size: 16, color: const Color(0xFF222A2C)),
            SizedBox(width: 6),
            Expanded(
              child: TextField(
                obscureText: isPassword,
                style: TextStyle(
                  color: const Color(0xFF222A2C),
                  fontSize: 13,
                  fontFamily: 'Outfit',
                  fontWeight: FontWeight.w400,
                  decoration: TextDecoration.none,
                ),
                decoration: InputDecoration(
                  hintText: hint,
                  hintStyle: TextStyle(
                    color: const Color(0xFF222A2C),
                    fontSize: 13,
                    fontFamily: 'Outfit',
                    fontWeight: FontWeight.w400,
                  ),
                  border: InputBorder.none,
                  isDense: true,
                  contentPadding: EdgeInsets.symmetric(vertical: 8),
                ),
              ),
            ),
            if (isPassword)
              Padding(
                padding: EdgeInsets.only(left: 8),
                child: Icon(
                  Icons.visibility_off,
                  size: 15,
                  color: const Color(0xFF222A2C),
                ),
              ),
          ],
        ),
        SizedBox(height: 2),
        Container(
          width: double.infinity,
          height: 1,
          color: const Color(0xFF222A2C),
        ),
      ],
    );
  }
}
