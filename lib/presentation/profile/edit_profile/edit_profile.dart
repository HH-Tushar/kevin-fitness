import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kenvinorellana/application/auth/auth_controller.dart';
import 'package:kenvinorellana/common/app_bars.dart';
import 'package:kenvinorellana/common/colors.dart';
import 'package:kenvinorellana/common/gaps.dart';
import 'package:provider/provider.dart';

import '../../../application/auth/models/user_profile_model.dart';
import '../../../translation/localization.dart';

part 'components/input.dart';

class UpdateProfile extends StatefulWidget {
  const UpdateProfile({super.key});

  @override
  State<UpdateProfile> createState() => _UpdateProfileState();
}

class _UpdateProfileState extends State<UpdateProfile> {
  // late TextEditingController _weightController = TextEditingController();
  // late TextEditingController _heightController = TextEditingController();
  // late TextEditingController _injuriesController = TextEditingController();

  UserProfile? profile;
  bool isLoading = false;

  fetchProfile() {
    setState(() {
      isLoading = true;
    });
    profile = UserProfile.fromJson(
      Provider.of<AuthController>(context, listen: false).userProfile!.toJson(),
    );

    print(profile?.abdominal);
    setState(() {
      isLoading = false;
    });
  }

  Future<void> update() async {
    // profile.weight = _weightController.text;

    final (
      data,
      error,
    ) = await Provider.of<AuthController>(context, listen: false).updateProfile(
      language: Provider.of<LanguageProvider>(
        context,
        listen: false,
      ).currentLanguage,
      userProfile: profile!,
    );
  }

  @override
  void initState() {
    fetchProfile();

    super.initState();
  }

