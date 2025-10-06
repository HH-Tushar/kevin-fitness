import 'dart:convert';

class DailyMealPlanDetails {
  final Status status;
  final List<Meal> meals;

  DailyMealPlanDetails({required this.status, required this.meals});

  factory DailyMealPlanDetails.fromRawJson(String str) =>
      DailyMealPlanDetails.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory DailyMealPlanDetails.fromJson(Map<String, dynamic> json) =>
      DailyMealPlanDetails(
        status: Status.fromJson(json["status"]),
        meals: List<Meal>.from(json["meals"].map((x) => Meal.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
    "status": status.toJson(),
    "meals": List<dynamic>.from(meals.map((x) => x.toJson())),
  };
}

class Meal {
  final String ingredientsEn;
  final String grams;
  final String eatingTime;
  final String mealType;
  final Recipe recipe;
  final bool completed;
  final int id;

  Meal({
    required this.ingredientsEn,
    required this.grams,
    required this.eatingTime,
    required this.mealType,
    required this.recipe,
    required this.completed,
    required this.id,
  });

  factory Meal.fromRawJson(String str) => Meal.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Meal.fromJson(Map<String, dynamic> json) => Meal(
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

class Recipe {
  final int id;
  final String uniqueId;
  final String image;
  final String recipeName;
  final String recipeType;
  final String forTime;
  final String tag;
  final String calories;
  final String carbs;
  final String protein;
  final String fat;
  final String makingTime;
  final String time;
  final String ratings;
  final String category;
  final String ingredients;
  final String instructions;
  final DateTime createdAt;
  final DateTime updatedAt;

  Recipe({
    required this.id,
    required this.uniqueId,
    required this.image,
    required this.recipeName,
    required this.recipeType,
    required this.forTime,
    required this.tag,
    required this.calories,
    required this.carbs,
    required this.protein,
    required this.fat,
    required this.makingTime,
    required this.time,
    required this.ratings,
    required this.category,
    required this.ingredients,
    required this.instructions,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Recipe.fromRawJson(String str) => Recipe.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Recipe.fromJson(Map<String, dynamic> json) => Recipe(
    id: json["id"],
    uniqueId: json["unique_id"],
    image: json["image"],
    recipeName: json["recipe_name"],
    recipeType: json["recipe_type"],
    forTime: json["for_time"],
    tag: json["tag"],
    calories: json["calories"],
    carbs: json["carbs"],
    protein: json["protein"],
    fat: json["fat"],
    makingTime: json["making_time"],
    time: json["time"],
    ratings: json["ratings"],
    category: json["category"],
    ingredients: json["ingredients"],
    instructions: json["instructions"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "unique_id": uniqueId,
    "image": image,
    "recipe_name": recipeName,
    "recipe_type": recipeType,
    "for_time": forTime,
    "tag": tag,
    "calories": calories,
    "carbs": carbs,
    "protein": protein,
    "fat": fat,
    "making_time": makingTime,
    "time": time,
    "ratings": ratings,
    "category": category,
    "ingredients": ingredients,
    "instructions": instructions,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}

class Status {
  final double totalProtein;
  final double totalCarbs;
  final double totalFat;

  Status({
    required this.totalProtein,
    required this.totalCarbs,
    required this.totalFat,
  });

  factory Status.fromRawJson(String str) => Status.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Status.fromJson(Map<String, dynamic> json) => Status(
    totalProtein: json["total_protein"],
    totalCarbs: json["total_carbs"],
    totalFat: json["total_fat"],
  );

  Map<String, dynamic> toJson() => {
    "total_protein": totalProtein,
    "total_carbs": totalCarbs,
    "total_fat": totalFat,
  };
}
