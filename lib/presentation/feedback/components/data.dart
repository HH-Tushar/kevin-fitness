part of '../feedback_view.dart';

int currentWeight = 0;
int abdominal = 0;
int sacroiliac = 0;
int subscapularis = 0;
int triceps = 0;
int total_meal = 0;
int energy_level = 1;
String injuries_pain = "No";
String workout_consistency = "All";
String feeling = "Happy";

Map<String, dynamic> feedbackData = {
  'current_weight': currentWeight,
  'abdominal': abdominal,
  'sacroiliac': sacroiliac,
  'subscapularis': subscapularis,
  'triceps': triceps,
  'feeling': feeling,
  'total_meal': total_meal,
  'workout_consistency': workout_consistency,
  'energy_level': energy_level,
  'injuries_pain': injuries_pain,
};

_fieldRequired(String? val) {
  if (val == null || val.isEmpty) {
    return "This field is required";
  }
  return null;
}
