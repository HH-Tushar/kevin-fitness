import 'dart:convert';

class DailyWorkoutPlanDetails {
    final List<WorkoutElement> workouts;
    final Status status;

    DailyWorkoutPlanDetails({
        required this.workouts,
        required this.status,
    });

    factory DailyWorkoutPlanDetails.fromRawJson(String str) => DailyWorkoutPlanDetails.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory DailyWorkoutPlanDetails.fromJson(Map<String, dynamic> json) => DailyWorkoutPlanDetails(
        workouts: List<WorkoutElement>.from(json["workouts"].map((x) => WorkoutElement.fromJson(x))),
        status: Status.fromJson(json["status"]),
    );

    Map<String, dynamic> toJson() => {
        "workouts": List<dynamic>.from(workouts.map((x) => x.toJson())),
        "status": status.toJson(),
    };
}

class Status {
    final int totalWorkout;
    final int totalDurationMinutes;
    final double totalCaloriesBurn;

    Status({
        required this.totalWorkout,
        required this.totalDurationMinutes,
        required this.totalCaloriesBurn,
    });

    factory Status.fromRawJson(String str) => Status.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Status.fromJson(Map<String, dynamic> json) => Status(
        totalWorkout: json["total_workout"],
        totalDurationMinutes: json["total_duration_minutes"],
        totalCaloriesBurn: json["total_calories_burn"]?.toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "total_workout": totalWorkout,
        "total_duration_minutes": totalDurationMinutes,
        "total_calories_burn": totalCaloriesBurn,
    };
}

class WorkoutElement {
    final int setOf;
    final int reps;
    final bool completed;
    final Workout workout;

    WorkoutElement({
        required this.setOf,
        required this.reps,
        required this.completed,
        required this.workout,
    });

    factory WorkoutElement.fromRawJson(String str) => WorkoutElement.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory WorkoutElement.fromJson(Map<String, dynamic> json) => WorkoutElement(
        setOf: json["set_of"],
        reps: json["reps"],
        completed: json["completed"],
        workout: Workout.fromJson(json["workout"]),
    );

    Map<String, dynamic> toJson() => {
        "set_of": setOf,
        "reps": reps,
        "completed": completed,
        "workout": workout.toJson(),
    };
}

class Workout {
    final String workoutName;
    final String timeNeeded;
    final String forBodyPart;
    final String workoutType;
    final String caloriesBurn;
    final String equipmentNeeded;
    final String tag;
    final String image;
    final String benefits;
    final String uniqueId;

    Workout({
        required this.workoutName,
        required this.timeNeeded,
        required this.forBodyPart,
        required this.workoutType,
        required this.caloriesBurn,
        required this.equipmentNeeded,
        required this.tag,
        required this.image,
        required this.benefits,
        required this.uniqueId,
    });

    factory Workout.fromRawJson(String str) => Workout.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Workout.fromJson(Map<String, dynamic> json) => Workout(
        workoutName: json["workout_name"],
        timeNeeded: json["time_needed"],
        forBodyPart: json["for_body_part"],
        workoutType: json["workout_type"],
        caloriesBurn: json["calories_burn"],
        equipmentNeeded: json["equipment_needed"],
        tag: json["tag"],
        image: json["image"],
        benefits: json["benefits"],
        uniqueId: json["unique_id"],
    );

    Map<String, dynamic> toJson() => {
        "workout_name": workoutName,
        "time_needed": timeNeeded,
        "for_body_part": forBodyPart,
        "workout_type": workoutType,
        "calories_burn": caloriesBurn,
        "equipment_needed": equipmentNeeded,
        "tag": tag,
        "image": image,
        "benefits": benefits,
        "unique_id": uniqueId,
    };
}
