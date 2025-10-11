import 'package:flutter/material.dart';

import 'ai_screen_translation.dart';
import 'auth_translation.dart';
import 'basic_translation.dart';
import 'feedback_translation.dart';
import 'home_translation.dart';
import 'meal_plan_translation.dart';
import 'profile_translation.dart';
import 'setting_translation.dart';
import 'summery_translation.dart';
import 'upgrade_plan_translation.dart';
import 'workout_plan_transaltoin.dart';

class LanguageProvider with ChangeNotifier {
  bool _isEnglish = true;

  bool get isEnglish => _isEnglish;

  String get currentLanguage => _isEnglish ? "english" : "spanish";

  void toggleLanguage(bool changeToEng) {
    if (changeToEng == true && _isEnglish == true) {
      return;
    }
    _isEnglish = changeToEng;
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
  SettingTranslation get settingTranslation =>
      _isEnglish ? SettingEnglish() : SettingSpanish();
  UpgradePlanTranslation get upgradePlanTranslation =>
      _isEnglish ?UpgradePlanEnglish() :UpgradePlanSpanish();
  ProfileUpdateTranslation get profileUpdateTranslation =>
      _isEnglish ?ProfileUpdateEnglish() :ProfileUpdateSpanish();
  HomeTranslation get homeTranslation =>
      _isEnglish ?HomeEnglish() :HomeSpanish();
  FeedbackTranslation get feedbackTranslation =>
      _isEnglish ?FeedbackEnglish() :FeedbackSpanish();
  SummaryTranslation get summaryTranslation =>
      _isEnglish ?SummaryEnglish() :SummarySpanish();

  // Add other translation getters here
}
