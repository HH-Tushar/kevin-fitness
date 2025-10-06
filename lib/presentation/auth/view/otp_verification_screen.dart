import 'package:flutter/material.dart';
import '/common/app_bars.dart';

import '/common/custom_buttons.dart';
import '/common/navigator.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';
import '../../../application/auth/auth_repo.dart';
import '../../../common/gaps.dart';
import '../../../common/snack_bar.dart';
import '../../../translation/localization.dart';
import '/common/colors.dart';

import 'reset_password_screen.dart';

class VerifyOtpView extends StatefulWidget {
  const VerifyOtpView({super.key, required this.email});
  final String email;
  @override
  State<VerifyOtpView> createState() => _VerifyOtpViewState();
}

class _VerifyOtpViewState extends State<VerifyOtpView> {
  bool isLoading = false;
  bool isEnable = false;
  String otp = "";

  toggleEnable() {
    if (isEnable == false && otp.length == 4) {
      setState(() {
        isEnable = true;
      });
    } else if (isEnable == true && otp.length != 4) {
      setState(() {
        isEnable = false;
      });
    }
  }

  final AuthRepo authRepo = AuthRepo();
  void verifyOTP() async {
    setState(() {
      isLoading = true;
      isEnable = false;
    });
    final (data, error) = await authRepo.verifyOtp(
      email: widget.email,
      otp: otp,
    );

    if (data != null) {
      showToast(context: context, title: data, isSuccess: true);
      animatedNavigateTo(context, ResetPasswordScreen(email: widget.email));
      // animatedNavigateTo(context, VerifyOtpView(email: emailController.text));
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
    final LanguageProvider translator = context.watch();
    final authTranslator = translator.authTranslation;
    return Scaffold(
      appBar: childAppBar(context: context),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: defaultPadding * 1.5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                authTranslator.oTPVerification,
                style: TextStyle(
                  color: const Color(0xFF343F41),
                  fontSize: 23,
                  fontFamily: 'Outfit',
                  fontWeight: FontWeight.w600,
                  decoration: TextDecoration.none,
                ),
              ),
              Text(
                "We sent you a one time password on your email yji******gmail.com. Enter the OTP to complete verify.",
                style: TextStyle(
                  color: customGreyText,
                  fontSize: 13,
                  fontFamily: 'Outfit',
                  fontWeight: FontWeight.w600,
                  decoration: TextDecoration.none,
                ),
              ),
              vPad35,
              vPad35,
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: PinCodeTextField(
                  appContext: context,
                  length: 4,
                  autoDismissKeyboard: true,
                  obscureText: false,
                  animationType: AnimationType.fade,
                  cursorColor: Colors.black,
                  enableActiveFill: true,
                  pinTheme: PinTheme(
                    inactiveFillColor: customWhite,
                    activeFillColor: customWhite,
                    selectedFillColor: customWhite,
                    shape: PinCodeFieldShape.box,
                    borderRadius: BorderRadius.circular(10),
                    fieldHeight: 65,
                    fieldWidth: 65,

                    inactiveColor: customGreyText,
                    activeColor: Colors.black,
                    selectedColor: Colors.black,
                  ),
                  onChanged: (value) {
                    // Handle OTP field changes
                    // provider.updateOtp(value);
                    otp = value;
                    toggleEnable();
                  },
                  onCompleted: (value) {
                    // Handle OTP completion (e.g., submit OTP)
                    // print("OTP Completed: $value");
                    // provider.updateOtp(value);
                  },
                ),
              ),

              // vPad20,
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: defaultPadding * 0.5,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Don't get OTP"),
                    TextButton(onPressed: () {}, child: Text("Resend OTP")),
                  ],
                ),
              ),
              vPad35,

              Center(
                child: primaryFilledButton(
                  onTap: () {
                    verifyOTP();
                    // animatedNavigateTo(
                    //   context,
                    //   ResetPasswordScreen(email: widget.email),
                    // );
                  },
                  title: "Verify",
                  isEnable: isEnable,
                  isLoading: isLoading,
                ),
              ),
              vPad15,
            ],
          ),
        ),
      ),
    );
  }
}
