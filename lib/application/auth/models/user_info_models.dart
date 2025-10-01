class UserInfo {
  final UserProfile profile;
  final List<MealPlan> mealPlans;
  final List<WorkoutPlan> workoutPlans;

  UserInfo({
    required this.profile,
    required this.mealPlans,
    required this.workoutPlans,
  });

  factory UserInfo.fromJson(Map<String, dynamic> json) {
    // Helper function to safely convert to list
    List<dynamic> _safeList(dynamic value) {
      if (value == null) return [];
      if (value is List) return value;
      if (value is Map) return [value]; // If it's a single object, wrap it in a list
      return [];
    }

    return UserInfo(
      profile: UserProfile.fromJson(json['profile'] ?? {}),
      mealPlans: _safeList(json['meal_plans'])
          .map((plan) => MealPlan.fromJson(plan))
          .toList(),
      workoutPlans: _safeList(json['workout_plans'])
          .map((plan) => WorkoutPlan.fromJson(plan))
          .toList(),
    );
  }
}

class UserProfile {
  final int id;
  final String interestedWorkout;
  final String fitnessLevel;
  final String dietaryPreferences;
  final double weight;

  UserProfile({
    required this.id,
    required this.interestedWorkout,
    required this.fitnessLevel,
    required this.dietaryPreferences,
    required this.weight,
  });

  factory UserProfile.fromJson(Map<String, dynamic> json) {
    return UserProfile(
      id: json['id'] ?? 0,
      interestedWorkout: json['interested_workout'] ?? '',
      fitnessLevel: json['fitness_level'] ?? '',
      dietaryPreferences: json['dietary_preferences'] ?? '',
      weight: (json['weight'] as num?)?.toDouble() ?? 0.0,
    );
  }
}

class MealPlan {
  final int id;
  final String mealPlanName;
  final String tags;
  final String startDate;
  final String endDate;
  final bool isCompleted;
  final bool isCancelled;

  MealPlan({
    required this.id,
    required this.mealPlanName,
    required this.tags,
    required this.startDate,
    required this.endDate,
    required this.isCompleted,
    required this.isCancelled,
  });

  factory MealPlan.fromJson(Map<String, dynamic> json) {
    return MealPlan(
      id: json['id'] ?? 0,
      mealPlanName: json['meal_plan_name'] ?? '',
      tags: json['tags'] ?? '',
      startDate: json['start_date'] ?? '',
      endDate: json['end_date'] ?? '',
      isCompleted: json['is_completed'] ?? false,
      isCancelled: json['is_cancelled'] ?? false,
    );
  }
}

class WorkoutPlan {
  final int id;
  final String workoutPlanName;
  final String tags;
  final String startDate;
  final String endDate;
  final bool isCompleted;
  final bool isCancelled;

  WorkoutPlan({
    required this.id,
    required this.workoutPlanName,
    required this.tags,
    required this.startDate,
    required this.endDate,
    required this.isCompleted,
    required this.isCancelled,
  });

  factory WorkoutPlan.fromJson(Map<String, dynamic> json) {
    return WorkoutPlan(
      id: json['id'] ?? 0,
      workoutPlanName: json['workout_plan_name'] ?? '',
      tags: json['tags'] ?? '',
      startDate: json['start_date'] ?? '',
      endDate: json['end_date'] ?? '',
      isCompleted: json['is_completed'] ?? false,
      isCancelled: json['is_cancelled'] ?? false,
    );
  }
} 