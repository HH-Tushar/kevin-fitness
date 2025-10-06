import 'package:flutter/material.dart';
import '/common/navigator.dart';
import '/presentation/landing/landing.dart';

class BasicInfoController extends ChangeNotifier {
  int step = 0;

  String abdominalValue = "";
  String sacroiliacValue = "";
  String subscapularisValue = "";
  String tricepsValue = "";
  String gender = "";
  String dateOfBirth = "";
  String weight = "";
  String height = "";
  String? fitnessLevel;
  String? whereTrain;
  String subLabel = "";
  String? howLongTrain;
  String? interestedWorkout;
  String injuries = "";
  String? routineDuration;
  List<String> subOptions = [];
  List<String> whereTrainSub = [];
  //preferences
  String dietaryPref = 'No preferences';
  List<String> allergies = [];
  List<String> foodPref = [];
  List<String> medicalCond = [];
  List<String> fitnessGoals = [];
  String lifestyleHabits = '3 Meals';
  bool isLoading = false;

  void updateTrainingInstruments(List<String> e) {
    whereTrainSub = e;
    notify();
  }

  void setDietaryPref(List<String> v) {
    dietaryPref = v.first;
    notify();
  }

  void setAllergies(List<String> v) {
    // Logic to ensure 'No allergies' is exclusive
    if (v.contains('No allergies') && v.length > 1) {
      allergies = ['No allergies'];
    } else if (v.contains('No allergies') &&
        v.length == 1 &&
        v.first == 'No allergies') {
      allergies = v;
    } else if (v.contains('No allergies') && v.isEmpty) {
      allergies = []; // Should not happen with current card logic
    } else {
      allergies = v.where((element) => element != 'No allergies').toList();
    }
    notify();
  }

  void setFoodPref(List<String> v) {
    foodPref = v;
    notify();
  }

  void setMedicalCond(List<String> v) {
    medicalCond = v;
    notify();
  }

  void setFitnessGoals(List<String> v) {
    fitnessGoals = v;
    notify();
  }

  void setLifestyleHabits(List<String> v) {
    lifestyleHabits = v.first;
    notify();
  }

  void updateSubOption() {
    switch (whereTrain) {
      case 'At home':
        subOptions = [
          'Dumbbells',
          'Resistance Bands',
          'Pull-Up Bar',
          'Bench',
          'No equipment',
        ];
        subLabel = 'At home';
        break;
      case 'At gym':
        subOptions = [
          'Barbell',
          'Squat Rack',
          'Cable Machine',
          'Smith Machine',
        ];
        subLabel = 'At gym';
        break;
      case 'Martial arts':
      case 'Running':
      case 'Other sports':
        subOptions = ['Running', 'Football', 'Swimming'];
        subLabel = 'Martial Arts / Running / Other Sports';
        break;
      default:
        subOptions = [];
        subLabel = '';
    }
    whereTrainSub = [];
    notify();
  }

  toggleStep(int val) {
    step = val;
    notify();
  }

  Future<void> uploadDetails(BuildContext context) async {
    //api call

    animatedNavigateReplaceAll(context, LandingView());
  }

  void notify() {
    if (hasListeners) notifyListeners();
  }
}
