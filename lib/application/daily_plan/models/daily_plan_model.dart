import 'dart:convert';

class DailyPlans {
  final DateTime date;
  final DailyMeal dailyMeal;
  final DailyWorkout dailyWorkout;
  final AiRecomended aiRecomended;

  DailyPlans({
    required this.date,
    required this.dailyMeal,
    required this.dailyWorkout,
    required this.aiRecomended,
  });

  factory DailyPlans.fromRawJson(String str) =>
      DailyPlans.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory DailyPlans.fromJson(Map<String, dynamic> json) => DailyPlans(
    date: DateTime.parse(json["date"]),
    dailyMeal: DailyMeal.fromJson(json["daily_meal"]),
    dailyWorkout: DailyWorkout.fromJson(json["daily_workout"]),
    aiRecomended: AiRecomended.fromJson(json["AiRecomended"]),
  );

  Map<String, dynamic> toJson() => {
    "date":
        "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
    "daily_meal": dailyMeal.toJson(),
    "daily_workout": dailyWorkout.toJson(),
    "AiRecomended": aiRecomended.toJson(),
  };
}

class AiRecomended {
  final double waterNeedLitersPerDay;
  final double sleepNeedHoursPerDay;
  final int totalCaloriesPerDay;
  final double perfectWeightKg;

  AiRecomended({
    required this.waterNeedLitersPerDay,
    required this.sleepNeedHoursPerDay,
    required this.totalCaloriesPerDay,
    required this.perfectWeightKg,
  });

  factory AiRecomended.fromRawJson(String str) =>
      AiRecomended.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AiRecomended.fromJson(Map<String, dynamic> json) => AiRecomended(
    waterNeedLitersPerDay: json["water_need_liters_per_day"]?.toDouble(),
    sleepNeedHoursPerDay: json["sleep_need_hours_per_day"],
    totalCaloriesPerDay: json["total_calories_per_day"],
    perfectWeightKg: json["perfect_weight_kg"],
  );

  Map<String, dynamic> toJson() => {
    "water_need_liters_per_day": waterNeedLitersPerDay,
    "sleep_need_hours_per_day": sleepNeedHoursPerDay,
    "total_calories_per_day": totalCaloriesPerDay,
    "perfect_weight_kg": perfectWeightKg,
  };
}

class DailyMeal {
  final DateTime date;
  final List<DailyMealEntry> entries;

  DailyMeal({required this.date, required this.entries});

  factory DailyMeal.fromRawJson(String str) =>
      DailyMeal.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory DailyMeal.fromJson(Map<String, dynamic> json) => DailyMeal(
    date: DateTime.parse(json["date"]),
    entries: List<DailyMealEntry>.from(
      json["entries"].map((x) => DailyMealEntry.fromJson(x)),
    ),
  );

  Map<String, dynamic> toJson() => {
    "date":
        "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
    "entries": List<dynamic>.from(entries.map((x) => x.toJson())),
  };
}

class DailyMealEntry {
  final int id;
  final String mealType;
  final String eatingTime;
  bool completed;

  DailyMealEntry({
    required this.id,
    required this.mealType,
    required this.eatingTime,
    required this.completed,
  });

  factory DailyMealEntry.fromRawJson(String str) =>
      DailyMealEntry.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory DailyMealEntry.fromJson(Map<String, dynamic> json) => DailyMealEntry(
    id: json["id"],
    mealType: json["meal_type"],
    eatingTime: json["eating_time"],
    completed: json["completed"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "meal_type": mealType,
    "eating_time": eatingTime,
    "completed": completed,
  };
}

class DailyWorkout {
  final DateTime date;
  final List<DailyWorkoutEntry> entries;

  DailyWorkout({required this.date, required this.entries});

  factory DailyWorkout.fromRawJson(String str) =>
      DailyWorkout.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory DailyWorkout.fromJson(Map<String, dynamic> json) => DailyWorkout(
    date: DateTime.parse(json["date"]),
    entries: List<DailyWorkoutEntry>.from(
      json["entries"].map((x) => DailyWorkoutEntry.fromJson(x)),
    ),
  );

  Map<String, dynamic> toJson() => {
    "date":
        "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
    "entries": List<dynamic>.from(entries.map((x) => x.toJson())),
  };
}

class DailyWorkoutEntry {
  final int id;
  final String? workoutName;
  final int setOf;
  final int reps;
  bool completed;

  DailyWorkoutEntry({
    required this.id,
    required this.workoutName,
    required this.setOf,
    required this.reps,
    required this.completed,
  });

  factory DailyWorkoutEntry.fromRawJson(String str) =>
      DailyWorkoutEntry.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory DailyWorkoutEntry.fromJson(Map<String, dynamic> json) =>
      DailyWorkoutEntry(
        id: json["id"],
        workoutName: json["workout_name"],
        setOf: json["set_of"],
        reps: json["reps"],
        completed: json["completed"],
      );

  Map<String, dynamic> toJson() => {
    "id": id,
    "workout_name": workoutName,
    "set_of": setOf,
    "reps": reps,
    "completed": completed,
  };
}
