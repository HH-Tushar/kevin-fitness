import 'package:flutter/material.dart';

import 'ai_screen_translation.dart';
import 'auth_translation.dart';
import 'basic_translation.dart';
import 'meal_plan_translation.dart';
import 'workout_plan_transaltoin.dart';

class LanguageProvider with ChangeNotifier {
  bool _isEnglish = true;

  bool get isEnglish => _isEnglish;

  String get currentLanguage => _isEnglish ? "english" : "spanish";

  void toggleLanguage() {
    _isEnglish = !_isEnglish;
    notifyListeners();
  }

  BasicInfoTranslation get basicInfoTranslation =>
      _isEnglish ? BasicInfoEnglish() : BasicInfoSpanish();
  AuthTranslation get authTranslation =>
      _isEnglish ? AuthEnglish() : AuthSpanish();
  AiScreenTranslation get aiScreenTranslation =>
      _isEnglish ? AiScreenEnglish() : AiScreenSpanish();
  WorkoutPlanTranslation get workoutPlanTranslation =>
      _isEnglish ? WorkoutPlanEnglish() : WorkoutPlanSpanish();
  MealPlanTranslation get mealPlanTranslation =>
      _isEnglish ? MealPlanEnglish() : MealPlanSpanish();

  // Add other translation getters here
}
