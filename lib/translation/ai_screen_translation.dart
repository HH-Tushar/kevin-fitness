abstract class AiScreenTranslation {
  String get title;
  String get yourProfile;
  String get goal;
  String get diet;
  String get level;
  String get currentWeight;
  String get aiWorkoutPlan;
  String get aiDietPlan;
  String get generateMealPlan;
  String get noWorkoutPlan;
  String get noMealPlan;
  String get noTags;
  String get active;
  String get completed;
  String get cancelled;
  String get days;
  String get loading;
  String get next;
  String get mealPlanGenerated;
  String get mealPlanFailed;
}

class AiScreenEnglish implements AiScreenTranslation {
  @override
  String get title => "AI Recommended";
  @override
  String get yourProfile => "Your Profile";
  @override
  String get goal => "Goal";
  @override
  String get diet => "Diet";
  @override
  String get level => "Level";
  @override
  String get currentWeight => "Current Weight";
  @override
  String get aiWorkoutPlan => "AI Workout Plan";
  @override
  String get aiDietPlan => "AI Diet Plan";
  @override
  String get generateMealPlan => "Generate Meal Plan";
  @override
  String get noWorkoutPlan => "No workout plan available";
  @override
  String get noMealPlan => "No meal plan available";
  @override
  String get noTags => "No tags";
  @override
  String get active => "Active";
  @override
  String get completed => "Completed";
  @override
  String get cancelled => "Cancelled";
  @override
  String get days => "Days";
  @override
  String get loading => "Loading recommendations...";
  @override
  String get next => "Next";
  @override
  String get mealPlanGenerated => "Meal plan generated successfully";
  @override
  String get mealPlanFailed => "Failed to generate meal plan";
}

class AiScreenSpanish implements AiScreenTranslation {
  @override
  String get title => "Recomendado por IA";
  @override
  String get yourProfile => "Tu Perfil";
  @override
  String get goal => "Objetivo";
  @override
  String get diet => "Dieta";
  @override
  String get level => "Nivel";
  @override
  String get currentWeight => "Peso Actual";
  @override
  String get aiWorkoutPlan => "Plan de Ejercicio IA";
  @override
  String get aiDietPlan => "Plan de Dieta IA";
  @override
  String get generateMealPlan => "Generar Plan de Comidas";
  @override
  String get noWorkoutPlan => "No hay plan de ejercicio disponible";
  @override
  String get noMealPlan => "No hay plan de comidas disponible";
  @override
  String get noTags => "Sin etiquetas";
  @override
  String get active => "Activo";
  @override
  String get completed => "Completado";
  @override
  String get cancelled => "Cancelado";
  @override
  String get days => "Días";
  @override
  String get loading => "Cargando recomendaciones...";
  @override
  String get next => "Siguiente";
  @override
  String get mealPlanGenerated => "Plan de comidas generado exitosamente";
  @override
  String get mealPlanFailed => "Error al generar el plan de comidas";
}
