abstract class PreferencesTranslation {
  String get title;
  String get dietaryRestrictions;
  String get fitnessGoals;
  String get weightLoss;
  String get muscleGain;
  String get maintenance;
  String get vegetarian;
  String get vegan;
  String get glutenFree;
  String get dairyFree;
  String get none;
}

class PreferencesEnglish implements PreferencesTranslation {
  @override String get title => "Preferences";
  @override String get dietaryRestrictions => "Dietary Restrictions";
  @override String get fitnessGoals => "Fitness Goals";
  @override String get weightLoss => "Weight Loss";
  @override String get muscleGain => "Muscle Gain";
  @override String get maintenance => "Maintenance";
  @override String get vegetarian => "Vegetarian";
  @override String get vegan => "Vegan";
  @override String get glutenFree => "Gluten Free";
  @override String get dairyFree => "Dairy Free";
  @override String get none => "None";
}

class PreferencesSpanish implements PreferencesTranslation {
  @override String get title => "Preferencias";
  @override String get dietaryRestrictions => "Restricciones Dietéticas";
  @override String get fitnessGoals => "Objetivos de Fitness";
  @override String get weightLoss => "Pérdida de Peso";
  @override String get muscleGain => "Ganancia de Músculo";
  @override String get maintenance => "Mantenimiento";
  @override String get vegetarian => "Vegetariano";
  @override String get vegan => "Vegano";
  @override String get glutenFree => "Sin Gluten";
  @override String get dairyFree => "Sin Lácteos";
  @override String get none => "Ninguno";
}