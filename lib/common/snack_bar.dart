import 'package:flutter/material.dart';
import '/common/colors.dart';

showToast({
  required BuildContext context,
  required String title,
  required bool isSuccess,
}) {
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        title,
        style: TextStyle(
          color: Colors.white,
          fontSize: 14,
          fontFamily: 'Outfit',
          fontWeight: FontWeight.w500,
        ),
      ),
      backgroundColor: isSuccess ? successColor : errorColor,
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      margin: EdgeInsets.all(16),
      duration: const Duration(seconds: 2),
    ),
  );
}
