abstract class SummaryTranslation {
  String get title;
  String get weightTracking;
  String get progressOverview;
  String get weightChangeComparison;
  String get skinfoldChanges;
  String get workoutAdherence;
  String get dietAdherence;
  String get aiFeedback;
  String get daysCompleted;
  String get withinCalorieGoals;
  String get abdominal;
  String get subscapularis;
  String get sacroiliac;
  String get triceps;
}

class SummaryEnglish implements SummaryTranslation {
  @override String get title => "Summary";
  @override String get weightTracking => "Weight Tracking";
  @override String get progressOverview => "Progress Overview";
  @override String get weightChangeComparison => "Weight Change Comparison";
  @override String get skinfoldChanges => "Skinfold Change Charts";
  @override String get workoutAdherence => "Workout Adherence";
  @override String get dietAdherence => "Diet Adherence";
  @override String get aiFeedback => "AI Feedback";
  @override String get daysCompleted => "Days Completed";
  @override String get withinCalorieGoals => "Within Calorie Goals";
  @override String get abdominal => "Abdominal";
  @override String get subscapularis => "Subscapularis";
  @override String get sacroiliac => "Sacroiliac";
  @override String get triceps => "Triceps";
}

class SummarySpanish implements SummaryTranslation {
  @override String get title => "Resumen";
  @override String get weightTracking => "Seguimiento de Peso";
  @override String get progressOverview => "Resumen de Progreso";
  @override String get weightChangeComparison => "Comparación de cambio de peso";
  @override String get skinfoldChanges => "Gráficos de cambios en pliegues de grasa corporal";
  @override String get workoutAdherence => "Adherencia al Ejercicio";
  @override String get dietAdherence => "Adherencia a la Dieta";
  @override String get aiFeedback => "Retroalimentación de IA";
  @override String get daysCompleted => "días completados";
  @override String get withinCalorieGoals => "Dentro de los objetivos de calorías";
  @override String get abdominal => "Abdominal";
  @override String get subscapularis => "Subescapular";
  @override String get sacroiliac => "Sacroilíaco";
  @override String get triceps => "Tríceps";
}