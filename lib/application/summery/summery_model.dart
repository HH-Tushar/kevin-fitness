import 'dart:convert';

class UserAchievementModel {
  final Info info;
  final int totalCompletedWorkoutDays;
  final int totalCompletedMealDays;
  final List<double> weightsList;

  UserAchievementModel({
    required this.info,
    required this.totalCompletedWorkoutDays,
    required this.totalCompletedMealDays,
    required this.weightsList,
  });

  factory UserAchievementModel.fromRawJson(String str) =>
      UserAchievementModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory UserAchievementModel.fromJson(Map<String, dynamic> json) =>
      UserAchievementModel(
        info: Info.fromJson(json["info"]),
        totalCompletedWorkoutDays: json["total_completed_workout_days"],
        totalCompletedMealDays: json["total_completed_meal_days"],
        weightsList: List<double>.from(json["weights_list"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
    "info": info.toJson(),
    "total_completed_workout_days": totalCompletedWorkoutDays,
    "total_completed_meal_days": totalCompletedMealDays,
    "weights_list": List<dynamic>.from(weightsList.map((x) => x)),
  };
}

class Info {
  final Achievement achievement;
  final LatestMealPlan latestMealPlan;
  final LatestWorkoutPlan latestWorkoutPlan;

  Info({
    required this.achievement,
    required this.latestMealPlan,
    required this.latestWorkoutPlan,
  });

  factory Info.fromRawJson(String str) => Info.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Info.fromJson(Map<String, dynamic> json) => Info(
    achievement: Achievement.fromJson(json["achievement"]),
    latestMealPlan: LatestMealPlan.fromJson(json["latest_meal_plan"]),
    latestWorkoutPlan: LatestWorkoutPlan.fromJson(json["latest_workout_plan"]),
  );

  Map<String, dynamic> toJson() => {
    "achievement": achievement.toJson(),
    "latest_meal_plan": latestMealPlan.toJson(),
    "latest_workout_plan": latestWorkoutPlan.toJson(),
  };
}

class Achievement {
  final String weightChange;
  final String abdominalChange;
  final String sacrolicChange;
  final String subscapularisChange;
  final String tricepsChange;
  final bool weightIncrease;
  final bool abdominalIncrease;
  final bool sacrolicIncrease;
  final bool subscapularisIncrease;
  final bool tricepsIncrease;
  final DateTime achievementDate;
  final DateTime createTime;
  final DateTime updateTime;

  Achievement({
    required this.weightChange,
    required this.abdominalChange,
    required this.sacrolicChange,
    required this.subscapularisChange,
    required this.tricepsChange,
    required this.weightIncrease,
    required this.abdominalIncrease,
    required this.sacrolicIncrease,
    required this.subscapularisIncrease,
    required this.tricepsIncrease,
    required this.achievementDate,
    required this.createTime,
    required this.updateTime,
  });

  factory Achievement.fromRawJson(String str) =>
      Achievement.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Achievement.fromJson(Map<String, dynamic> json) => Achievement(
    weightChange: json["weight_change"],
    abdominalChange: json["abdominal_change"],
    sacrolicChange: json["sacrolic_change"],
    subscapularisChange: json["subscapularis_change"],
    tricepsChange: json["triceps_change"],
    weightIncrease: json["weight_increase"],
    abdominalIncrease: json["abdominal_increase"],
    sacrolicIncrease: json["sacrolic_increase"],
    subscapularisIncrease: json["subscapularis_increase"],
    tricepsIncrease: json["triceps_increase"],
    achievementDate: DateTime.parse(json["achievement_date"]),
    createTime: DateTime.parse(json["create_time"]),
    updateTime: DateTime.parse(json["update_time"]),
  );

  Map<String, dynamic> toJson() => {
    "weight_change": weightChange,
    "abdominal_change": abdominalChange,
    "sacrolic_change": sacrolicChange,
    "subscapularis_change": subscapularisChange,
    "triceps_change": tricepsChange,
    "weight_increase": weightIncrease,
    "abdominal_increase": abdominalIncrease,
    "sacrolic_increase": sacrolicIncrease,
    "subscapularis_increase": subscapularisIncrease,
    "triceps_increase": tricepsIncrease,
    "achievement_date":
        "${achievementDate.year.toString().padLeft(4, '0')}-${achievementDate.month.toString().padLeft(2, '0')}-${achievementDate.day.toString().padLeft(2, '0')}",
    "create_time": createTime.toIso8601String(),
    "update_time": updateTime.toIso8601String(),
  };
}

class LatestMealPlan {
  final String mealPlanName;
  final DateTime startDate;
  final DateTime endDate;
  final bool isCompleted;
  final int totalMealsCompleted;

  LatestMealPlan({
    required this.mealPlanName,
    required this.startDate,
    required this.endDate,
    required this.isCompleted,
    required this.totalMealsCompleted,
  });

  factory LatestMealPlan.fromRawJson(String str) =>
      LatestMealPlan.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory LatestMealPlan.fromJson(Map<String, dynamic> json) => LatestMealPlan(
    mealPlanName: json["meal_plan_name"],
    startDate: DateTime.parse(json["start_date"]),
    endDate: DateTime.parse(json["end_date"]),
    isCompleted: json["is_completed"],
    totalMealsCompleted: json["total_meals_completed"],
  );

  Map<String, dynamic> toJson() => {
    "meal_plan_name": mealPlanName,
    "start_date":
        "${startDate.year.toString().padLeft(4, '0')}-${startDate.month.toString().padLeft(2, '0')}-${startDate.day.toString().padLeft(2, '0')}",
    "end_date":
        "${endDate.year.toString().padLeft(4, '0')}-${endDate.month.toString().padLeft(2, '0')}-${endDate.day.toString().padLeft(2, '0')}",
    "is_completed": isCompleted,
    "total_meals_completed": totalMealsCompleted,
  };
}

class LatestWorkoutPlan {
  final String workoutPlanName;
  final DateTime startDate;
  final DateTime endDate;
  final bool isCompleted;
  final int totalWorkoutsCompleted;

  LatestWorkoutPlan({
    required this.workoutPlanName,
    required this.startDate,
    required this.endDate,
    required this.isCompleted,
    required this.totalWorkoutsCompleted,
  });

  factory LatestWorkoutPlan.fromRawJson(String str) =>
      LatestWorkoutPlan.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory LatestWorkoutPlan.fromJson(Map<String, dynamic> json) =>
      LatestWorkoutPlan(
        workoutPlanName: json["workout_plan_name"],
        startDate: DateTime.parse(json["start_date"]),
        endDate: DateTime.parse(json["end_date"]),
        isCompleted: json["is_completed"],
        totalWorkoutsCompleted: json["total_workouts_completed"],
      );

  Map<String, dynamic> toJson() => {
    "workout_plan_name": workoutPlanName,
    "start_date":
        "${startDate.year.toString().padLeft(4, '0')}-${startDate.month.toString().padLeft(2, '0')}-${startDate.day.toString().padLeft(2, '0')}",
    "end_date":
        "${endDate.year.toString().padLeft(4, '0')}-${endDate.month.toString().padLeft(2, '0')}-${endDate.day.toString().padLeft(2, '0')}",
    "is_completed": isCompleted,
    "total_workouts_completed": totalWorkoutsCompleted,
  };
}
