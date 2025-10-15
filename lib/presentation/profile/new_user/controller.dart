import 'package:flutter/material.dart';
import 'package:kenvinorellana/application/auth/auth_controller.dart';
import 'package:kenvinorellana/application/auth/models/user_profile_model.dart';
import 'package:kenvinorellana/common/snack_bar.dart';
import 'package:provider/provider.dart';
import '/common/navigator.dart';
import '/presentation/landing/landing.dart';

class BasicInfoController extends ChangeNotifier {
  int step = 0;

  final basicInfoFormKey = GlobalKey<FormState>();
  final basicSkinInfoFormKey = GlobalKey<FormState>();
  final preferrenceFormKey = GlobalKey<FormState>();
  final workoutFormKey = GlobalKey<FormState>();
  // final _formKey = GlobalKey<FormState>();

  String fullName = "";
  String abdominalValue = "";
  String sacroiliacValue = "";
  String subscapularisValue = "";
  String tricepsValue = "";
  String gender = "";
  DateTime? dateOfBirth;
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
    isLoading = true;
    notify();
    final (
      data,
      error,
    ) = await Provider.of<AuthController>(context, listen: false).updateProfile(
      userProfile: UserProfile(
        image: "",
        atHome: whereTrain == "At home" ? whereTrainSub : [],
        atGym: whereTrain == "At gym" ? whereTrainSub : [],
        martialArts: whereTrain == "Martial arts" ? whereTrainSub : [],
        running: whereTrain == "Running" ? whereTrainSub : [],

        otherSports: whereTrain == "Other sports" ? whereTrainSub : [],
        allergies: allergies,
        foodPreference: foodPref,
        medicalConditions: medicalCond,
        fitnessGoals: fitnessGoals,
        fullname: fullName,
        gender: gender,
        dateOfBirth: dateOfBirth!,
        weight: double.parse(weight),
        height: double.parse(height),
        abdominal: double.parse(abdominalValue),
        sacroiliac: double.parse(sacroiliacValue),
        subscapularis: double.parse(subscapularisValue),
        triceps: double.parse(tricepsValue),
        fitnessLevel: fitnessLevel!,
        trainer: whereTrain!,
        trainDuration: howLongTrain ?? "",
        interestedWorkout: interestedWorkout ?? "",
        injuriesDiscomfort: injuries,
        routineDuration: routineDuration ?? "",
        dietaryPreferences: dietaryPref,
        lifestyleHabits: lifestyleHabits,
        user: 0,
      ),
      language: "english",
    );

    if (data != null) {
      showToast(
        context: context,
        title: "Successfully updated the profile",
        isSuccess: true,
      );
      animatedNavigateReplaceAll(context, LandingView());
    } else {
      showToast(
        context: context,
        title: error?.title ?? "Something went wrong",
        isSuccess: false,
      );
    }
    isLoading = false;
    notify();
  }

  void notify() {
    if (hasListeners) notifyListeners();
  }
}
