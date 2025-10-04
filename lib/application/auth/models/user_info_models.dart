import 'dart:convert';

class UserInfo {
    final Profile profile;
    final List<Plan> mealPlans;
    final List<Plan> workoutPlans;

    UserInfo({
        required this.profile,
        required this.mealPlans,
        required this.workoutPlans,
    });

    factory UserInfo.fromRawJson(String str) => UserInfo.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory UserInfo.fromJson(Map<String, dynamic> json) => UserInfo(
        profile: Profile.fromJson(json["profile"]),
        mealPlans: List<Plan>.from(json["meal_plans"].map((x) => Plan.fromJson(x))),
        workoutPlans: List<Plan>.from(json["workout_plans"].map((x) => Plan.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "profile": profile.toJson(),
        "meal_plans": List<dynamic>.from(mealPlans.map((x) => x.toJson())),
        "workout_plans": List<dynamic>.from(workoutPlans.map((x) => x.toJson())),
    };
}

class Plan {
    final int id;
    final String? mealPlanName;
    final String tags;
    final DateTime startDate;
    final DateTime endDate;
    final bool isCompleted;
    final bool isCancelled;
    final String? workoutPlanName;

    Plan({
        required this.id,
        this.mealPlanName,
        required this.tags,
        required this.startDate,
        required this.endDate,
        required this.isCompleted,
        required this.isCancelled,
        this.workoutPlanName,
    });

    factory Plan.fromRawJson(String str) => Plan.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Plan.fromJson(Map<String, dynamic> json) => Plan(
        id: json["id"],
        mealPlanName: json["meal_plan_name"],
        tags: json["tags"],
        startDate: DateTime.parse(json["start_date"]),
        endDate: DateTime.parse(json["end_date"]),
        isCompleted: json["is_completed"],
        isCancelled: json["is_cancelled"],
        workoutPlanName: json["workout_plan_name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "meal_plan_name": mealPlanName,
        "tags": tags,
        "start_date": "${startDate.year.toString().padLeft(4, '0')}-${startDate.month.toString().padLeft(2, '0')}-${startDate.day.toString().padLeft(2, '0')}",
        "end_date": "${endDate.year.toString().padLeft(4, '0')}-${endDate.month.toString().padLeft(2, '0')}-${endDate.day.toString().padLeft(2, '0')}",
        "is_completed": isCompleted,
        "is_cancelled": isCancelled,
        "workout_plan_name": workoutPlanName,
    };
}

class Profile {
    final int id;
    final String interestedWorkout;
    final String fitnessLevel;
    final String dietaryPreferences;
    final double weight;

    Profile({
        required this.id,
        required this.interestedWorkout,
        required this.fitnessLevel,
        required this.dietaryPreferences,
        required this.weight,
    });

    factory Profile.fromRawJson(String str) => Profile.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Profile.fromJson(Map<String, dynamic> json) => Profile(
        id: json["id"],
        interestedWorkout: json["interested_workout"],
        fitnessLevel: json["fitness_level"],
        dietaryPreferences: json["dietary_preferences"],
        weight: json["weight"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "interested_workout": interestedWorkout,
        "fitness_level": fitnessLevel,
        "dietary_preferences": dietaryPreferences,
        "weight": weight,
    };
}
