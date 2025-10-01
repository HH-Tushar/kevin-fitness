import 'package:flutter/material.dart';

class BasicInfoController extends ChangeNotifier {
  int step = 0;

  String abdominalValue = "";
  String sacroiliacValue = "";
  String subscapularisValue = "";
  String tricepsValue = "";
  String gender = "";
  String dateOfBirth = "";
  String weight = "";
  String height = "";

  toggleStep(int val) {
    step = val;
    notify();
  }

  void notify() {
    if (hasListeners) notifyListeners();
  }
}
