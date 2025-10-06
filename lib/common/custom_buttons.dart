import 'package:flutter/material.dart';

import 'colors.dart';


class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback? onTap;
  final double? width;
  const CustomButton({
    super.key,
    this.text = 'Gets Stared',
    this.onTap,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width ?? double.infinity,
        height: 50,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            begin: Alignment(0.85, 1.33),
            end: Alignment(0.10, -0.17),
            colors: [Color(0xFF131526), Color(0xFF202232), Color(0xFF2E303E)],
          ),
          border: Border.all(color: const Color(0xFF767781), width: 1),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Center(
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 23,
              fontFamily: 'Outfit',
              fontWeight: FontWeight.w400,
              decoration: TextDecoration.none,
            ),
          ),
        ),
      ),
    );
  }
}

primaryFilledButton({
  required VoidCallback onTap,
  required String title,
  required bool isEnable,
  bool? isLoading,
  double? height,
  double? width,
  double? radius,
  Color? bg,
}) {
  return FilledButton(
    onPressed: isEnable ? onTap : null,

    style: FilledButton.styleFrom(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(radius ?? 6),
      ),
      backgroundColor: bg ?? customDarkTeal,
      disabledBackgroundColor: customDarkTeal.withAlpha(200),
      // padding: EdgeInsets.symmetric(horizontal: defaultPadding * 4),
      minimumSize: Size(width ?? 200, height ?? 40),
    ),

    child: isLoading == true
        ? SizedBox(
            height: 20,
            width: 20,
            child: CircularProgressIndicator(color: customDarkTeal),
          )
        : Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontFamily: 'Outfit',
              fontWeight: FontWeight.w400,
              decoration: TextDecoration.none,
            ),
          ),
  );
}
