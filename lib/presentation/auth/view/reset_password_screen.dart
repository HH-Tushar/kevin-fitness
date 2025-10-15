import 'package:flutter/material.dart';
import '/common/app_bars.dart';
import '/common/custom_buttons.dart';
import '/common/gaps.dart';
import '/common/navigator.dart';
import '/common/snack_bar.dart';
import '/presentation/auth/view/login_screen.dart';
import 'package:provider/provider.dart';

import '../../../application/auth/auth_repo.dart';
import '../../../common/colors.dart';
import '../../../translation/localization.dart';

part 'components/reset_pass_field.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key, required this.email});
  final String email;

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final AuthRepo authRepo = AuthRepo();
  bool isLoading = false;
  bool isEnable = false;
  String newPassword = "";
  String confirmPassword = "";

  toggleEnable() {
    if (isEnable == false &&
        newPassword.length > 5 &&
        confirmPassword.length > 5) {
      setState(() {
        isEnable = true;
      });
    } else if (isEnable == true &&
        (confirmPassword.length < 6 || newPassword.length < 6)) {
      setState(() {
        isEnable = false;
      });
    }
  }

  void setPassword() async {
    setState(() {
      isLoading = true;
      isEnable = false;
    });
    final (data, error) = await authRepo.resetPassword(
      email: widget.email,
      newPassword: newPassword,
      confirmPassword: confirmPassword,
    );

    if (data != null) {
      showToast(context: context, title: data, isSuccess: true);
      animatedNavigateReplaceAll(context, LoginScreen());

    } else {
      showToast(
        context: context,
        title: error?.title ?? "Unable to verify otp.",
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
    // final LanguageProvider translator = context.watch();
    // final authTranslator = translator.authTranslation;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: childAppBar(context: context),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: defaultPadding * 1.5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 20,
          children: [
            // Positioned(
            //   left: 16,
            //   top: 48,
            //   child: GestureDetector(
            //     onTap: () => Navigator.of(context).pop(),
            //     child: const Icon(Icons.arrow_back_ios_new_rounded, size: 24, color: Color(0xFF343F41)),
            //   ),
            // ),
            Text(
              'Create new password',
              style: TextStyle(
                color: const Color(0xFF343F41),
                fontSize: 23,
                fontFamily: 'Outfit',
                fontWeight: FontWeight.w700,
                decoration: TextDecoration.none,
              ),
            ),
            Text(
              'Create your new password to access your manual',
              style: TextStyle(
                color: const Color(0xFF767781),
                fontSize: 14,
                fontFamily: 'Outfit',
                fontWeight: FontWeight.w400,
                decoration: TextDecoration.none,
              ),
            ),

            _PasswordField(
              hint: "New Password",
              icon: Icons.key,
              onChange: (e) {
                newPassword = e;
                toggleEnable();
              },
            ),
            _PasswordField(
              hint: "Confirm Password",
              icon: Icons.key,
              onChange: (e) {
                confirmPassword = e;
                toggleEnable();
              },
              currentPassword: newPassword,
            ),

            // Continue button
            vPad5,
            Center(
              child: primaryFilledButton(
                onTap: () async {
                  setPassword();
                },
                title: "Continue",
                isEnable: true,
              ),
            ),

          
          ],
        ),
      ),
    );
  }
}
