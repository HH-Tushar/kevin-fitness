import 'package:flutter/material.dart';
import 'package:kenvinorellana/common/colors.dart';

childAppBar({required BuildContext context}) {
  return AppBar(
    toolbarHeight: 30,
    backgroundColor: customWhite,
    surfaceTintColor: customWhite,
    leading: IconButton(
      onPressed: () => Navigator.pop(context),
      icon: Icon(Icons.arrow_back),
    ),
  );
}
