abstract class WorkoutTranslation {
  String get title;
  String get workoutDuration;
  String get workoutFrequency;
  String get workoutType;
  String get beginner;
  String get intermediate;
  String get advanced;
  String get cardio;
  String get strength;
  String get flexibility;
  String get mixed;
}

class WorkoutEnglish implements WorkoutTranslation {
  @override String get title => "Workout";
  @override String get workoutDuration => "Workout Duration";
  @override String get workoutFrequency => "Workout Frequency";
  @override String get workoutType => "Workout Type";
  @override String get beginner => "Beginner";
  @override String get intermediate => "Intermediate";
  @override String get advanced => "Advanced";
  @override String get cardio => "Cardio";
  @override String get strength => "Strength";
  @override String get flexibility => "Flexibility";
  @override String get mixed => "Mixed";
}

class WorkoutSpanish implements WorkoutTranslation {
  @override String get title => "Ejercicio";
  @override String get workoutDuration => "Duración del Ejercicio";
  @override String get workoutFrequency => "Frecuencia de Ejercicio";
  @override String get workoutType => "Tipo de Ejercicio";
  @override String get beginner => "Principiante";
  @override String get intermediate => "Intermedio";
  @override String get advanced => "Avanzado";
  @override String get cardio => "Cardio";
  @override String get strength => "Fuerza";
  @override String get flexibility => "Flexibilidad";
  @override String get mixed => "Mixto";
}