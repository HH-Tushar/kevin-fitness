import 'package:flutter/material.dart';

import 'auth_translation.dart';
import 'basic_translation.dart';

class LanguageProvider with ChangeNotifier {
  bool _isEnglish = true;

  bool get isEnglish => _isEnglish;

  void toggleLanguage() {
    _isEnglish = !_isEnglish;
    notifyListeners();
  }

  BasicInfoTranslation get basicInfoTranslation =>
      _isEnglish ? BasicInfoEnglish() : BasicInfoSpanish();
  AuthTranslation get authTranslation =>
      _isEnglish ? AuthEnglish() : AuthSpanish();

  // Add other translation getters here
}
