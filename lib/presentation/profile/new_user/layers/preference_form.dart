part of '../basic_info_screen.dart';

class PreferencesForm extends StatelessWidget {
  const PreferencesForm({super.key});

  // State variables replacing Riverpod providers
  @override
  Widget build(BuildContext context) {
    final BasicInfoController controller = context.watch();
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
          selected: [controller.dietaryPref],
          onChanged: controller.setDietaryPref,
          singleSelect: true,
        ),
        SizedBox(height: 16.0),

        // 2. Allergies (Multi Select)
        PreferenceCard(
          title: 'Allergies',
          subtitle: 'Do you have any food allergies?',
          options: const ['Nuts', 'Dairy', 'Shellfish', 'Eggs', 'No allergies'],
          selected: controller.allergies,
          onChanged: controller.setAllergies,
        ),
        SizedBox(height: 16.0),

        // 3. Food Preference (Multi Select)
        PreferenceCard(
          title: 'Food Preference',
          subtitle: 'Do you want to skip any food ?',
          options: const ['Egg', 'Milk', 'Fish'],
          selected: controller.foodPref,
          onChanged: controller.setFoodPref,
        ),
        SizedBox(height: 16.0),

        // 4. Medical Conditions (Multi Select)
        PreferenceCard(
          title: 'Medical Conditions',
          subtitle:
              'Please select any conditions that may affect your diet or exercise routine.',
          options: const ['Diabetes', 'High blood pressure', 'Heart disease'],
          selected: controller.medicalCond,
          onChanged: controller.setMedicalCond,
        ),
        SizedBox(height: 16.0),

        // 5. Fitness Goals (Multi Select)
        PreferenceCard(
          title: 'Fitness Goals',
          subtitle: 'What are your primary fitness objectives?',
          options: const ['Weight loss', 'Weight gain', 'Maintenance'],
          selected: controller.fitnessGoals,
          onChanged: controller.setFitnessGoals,
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
          selected: [controller.lifestyleHabits],
          onChanged: controller.setLifestyleHabits,
          singleSelect: true,
        ),
        SizedBox(height: 32.0),
        Center(
          child: primaryFilledButton(
            onTap: () {
              controller.uploadDetails(context);
            },
            title: "Continue",
            isEnable: true,
          ),
        ),
        // Continue Button
        SizedBox(height: 35.0),
      ],
    );
  }
}
