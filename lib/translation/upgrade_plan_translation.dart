abstract class UpgradePlanTranslation {
  String get title;
  String get unlockPremium;
  String get aiGeneratedGoal;
  String get aiGeneratedMeal;
  String get aiGeneratedWorkout;
  String get weeklyProgress;
  String get pickYourPlan;
  String get joinNow;
  String get bestValue;
  String get loading;
  String get errorLoading;
}

class UpgradePlanEnglish implements UpgradePlanTranslation {
  @override String get title => "Upgrade Your Plan";
  @override String get unlockPremium => "Unlock Premium";
  @override String get aiGeneratedGoal => "AI-generated goal based on your needs";
  @override String get aiGeneratedMeal => "AI-generated meal recipe and cheat meal";
  @override String get aiGeneratedWorkout => "AI-generated workout plan";
  @override String get weeklyProgress => "Updated with weekly progress";
  @override String get pickYourPlan => "Pick your plan";
  @override String get joinNow => "Join Now";
  @override String get bestValue => "BEST VALUE";
  @override String get loading => "Loading packages...";
  @override String get errorLoading => "Error loading packages";
}

class UpgradePlanSpanish implements UpgradePlanTranslation {
  @override String get title => "Actualizar tu plan";
  @override String get unlockPremium => "Desbloquear Premium";
  @override String get aiGeneratedGoal => "Meta generada por IA según tu necesidad";
  @override String get aiGeneratedMeal => "Receta de comida generada por IA y comida trampa";
  @override String get aiGeneratedWorkout => "Plan de entrenamiento generado por IA";
  @override String get weeklyProgress => "Actualizado con progreso semanal";
  @override String get pickYourPlan => "Elige tu plan";
  @override String get joinNow => "Únete Ahora";
  @override String get bestValue => "MEJOR VALOR";
  @override String get loading => "Cargando paquetes...";
  @override String get errorLoading => "Error al cargar paquetes";
}