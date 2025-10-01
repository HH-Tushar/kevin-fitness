abstract class HomeTranslation {
  String get title;
  String get welcome;
  String get todayGoal;
  String get weeklyProgress;
  String get waterIntake;
  String get caloriesBurned;
  String get steps;
  String get weeklyGoal;
  String get aiRecommended;
  String get calorieCount;
  String get sleep;
  String get water;
  String get motivationMessage;
  String get todaysMealIdea;
  String get yourWorkout;
  String get noMealPlan;
  String get noWorkoutPlan;
  String get eatNow;
  String get exercise;
  String get done;
  String get upcoming;
}

class HomeEnglish implements HomeTranslation {
  @override String get title => "Home";
  @override String get welcome => "Welcome";
  @override String get todayGoal => "Today's Goal";
  @override String get weeklyProgress => "Weekly Progress";
  @override String get waterIntake => "Water Intake";
  @override String get caloriesBurned => "Calories Burned";
  @override String get steps => "Steps";
  @override String get weeklyGoal => "Weekly Goal";
  @override String get aiRecommended => "AI Recommended";
  @override String get calorieCount => "Calorie Count";
  @override String get sleep => "Sleep";
  @override String get water => "Water";
  @override String get motivationMessage => "Every step counts forward. Keep going!";
  @override String get todaysMealIdea => "Today's Meal Idea";
  @override String get yourWorkout => "Your Workout";
  @override String get noMealPlan => "You have no meal plan today.";
  @override String get noWorkoutPlan => "You have no workout plan today.";
  @override String get eatNow => "Eat Now";
  @override String get exercise => "Exercise";
  @override String get done => "Done";
  @override String get upcoming => "Upcoming";
}


class HomeSpanish implements HomeTranslation {
  @override String get title => "Inicio";
  @override String get welcome => "Bienvenido";
  @override String get todayGoal => "Objetivo de Hoy";
  @override String get weeklyProgress => "Progreso Semanal";
  @override String get waterIntake => "Ingesta de Agua";
  @override String get caloriesBurned => "Calorías Quemadas";
  @override String get steps => "Pasos";
  @override String get weeklyGoal => "Meta Semanal";
  @override String get aiRecommended => "Recomendado por IA";
  @override String get calorieCount => "Conteo de calorías";
  @override String get sleep => "sueño";
  @override String get water => "Agua";
  @override String get motivationMessage => "Cada paso cuenta hacia adelante. ¡Continúa tu viaje!";
  @override String get todaysMealIdea => "Idea de Comida de Hoy";
  @override String get yourWorkout => "Tu Ejercicio";
  @override String get noMealPlan => "No tienes plan de comidas hoy.";
  @override String get noWorkoutPlan => "Hoy no tienes plan de ejercicio.";
  @override String get eatNow => "Comer Ahora";
  @override String get exercise => "Ejercicio";
  @override String get done => "Hecho";
  @override String get upcoming => "Próximo";
}