import 'dart:convert';

class AiGeneratedMealPlans {
  final Status status;
  final List<Day> days;

  AiGeneratedMealPlans({required this.status, required this.days});

  factory AiGeneratedMealPlans.fromRawJson(String str) =>
      AiGeneratedMealPlans.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AiGeneratedMealPlans.fromJson(Map<String, dynamic> json) =>
      AiGeneratedMealPlans(
        status: Status.fromJson(json["status"]),
        days: List<Day>.from(json["days"].map((x) => Day.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
    "status": status.toJson(),
    "days": List<dynamic>.from(days.map((x) => x.toJson())),
  };
}

class Day {
  final int id;
  final DateTime date;
  final List<Meal> meals;

  Day({required this.id, required this.date, required this.meals});

  factory Day.fromRawJson(String str) => Day.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Day.fromJson(Map<String, dynamic> json) => Day(
    id: json["id"],
    date: DateTime.parse(json["date"]),
    meals: List<Meal>.from(json["meals"].map((x) => Meal.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "date":
        "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
    "meals": List<dynamic>.from(meals.map((x) => x.toJson())),
  };
}

class Meal {
  final String mealType;
  final Recipe recipe;

  Meal({required this.mealType, required this.recipe});

  factory Meal.fromRawJson(String str) => Meal.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Meal.fromJson(Map<String, dynamic> json) => Meal(
    mealType: json["meal_type"],
    recipe: Recipe.fromJson(json["recipe"]),
  );

  Map<String, dynamic> toJson() => {
    "meal_type": mealType,
    "recipe": recipe.toJson(),
  };
}

class Recipe {
  final String image;
  final String calories;

  Recipe({required this.image, required this.calories});

  factory Recipe.fromRawJson(String str) => Recipe.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Recipe.fromJson(Map<String, dynamic> json) =>
      Recipe(image: json["image"], calories: json["calories"]);

  Map<String, dynamic> toJson() => {"image": image, "calories": calories};
}

class Status {
  final int day;
  final double totalCalories;
  final int totalMeals;
  final DateTime startDate;
  final DateTime endDate;

  Status({
    required this.day,
    required this.totalCalories,
    required this.totalMeals,
    required this.startDate,
    required this.endDate,
  });

  factory Status.fromRawJson(String str) => Status.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Status.fromJson(Map<String, dynamic> json) => Status(
    day: json["day"],
    totalCalories: json["total_calories"],
    totalMeals: json["total_meals"],
    startDate: DateTime.parse(json["start_date"]),
    endDate: DateTime.parse(json["end_date"]),
  );

  Map<String, dynamic> toJson() => {
    "day": day,
    "total_calories": totalCalories,
    "total_meals": totalMeals,
    "start_date":
        "${startDate.year.toString().padLeft(4, '0')}-${startDate.month.toString().padLeft(2, '0')}-${startDate.day.toString().padLeft(2, '0')}",
    "end_date":
        "${endDate.year.toString().padLeft(4, '0')}-${endDate.month.toString().padLeft(2, '0')}-${endDate.day.toString().padLeft(2, '0')}",
  };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
