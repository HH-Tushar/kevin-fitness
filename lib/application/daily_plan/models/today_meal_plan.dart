import 'dart:convert';

import 'daily_meal_plan.dart';

class TodayDailyMealPlans {
  final List<TodayMeal> todayMeals;
  final Stats stats;

  TodayDailyMealPlans({required this.todayMeals, required this.stats});

  factory TodayDailyMealPlans.fromRawJson(String str) =>
      TodayDailyMealPlans.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory TodayDailyMealPlans.fromJson(Map<String, dynamic> json) =>
      TodayDailyMealPlans(
        todayMeals: List<TodayMeal>.from(
          json["today_meals"].map((x) => TodayMeal.fromJson(x)),
        ),
        stats: Stats.fromJson(json["stats"]),
      );

  Map<String, dynamic> toJson() => {
    "today_meals": List<dynamic>.from(todayMeals.map((x) => x.toJson())),
    "stats": stats.toJson(),
  };
}

class Stats {
  final The15Day the15DayTotals;
  final The15Day the15DayCompleted;

  Stats({required this.the15DayTotals, required this.the15DayCompleted});

  factory Stats.fromRawJson(String str) => Stats.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Stats.fromJson(Map<String, dynamic> json) => Stats(
    the15DayTotals: The15Day.fromJson(json["15_day_totals"]),
    the15DayCompleted: The15Day.fromJson(json["15_day_completed"]),
  );

  Map<String, dynamic> toJson() => {
    "15_day_totals": the15DayTotals.toJson(),
    "15_day_completed": the15DayCompleted.toJson(),
  };
}

class The15Day {
  final double calories;
  final double protein;
  final double fat;
  final double carbs;

  The15Day({
    required this.calories,
    required this.protein,
    required this.fat,
    required this.carbs,
  });

  factory The15Day.fromRawJson(String str) =>
      The15Day.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory The15Day.fromJson(Map<String, dynamic> json) => The15Day(
    calories: json["calories"],
    protein: json["protein"],
    fat: json["fat"],
    carbs: json["carbs"],
  );

  Map<String, dynamic> toJson() => {
    "calories": calories,
    "protein": protein,
    "fat": fat,
    "carbs": carbs,
  };
}

class TodayMeal {
  final String ingredientsEn;
  final String grams;
  final String eatingTime;
  final String mealType;
  final Recipe recipe;
  bool completed;
  final int id;

  TodayMeal({
    required this.ingredientsEn,
    required this.grams,
    required this.eatingTime,
    required this.mealType,
    required this.recipe,
    required this.completed,
    required this.id,
  });

  factory TodayMeal.fromRawJson(String str) =>
      TodayMeal.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory TodayMeal.fromJson(Map<String, dynamic> json) => TodayMeal(
    ingredientsEn: json["ingredients_en"],
    grams: json["grams"],
    eatingTime: json["eating_time"],
    mealType: json["meal_type"],
    recipe: Recipe.fromJson(json["recipe"]),
    completed: json["completed"],
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "ingredients_en": ingredientsEn,
    "grams": grams,
    "eating_time": eatingTime,
    "meal_type": mealType,
    "recipe": recipe.toJson(),
    "completed": completed,
    "id": id,
  };
}