  @override
  void dispose() {
    profile = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final LanguageProvider languageProvider = context.watch();

    final translator = languageProvider.profileUpdateTranslation;
    final translator2 = languageProvider.basicInfoTranslation;
    // final translator = languageProvider.profileUpdateTranslation;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                hPad5,
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back, color: customWhite),
                ),
                Expanded(
                  child: Text(
                    translator.updateProfile,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontFamily: 'Outfit',
                      fontWeight: FontWeight.w600,
                      height: 0.71,
                      letterSpacing: -0.5,
                    ),
                  ),
                ),
                hPad20,
                hPad20,
              ],
            ),

            vPad10,
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: defaultPadding),
                child: Column(
                  spacing: 15,
                  children: [
                    _buildSectionCard(
                      child: Column(
                        children: [
                          _buildInputField(
                            label: translator.weight,
                            initialValue: profile?.weight.toStringAsFixed(0),
                            inputFormate:
                                FilteringTextInputFormatter.digitsOnly,
                            onChanged: (value) {
                              final num = double.tryParse(value) ?? 0;
                              profile?.weight = num;
                            },
                            suffix: translator.kg,
                            icon: Icons.monitor_weight_outlined,
                          ),
                          vPad20,
                          _buildInputField(
                            label: translator.height,
                            initialValue: profile?.height.toStringAsFixed(0),
                            onChanged: (value) {
                              final num = double.tryParse(value) ?? 0;
                              profile?.height = num;
                            },
                            suffix: translator.cm,
                            icon: Icons.height,
                          ),
                        ],
                      ),
                    ),

                    // Workout Duration Section
                    _buildSectionCard(
                      child: _buildDropdownField(
                        label: translator.workoutDurationQuestion,
                        value: profile?.routineDuration,
                        items: ['1 Month', '2 Months', '3 Months', '6 Months'],
                        onChanged: (value) {
                          if (value != null) {
                            setState(() {
                              profile?.routineDuration = value;
                            });
                          }
                        },
                      ),
                    ),
                    // Fitness level
                    _buildSectionCard(
                      child: _buildDropdownField(
                        label: translator.fitnessLevel,
                        value: profile?.fitnessLevel,
                        items: [
                          'Beginner',
                          'Basic',
                          'Intermediate',
                          'Advanced',
                        ],
                        onChanged: (value) {
                          setState(() {
                            profile?.fitnessLevel = value ?? "Beginner";
                          });
                        },
                      ),
                    ),

                    _buildSectionCard(
                      child: _buildDropdownField(
                        label: translator.trainingLocation,
                        value: profile?.trainer,
                        items: ['At gym', 'At home', 'Outdoor', 'Mixed'],
                        onChanged: (value) {
                          if (value != null) {
                            setState(() {
                              profile?.trainer = value;
                            });
                          }
                        },
                      ),
                    ),

                    // Injuries Section
                    _buildSectionCard(
                      child: _buildTextAreaField(
                        label: translator.injuriesQuestion,
                        initialValue: profile?.injuriesDiscomfort,
                        // controller: _injuriesController,
                        onChanged: (value) {
                          profile?.injuriesDiscomfort = value;
                          setState(() {});
                        },
                        hint: translator.writeHere,
                      ),
                    ),

                    // Dietary Preferences Section
                    _buildSectionCard(
                      child: _buildRadioSection(
                        title: translator.dietaryPreferences,
                        question: translator.dietaryQuestion,
                        options: [
                          {'key': 'keto', 'label': translator.keto},
                          {'key': 'paleo', 'label': translator.paleo},
                          {
                            'key': 'no_preferences',
                            'label': translator.noPreferences,
                          },
                        ],
                        selectedValue: profile?.dietaryPreferences ?? "",
                        onChanged: (value) {
                          profile?.dietaryPreferences = value;
                          setState(() {});
                        },
                      ),
                    ),

                    // Allergies Section
                    _buildSectionCard(
                      child: _buildCheckboxSection(
                        title: translator.allergies,
                        question: translator.allergiesQuestion,
                        options: [
                          {'key': 'nuts', 'label': translator.nuts},
                          {'key': 'dairy', 'label': translator.dairy},
                          {'key': 'shellfish', 'label': translator.shellfish},
                        ],
                        selectedValues: profile?.allergies.toSet() ?? {},
                        onChanged: (values) {
                          // (profile?.allergies.contains(values.to))
                          profile?.allergies = values.toList();
                          setState(() {});
                        },
                      ),
                    ),

                    // Food Preference Section
                    _buildSectionCard(
                      child: _buildCheckboxSection(
                        title: translator.foodPreference,
                        question: translator.foodPreferenceQuestion,
                        options: [
                          {'key': 'egg', 'label': translator.egg},
                          {'key': 'milk', 'label': translator.milk},
                          {'key': 'fish', 'label': translator.fish},
                        ],
                        selectedValues: profile?.foodPreference.toSet() ?? {},
                        onChanged: (values) {
                          profile?.foodPreference = values.toList();
                          setState(() {});
                        },
                      ),
                    ),

                    // Medical Conditions Section
                    _buildSectionCard(
                      child: _buildCheckboxSection(
                        title: translator.medicalConditions,
                        question: translator.medicalConditionsQuestion,
                        options: [
                          {'key': 'diabetes', 'label': translator.diabetes},
                          {
                            'key': 'high_blood_pressure',
                            'label': translator.highBloodPressure,
                          },
                          {
                            'key': 'heart_disease',
                            'label': translator.heartDisease,
                          },
                        ],
                        selectedValues:
                            profile?.medicalConditions.toSet() ?? {},
                        onChanged: (values) {
                          profile?.medicalConditions = values.toList();
                          setState(() {});
                        },
                      ),
                    ),

                    // Fitness Goals Section
                    _buildSectionCard(
                      child: _buildCheckboxSection(
                        title: translator.fitnessGoals,
                        question: translator.fitnessGoalsQuestion,
                        options: [
                          {
                            'key': 'weight_loss',
                            'label': translator.weightLoss,
                          },
                          {
                            'key': 'weight_gain',
                            'label': translator.weightGain,
                          },
                          {
                            'key': 'maintenance',
                            'label': translator.maintenance,
                          },
                        ],
                        selectedValues: profile?.fitnessGoals.toSet() ?? {},
                        onChanged: (values) {
                          // profile.fitnessGoals.contains(va)
                          setState(() {
                            profile?.fitnessGoals = values.toList();
                          });
                        },
                      ),
                    ),

                    // Lifestyle Habits Section
                    _buildSectionCard(
                      child: _buildRadioSection(
                        title: translator.lifestyleHabits,
                        question: translator.lifestyleQuestion,
                        options: [
                          {'key': '3_meals', 'label': translator.threeMeals},
                          {'key': '4_meals', 'label': translator.fourMeals},
                          {'key': '5_meals', 'label': translator.fiveMeals},
                        ],
                        selectedValue: profile?.lifestyleHabits ?? "",
                        onChanged: (value) {
                          setState(() {
                            profile?.lifestyleHabits = value;
                          });
                        },
                      ),
                    ),

                    vPad15,
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF343F41),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(3.43),
                          side: const BorderSide(
                            color: Color(0xFF767781),
                            width: 0.69,
                          ),
                        ),
                        // padding: EdgeInsets.symmetric(
                        //   horizontal: defaultPadding,
                        // ),
                      ),

                      onPressed: () {
                        update();
                      },
                      child: Text(
                        translator2.submit,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontFamily: 'Outfit',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
