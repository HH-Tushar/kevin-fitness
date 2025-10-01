import 'package:flutter/material.dart';

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

  void updateTrainingInstruments(List<String> e) {
    whereTrainSub = e;
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

  void notify() {
    if (hasListeners) notifyListeners();
  }
}
