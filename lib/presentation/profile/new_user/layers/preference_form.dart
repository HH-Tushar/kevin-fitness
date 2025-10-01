part of '../basic_info_screen.dart';

class PreferencesForm extends StatefulWidget {
  const PreferencesForm({super.key});

  @override
  State<PreferencesForm> createState() => _PreferencesFormState();
}

class _PreferencesFormState extends State<PreferencesForm> {
  // State variables replacing Riverpod providers
  String _dietaryPref = 'No preferences';
  List<String> _allergies = [];
  List<String> _foodPref = [];
  List<String> _medicalCond = [];
  List<String> _fitnessGoals = [];
  String _lifestyleHabits = '3 Meals';
  bool _isLoading = false;

  // Mock data for other form sections needed for the final API payload
  static const _mockBasicInfo = {
    'fullName': 'Mock User',
    'gender': 'Male',
    'dateOfBirth': '15/05/1990',
    'weight': '75',
    'height': '180',
    'abdominal': '20',
    'sacroiliac': '15',
    'subscapularis': '10',
    'triceps': '8',
  };
  static const _mockWorkoutInfo = {
    'fitnessLevel': 'Basic',
    'whereTrain': 'At gym',
    'whereTrainSub': ['Squat Rack'],
    'howLongTrain': 'More than 1 hour',
    'interestedWorkout': 'Lose Fat',
    'injuries': 'None',
    'routineDuration': '1 Month',
  };

  // --- State Setter Methods ---

  void _setDietaryPref(List<String> v) {
    setState(() {
      _dietaryPref = v.first;
    });
  }

  void _setAllergies(List<String> v) {
    setState(() {
      // Logic to ensure 'No allergies' is exclusive
      if (v.contains('No allergies') && v.length > 1) {
        _allergies = ['No allergies'];
      } else if (v.contains('No allergies') &&
          v.length == 1 &&
          v.first == 'No allergies') {
        _allergies = v;
      } else if (v.contains('No allergies') && v.length == 0) {
        _allergies = []; // Should not happen with current card logic
      } else {
        _allergies = v.where((element) => element != 'No allergies').toList();
      }
    });
  }

  void _setFoodPref(List<String> v) {
    setState(() => _foodPref = v);
  }

  void _setMedicalCond(List<String> v) {
    setState(() => _medicalCond = v);
  }

  void _setFitnessGoals(List<String> v) {
    setState(() => _fitnessGoals = v);
  }

  void _setLifestyleHabits(List<String> v) {
    setState(() => _lifestyleHabits = v.first);
  }

  // --- Utility and API Logic ---

  void _clearAllFormData() {
    // Reset only the Preferences section, as other sections are mocked here
    setState(() {
      _dietaryPref = 'No preferences';
      _allergies = [];
      _foodPref = [];
      _medicalCond = [];
      _fitnessGoals = [];
      _lifestyleHabits = '3 Meals';
      _isLoading = false;
    });
  }

