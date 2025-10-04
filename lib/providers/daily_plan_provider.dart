import 'package:flutter/material.dart';
import 'package:kenvinorellana/common/api_handler.dart';
import 'package:provider/provider.dart';

import '../application/auth/auth_controller.dart';
import '../application/daily_plan/models/ai_gen_meals_plan.dart';
import '../application/daily_plan/models/ai_gen_workout_plans.dart';
import '../application/daily_plan/models/daily_plan_model.dart';
import '../application/daily_plan/daily_plan_repo.dart';
import '../translation/localization.dart';
// import 'global_support.dart';

class DailyPlanProvider extends ChangeNotifier {
  DailyPlanProvider(this.context) {
    init();
    cred();
  }
  final BuildContext context;
  // final LanguageProvider _languageProvider;
  final DailyPlanRepo dailyPlanRepo = DailyPlanRepo();

  DailyPlans? dailyPlan;
  AiGeneratedMealPlans? aiGeneratedMealPlans;
  AiGeneratedWorkOutPlans? aiGeneratedWorkOutPlans;

  bool isLoading = false;

  String language = "";
  String token = "";
  int mealPlanId = 0;
  int workoutPlanId = 0;

  init() async {
    Provider.of<LanguageProvider>(context, listen: false).addListener(() {
      cred();
    });
  }

  void cred() async {
    language = Provider.of<LanguageProvider>(
      context,
      listen: false,
    ).currentLanguage;
    final tkn = Provider.of<AuthController>(context, listen: false).accessToken;
    mealPlanId =
        Provider.of<AuthController>(
          context,
          listen: false,
        ).getUserInfo?.mealPlans.first.id ??
        0;
    workoutPlanId =
        Provider.of<AuthController>(
          context,
          listen: false,
        ).getUserInfo?.workoutPlans.first.id ??
        0;

    if (tkn != null) {
      token = tkn;
    }
  }

  void recallDataOnLanguageChange() async {
    await fetchDailyPlan(language: language, token: token);
  }

  Future<void> fetchDailyPlan({
    DateTime? date,
    required String token,
    required String language,
  }) async {
    isLoading = true;
    notifyListeners();
    final (data, error) = await dailyPlanRepo.getDailyPlan(
      token: token,
      language: language,
    );

    if (data != null) {
      dailyPlan = data;
    }

    isLoading = false;

    notifyListeners();
  }

  Future<void> fetchAiGenMealPlans({
    // DateTime? date,
    required String token,
    required String language,
  }) async {
    isLoading = true;
    notifyListeners();
    final (data, error) = await dailyPlanRepo.get15DaysMealPlan(
      token: token,
      language: language,
      id: mealPlanId,
    );
    if (data != null) {
      aiGeneratedMealPlans = data;
    }
    isLoading = false;
    notifyListeners();
  }

  Future<void> fetchAiGenWorkOutPlans({
    // DateTime? date,
    required String token,
    required String language,
  }) async {
    isLoading = true;
    notifyListeners();
    final (data, error) = await dailyPlanRepo.get15DaysWorkOutPlan(
      token: token,
      language: language,
      // id: mealPlanId,
    );
    if (data != null) {
      aiGeneratedWorkOutPlans = data;
    }
    isLoading = false;
    notifyListeners();
  }



}
