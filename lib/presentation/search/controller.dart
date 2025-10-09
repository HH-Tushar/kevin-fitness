// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// import '../../application/daily_plan/search_repo.dart';
// import '../../translation/localization.dart';

part of 'search_screen.dart';

class _SearchController extends ChangeNotifier {
  _SearchController({required this.context}) {
    fetchDate();
  }
  final BuildContext context;
  final SearchRepo searchRepo = SearchRepo();

  bool isLoadingRecipe = false;
  bool isLoadingWorkout = false;
  List<Recipe> recipe = [];
  List<Recipe> sortedRecipe = [];
  List<Workout> workouts = [];
  List<Workout> sortedWorkouts = [];

  int selectedCategory = 0;
  String selectedFilterTag = "";

  void fetchDate() async {
    final language = Provider.of<LanguageProvider>(
      context,
      listen: false,
    ).currentLanguage;
    isLoadingRecipe = true;
    isLoadingWorkout = true;
    final (data, error) = await searchRepo.getAllRecipe(language: language);
    if (data != null) {
      recipe = data;
      sortedRecipe = data;
    }
    isLoadingRecipe = false;
    notify();
    final (data2, error2) = await searchRepo.getAllWorkout(language: language);
    if (data2 != null) {
      workouts = data2;
      sortedWorkouts = data2;
    }
    isLoadingWorkout = false;
    notify();
  }

  void sortRecipe(String name) {
    sortedRecipe = recipe.where((r) => r.recipeName.contains(name)).toList();
    notify();
  }

  void sortWorkout(String name) {
    sortedWorkouts = workouts
        .where((r) => r.workoutName.contains(name))
        .toList();
    notify();
  }

  void notify() {
    if (hasListeners) notifyListeners();
  }
}
