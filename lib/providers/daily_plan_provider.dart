import 'package:flutter/material.dart';
import 'package:kenvinorellana/common/snack_bar.dart';
import 'package:provider/provider.dart';

import '../application/auth/auth_controller.dart';
import '../application/daily_plan/models/ai_gen_meals_plan.dart';
import '../application/daily_plan/models/ai_gen_workout_plans.dart';
import '../application/daily_plan/models/daily_plan_model.dart';
import '../application/daily_plan/daily_plan_repo.dart';
import '../application/daily_plan/models/daily_workout_plan.dart';
import '../application/daily_plan/models/today_meal_plan.dart';
import '../translation/localization.dart';
// import 'global_support.dart';

class DailyPlanProvider extends ChangeNotifier {
  DailyPlanProvider(this.context) {
    init();
    fetchInitialData();
  }
  final BuildContext context;
  // final LanguageProvider _languageProvider;
  final DailyPlanRepo dailyPlanRepo = DailyPlanRepo();

  DailyPlans? dailyPlan;
  TodayDailyMealPlans? todayMealPlan;
  DailyWorkoutPlanDetails? todayWorkoutPlan;
  AiGeneratedMealPlans? aiGeneratedMealPlans;
  AiGeneratedWorkOutPlans? aiGeneratedWorkOutPlans;

  bool isLoading = false;

  String language = "";
  String token = "";
  int mealPlanId = 0;
  int workoutPlanId = 0;

  init() async {
    Provider.of<LanguageProvider>(context, listen: false).addListener(() {
      fetchInitialData();
    });
  }

  void fetchInitialData() async {
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
      recallDataOnLanguageChange();
    }
  }

  void recallDataOnLanguageChange() async {
    await fetchDailyPlan(language: language, token: token);
    await fetchTodaysMealPlan(language: language, token: token);
    await fetchTodaysWorkoutPlan(language: language, token: token);
  }

  Future<void> fetchTodaysMealPlan({
    required String token,
    required String language,
  }) async {
    isLoading = true;
    notifyListeners();
    final (data, error) = await dailyPlanRepo.getTodaysMealPlan(
      token: token,
      language: language,
    );

    if (data != null) {
      todayMealPlan = data;
    }

    isLoading = false;

    notifyListeners();
  }

  Future<void> fetchTodaysWorkoutPlan({
    required String token,
    required String language,
  }) async {
    isLoading = true;
    notifyListeners();
    final (data, error) = await dailyPlanRepo.getTodaysWorkoutPlan(
      token: token,
      language: language,
    );

    if (data != null) {
      todayWorkoutPlan = data;
    }

    isLoading = false;

    notifyListeners();
  }

  Future<void> markWorkoutAsDone({
    required int uniqueId,
    required BuildContext contex,
  }) async {
    if (uniqueId == -1) return;

    final index = todayWorkoutPlan?.workouts.indexWhere(
      (e) => e.id == uniqueId,
    );
    if (index != null && index != -1) {
      // call api
      final (data, error) = await dailyPlanRepo.updateWorkoutPlanUnit(
        id: uniqueId,
        token: Provider.of<AuthController>(context, listen: false).accessToken!,
        isDone:        !todayWorkoutPlan!.workouts[index].completed,
      );
      //if success
      if (data != null) {
        todayWorkoutPlan!.workouts[index].completed = data;

        print(todayWorkoutPlan!.workouts[index].completed);
        notifyListeners();
        //show toast
        showToast(
          context: contex,
          title: "Successfully updated the workout plan",
          isSuccess: true,
        );
      }
    }
  }
  Future<void> markMealPlanAsDone({
    required int uniqueId,
    required BuildContext contex,
  }) async {
    if (uniqueId == -1) return;

    final index = todayMealPlan?.todayMeals.indexWhere(
      (e) => e.id == uniqueId,
    );
    if (index != null && index != -1) {
      // call api
      final (data, error) = await dailyPlanRepo.updateMealPlanUnit(
        id: uniqueId,
        token: Provider.of<AuthController>(context, listen: false).accessToken!,
        isDone: !todayMealPlan!.todayMeals[index].completed,
      );
      //if success
      if (data != null) {
        todayMealPlan!.todayMeals[index].completed = data;

        print(todayMealPlan!.todayMeals[index].completed);
        notifyListeners();
        //show toast
        showToast(
          context: contex,
          title: "Successfully updated the workout plan",
          isSuccess: true,
        );
      }
    }
  }

  // Future<void> markMealPlanAsDone({
  //   required int uniqueId,
  //   required BuildContext contex,
  // }) async {
  //   final index = todayMealPlan?.todayMeals.indexWhere(
  //     (e) => e.recipe.id == uniqueId,
  //   );
  //   if (index != null && index != -1) {
  //     //call api

  //     //if success

  //     todayMealPlan!.todayMeals[index].completed =
  //         !todayMealPlan!.todayMeals[index].completed;

  //     print(todayMealPlan!.todayMeals[index].completed);
  //     notifyListeners();
  //     //show toast
  //     showToast(
  //       context: contex,
  //       title: "Successfully updated the workout plan",
  //       isSuccess: true,
  //     );
  //   }
  // }

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
