import 'dart:convert';

class UserProfile {
    final int id;
     String image;
     List<String> atHome;
     List<String> atGym;
     List<String> martialArts;
     List<String> running;
     List<String> otherSports;
     List<String> allergies;
     List<String> foodPreference;
     List<String> medicalConditions;
     List<String> fitnessGoals;
     String fullname;
     String gender;
     DateTime dateOfBirth;
     double weight;
     double height;
     double abdominal;
     double sacroiliac;
     double subscapularis;
     double triceps;
     String fitnessLevel;
     String trainer;
     String trainDuration;
     String interestedWorkout;
     String injuriesDiscomfort;
     String routineDuration;
     String dietaryPreferences;
     String lifestyleHabits;
     int user;

    UserProfile({
        required this.id,
        required this.image,
        required this.atHome,
        required this.atGym,
        required this.martialArts,
        required this.running,
        required this.otherSports,
        required this.allergies,
        required this.foodPreference,
        required this.medicalConditions,
        required this.fitnessGoals,
        required this.fullname,
        required this.gender,
        required this.dateOfBirth,
        required this.weight,
        required this.height,
        required this.abdominal,
        required this.sacroiliac,
        required this.subscapularis,
        required this.triceps,
        required this.fitnessLevel,
        required this.trainer,
        required this.trainDuration,
        required this.interestedWorkout,
        required this.injuriesDiscomfort,
        required this.routineDuration,
        required this.dietaryPreferences,
        required this.lifestyleHabits,
        required this.user,
    });

    factory UserProfile.fromRawJson(String str) => UserProfile.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory UserProfile.fromJson(Map<String, dynamic> json) => UserProfile(
        id: json["id"],
        image: json["image"],
        atHome: List<String>.from(json["at_home"].map((x) => x)),
        atGym: List<String>.from(json["at_gym"].map((x) => x)),
        martialArts: List<String>.from(json["martial_arts"].map((x) => x)),
        running: List<String>.from(json["running"].map((x) => x)),
        otherSports: List<String>.from(json["other_sports"].map((x) => x)),
        allergies: List<String>.from(json["allergies"].map((x) => x)),
        foodPreference: List<String>.from(json["food_preference"].map((x) => x)),
        medicalConditions: List<String>.from(json["medical_conditions"].map((x) => x)),
        fitnessGoals: List<String>.from(json["fitness_goals"].map((x) => x)),
        fullname: json["fullname"],
        gender: json["gender"],
        dateOfBirth: DateTime.parse(json["date_of_birth"]),
        weight: json["weight"],
        height: json["height"],
        abdominal: json["abdominal"],
        sacroiliac: json["sacroiliac"],
        subscapularis: json["subscapularis"],
        triceps: json["triceps"],
        fitnessLevel: json["fitness_level"],
        trainer: json["trainer"],
        trainDuration: json["train_duration"],
        interestedWorkout: json["interested_workout"],
        injuriesDiscomfort: json["injuries_discomfort"],
        routineDuration: json["routine_duration"],
        dietaryPreferences: json["dietary_preferences"],
        lifestyleHabits: json["lifestyle_habits"],
        user: json["user"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "image": image,
        "at_home": List<dynamic>.from(atHome.map((x) => x)),
        "at_gym": List<dynamic>.from(atGym.map((x) => x)),
        "martial_arts": List<dynamic>.from(martialArts.map((x) => x)),
        "running": List<dynamic>.from(running.map((x) => x)),
        "other_sports": List<dynamic>.from(otherSports.map((x) => x)),
        "allergies": List<dynamic>.from(allergies.map((x) => x)),
        "food_preference": List<dynamic>.from(foodPreference.map((x) => x)),
        "medical_conditions": List<dynamic>.from(medicalConditions.map((x) => x)),
        "fitness_goals": List<dynamic>.from(fitnessGoals.map((x) => x)),
        "fullname": fullname,
        "gender": gender,
        "date_of_birth": "${dateOfBirth.year.toString().padLeft(4, '0')}-${dateOfBirth.month.toString().padLeft(2, '0')}-${dateOfBirth.day.toString().padLeft(2, '0')}",
        "weight": weight,
        "height": height,
        "abdominal": abdominal,
        "sacroiliac": sacroiliac,
        "subscapularis": subscapularis,
        "triceps": triceps,
        "fitness_level": fitnessLevel,
        "trainer": trainer,
        "train_duration": trainDuration,
        "interested_workout": interestedWorkout,
        "injuries_discomfort": injuriesDiscomfort,
        "routine_duration": routineDuration,
        "dietary_preferences": dietaryPreferences,
        "lifestyle_habits": lifestyleHabits,
        "user": user,
    };
}