  Map<String, dynamic> _prepareProfileData() {
    // Merging mock data with current preference state for a complete payload
    final basic = _mockBasicInfo;
    final workout = _mockWorkoutInfo;

    // Convert date format from DD/MM/YYYY to YYYY-MM-DD
    String formattedDate = '';
    if (basic['dateOfBirth']!.isNotEmpty) {
      final parts = basic['dateOfBirth']!.split('/');
      if (parts.length == 3) {
        formattedDate =
            '${parts[2]}-${parts[1].padLeft(2, '0')}-${parts[0].padLeft(2, '0')}';
      }
    }

    // Prepare equipment lists based on training location (mocked)
    List<String> atHome = workout['whereTrain'] == 'At home'
        ? workout['whereTrainSub'] as List<String>
        : [];
    List<String> atGym = workout['whereTrain'] == 'At gym'
        ? workout['whereTrainSub'] as List<String>
        : [];

    final profileData = {
      'at_home': atHome,
      'at_gym': atGym,
      'martial_arts': <String>[],
      'running': <String>[],
      'other_sports': <String>[],
      'allergies': _allergies,
      'food_preference': _foodPref,
      'medical_conditions': _medicalCond,
      'fitness_goals': _fitnessGoals,
      'fullname': basic['fullName'],
      'gender': basic['gender']!.toLowerCase(),
      'date_of_birth': formattedDate,
      'weight': double.tryParse(basic['weight']!) ?? 0,
      'height': double.tryParse(basic['height']!) ?? 0,
      'abdominal': double.tryParse(basic['abdominal']!) ?? 0,
      'sacroiliac': double.tryParse(basic['sacroiliac']!) ?? 0,
      'subscapularis': double.tryParse(basic['subscapularis']!) ?? 0,
      'triceps': double.tryParse(basic['triceps']!) ?? 0,
      'fitness_level': workout['fitnessLevel'],
      'trainer': workout['whereTrain'],
      'train_duration': workout['howLongTrain'],
      'interested_workout': workout['interestedWorkout'],
      'injuries_discomfort': workout['injuries'],
      'routine_duration': workout['routineDuration'],
      'dietary_preferences': _dietaryPref,
      'lifestyle_habits': _lifestyleHabits,
    };

    return profileData;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 1. Dietary Preferences (Single Select)
        PreferenceCard(
          title: 'Dietary Preferences',
          subtitle: 'What are your dietary preferences?',
          options: const [
            'Keto',
            'Paleo',
            'Vegetarian',
            'Vegan',
            'Gluten-Free',
            'No preferences',
          ],
          selected: [_dietaryPref],
          onChanged: _setDietaryPref,
          singleSelect: true,
        ),
        SizedBox(height: 16.0),

        // 2. Allergies (Multi Select)
        PreferenceCard(
          title: 'Allergies',
          subtitle: 'Do you have any food allergies?',
          options: const ['Nuts', 'Dairy', 'Shellfish', 'Eggs', 'No allergies'],
          selected: _allergies,
          onChanged: _setAllergies,
        ),
        SizedBox(height: 16.0),

        // 3. Food Preference (Multi Select)
        PreferenceCard(
          title: 'Food Preference',
          subtitle: 'Do you want to skip any food ?',
          options: const ['Egg', 'Milk', 'Fish'],
          selected: _foodPref,
          onChanged: _setFoodPref,
        ),
        SizedBox(height: 16.0),

        // 4. Medical Conditions (Multi Select)
        PreferenceCard(
          title: 'Medical Conditions',
          subtitle:
              'Please select any conditions that may affect your diet or exercise routine.',
          options: const ['Diabetes', 'High blood pressure', 'Heart disease'],
          selected: _medicalCond,
          onChanged: _setMedicalCond,
        ),
        SizedBox(height: 16.0),

        // 5. Fitness Goals (Multi Select)
        PreferenceCard(
          title: 'Fitness Goals',
          subtitle: 'What are your primary fitness objectives?',
          options: const ['Weight loss', 'Weight gain', 'Maintenance'],
          selected: _fitnessGoals,
          onChanged: _setFitnessGoals,
        ),
        SizedBox(height: 16.0),

        // 6. Lifestyle Habits (Single Select)
        PreferenceCard(
          title: 'Lifestyle Habits',
          subtitle: 'How many time do you prefer to have your meal?',
          options: const [
            '3 Meals',
            '4 Meals',
            '5 Meals',
            '6 Meals',
            '7 Meals',
            '8 Meals',
          ],
          selected: [_lifestyleHabits],
          onChanged: _setLifestyleHabits,
          singleSelect: true,
        ),
        SizedBox(height: 32.0),

        // Continue Button
        Center(
          child: SizedBox(
            // Replaced 160.w, 44.h
            width: 160.0,
            height: 44.0,
            child: ElevatedButton(
              // onPressed: _isLoading ? null : _handleProfileUpdate,
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF343F41),
                shape: RoundedRectangleBorder(
                  // Replaced 6.r
                  borderRadius: BorderRadius.circular(6.0),
                ),
                side: const BorderSide(color: Color(0xFF767781), width: 0.69),
              ),
              child: _isLoading
                  ? SizedBox(
                      // Replaced 20.w, 20.h, 2.w
                      width: 20.0,
                      height: 20.0,
                      child: CircularProgressIndicator(
                        strokeWidth: 2.0,
                        valueColor: const AlwaysStoppedAnimation<Color>(
                          Colors.white,
                        ),
                      ),
                    )
                  : Text(
                      'Continue',
                      style: TextStyle(
                        color: Colors.white,
                        // Replaced 18.sp
                        fontSize: 18.0,
                        fontFamily: 'Outfit',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
            ),
          ),
        ),
        SizedBox(height: 32.0),
      ],
    );
  }
}
