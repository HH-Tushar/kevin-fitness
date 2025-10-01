part of '../basic_info_screen.dart';

class WorkOutTextField extends StatelessWidget {
  final String label;
  final String hint;
  final String value;
  final ValueChanged<String> onChanged;

  const WorkOutTextField({
    super.key,
    required this.label,
    required this.hint,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          // Replaced 4.w, 4.h
          padding: EdgeInsets.only(left: 4.0, bottom: 4.0),
          child: Text(
            label,
            style: TextStyle(
              color: const Color(0xFF767781),
              // Replaced 13.sp
              fontSize: 13.0,
              fontFamily: 'Outfit',
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        TextFormField(
          initialValue: value,
          onChanged: onChanged,
          keyboardType: TextInputType.text,
          // Updated text field style (removed from input style to match snippet)
          style: TextStyle(
            color: const Color(0xFF767781),
            fontSize: 16.0,
            fontFamily: 'Outfit',
            fontWeight: FontWeight.w400,
          ),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(
              color: const Color(0xFF767781),
              // Replaced 13.sp
              fontSize: 13.0,
              fontFamily: 'Outfit',
              fontWeight: FontWeight.w400,
            ),
            border: OutlineInputBorder(
              // Replaced 3.r
              borderRadius: BorderRadius.circular(3.0),
              borderSide: const BorderSide(color: Color(0xFF767781), width: 1),
            ),
            enabledBorder: OutlineInputBorder(
              // Replaced 3.r
              borderRadius: BorderRadius.circular(3.0),
              borderSide: const BorderSide(color: Color(0xFF767781), width: 1),
            ),
            focusedBorder: OutlineInputBorder(
              // Replaced 3.r
              borderRadius: BorderRadius.circular(3.0),
              borderSide: const BorderSide(color: Color(0xFF767781), width: 1),
            ),
            isDense: true,
            // Replaced 12.w, 8.h
            contentPadding: EdgeInsets.symmetric(
              horizontal: 12.0,
              vertical: 8.0,
            ),
          ),
        ),
      ],
    );
  }
}

// --- 2. WorkOutDropdownField: Dropdown selector for single choice fields ---
class WorkOutDropdownField extends StatelessWidget {
  // UPDATED: 'value' is now non-nullable String, but we'll treat it as potentially empty
  // or non-matching for the DropdownButtonFormField's 'value' property.
  final String label;
  final String? value;
  final List<String> items;
  final ValueChanged<String?> onChanged;
  final bool isExpanded;

  const WorkOutDropdownField({
    super.key,
    required this.label,
    required this.value,
    required this.items,
    required this.onChanged,
    this.isExpanded = false,
  });

  @override
  Widget build(BuildContext context) {
    // final selectedValue = items.contains(value) ? value : null;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label.isNotEmpty)
          Padding(
            // Replaced 4.w, 4.h
            padding: EdgeInsets.only(left: 4.0, bottom: 4.0),
            child: Text(
              label,
              style: TextStyle(
                color: const Color(0xFF767781),
                // Replaced 13.sp
                fontSize: 13.0,
                fontFamily: 'Outfit',
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        DropdownButtonFormField<String>(
          initialValue: value,
          isExpanded: isExpanded,
          items: items
              .map(
                (e) => DropdownMenuItem<String>(
                  value: e,
                  child: Text(
                    e,
                    style: TextStyle(
                      color: const Color(0xFF767781),
                      // Replaced 13.sp
                      fontSize: 13.0,
                      fontFamily: 'Outfit',
                      fontWeight: FontWeight.w400,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
              )
              .toList(),
          onChanged: onChanged,
          decoration: InputDecoration(
            // Replaced 12.w, 8.h
            contentPadding: EdgeInsets.symmetric(
              horizontal: 12.0,
              vertical: 8.0,
            ),
            border: OutlineInputBorder(
              // Replaced 3.r
              borderRadius: BorderRadius.circular(3.0),
              borderSide: const BorderSide(color: Color(0xFF767781), width: 1),
            ),
            enabledBorder: OutlineInputBorder(
              // Replaced 3.r
              borderRadius: BorderRadius.circular(3.0),
              borderSide: const BorderSide(color: Color(0xFF767781), width: 1),
            ),
            focusedBorder: OutlineInputBorder(
              // Replaced 3.r
              borderRadius: BorderRadius.circular(3.0),
              borderSide: const BorderSide(color: Color(0xFF767781), width: 1),
            ),
            isDense: true,
          ),
        ),
      ],
    );
  }
}

// --- 3. MultiCheckboxList: List of checkboxes for multiple selections ---
class MultiCheckboxList extends StatelessWidget {
  final String label;
  final List<String> options;
  final List<String> selected;
  final ValueChanged<List<String>> onChanged;

  const MultiCheckboxList({
    super.key,
    required this.label,
    required this.options,
    required this.selected,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            color: Colors.black,
            fontSize: 16.0,
            fontFamily: 'Outfit',
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: 8.0),
        ...options.map((option) {
          final isChecked = selected.contains(option);
          return Padding(
            padding: EdgeInsets.symmetric(vertical: 4.0),
            child: Row(
              children: [
                SizedBox(
                  width: 24.0,
                  height: 24.0,
                  child: Checkbox(
                    value: isChecked,

                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                    onChanged: (bool? newValue) {
                      final newSelected = List<String>.from(selected);
                      if (newValue == true) {
                        newSelected.add(option);
                      } else {
                        newSelected.remove(option);
                      }
                      onChanged(newSelected);
                    },
                    activeColor: const Color(0xFF2D393A),
                    side: const BorderSide(
                      color: Color(0xFF767781),
                      width: 1.0,
                    ),
                  ),
                ),
                SizedBox(width: 8.0),
                Text(
                  option,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14.0,
                    fontFamily: 'Outfit',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          );
        }).toList(),
      ],
    );
  }
}

// --- 4. WorkOutForm: Main stateless widget for workout information ---
class WorkOutForm extends StatelessWidget {
  const WorkOutForm({super.key});

  @override
  Widget build(BuildContext context) {
    final BasicInfoController controller = context.watch();

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 16.0),
          Text(
            'Workout Information',
            style: TextStyle(
              color: Colors.black,
              fontSize: 20.0,
              fontFamily: 'Outfit',
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 24.0),

          WorkOutDropdownField(
            label: 'Fitness Level',
            value: controller.fitnessLevel,
            items: const ['Beginners', 'Basic', 'Intermediate', 'High'],
            onChanged: (e) => controller.fitnessLevel = e ?? "",
          ),
          SizedBox(height: 16.0),

          // Where do you train? (Dropdown)
          Row(
            children: [
              Expanded(
                flex: 2,
                child: WorkOutDropdownField(
                  label: 'Where do you train?',
                  value: controller.whereTrain,
                  items: const [
                    'At home',
                    'At gym',
                    'Martial arts',
                    'Running',
                    'Other sports',
                  ],
                  onChanged: (v) {
                    controller.whereTrain = v ?? "";
                    controller.updateSubOption();
                    // onWhereTrainChanged(v);
                    // Clear sub-options when the main location changes
                    // onWhereTrainSubChanged([]);
                  },
                ),
              ),
              SizedBox(width: 16.0),
              const Expanded(flex: 2, child: SizedBox()),
            ],
          ),

          // Sub-options based on whereTrain
          if (controller.subOptions.isNotEmpty) ...[
            SizedBox(height: 12.0),
            MultiCheckboxList(
              label: controller.subLabel,
              options: controller.subOptions,
              selected: controller.whereTrainSub,
              onChanged: (e) {
                controller.updateTrainingInstruments(e);
              },
            ),
          ],
          SizedBox(height: 16.0),

          WorkOutDropdownField(
            label: 'How long do you train?',
            value: controller.howLongTrain,
            items: const ['Less than 1 hour', 'More than 1 hour'],
            onChanged: (e) => controller.howLongTrain = e ?? "",
          ),
          SizedBox(height: 16.0),

          WorkOutDropdownField(
            label: 'Interested for workout?',
            value: controller.interestedWorkout,
            items: const ['Lose Fat', 'Gain Muscle', 'Maintenance'],
            onChanged: (e) => controller.interestedWorkout = e ?? "",
            isExpanded: true,
          ),
          SizedBox(height: 16.0),

          WorkOutTextField(
            label: 'Do you have any injuries or discomfort?',
            hint: 'Enter your injuries or discomfort',
            value: controller.injuries,
            onChanged: (e) => controller.injuries = e,
          ),
          SizedBox(height: 16.0),

          WorkOutDropdownField(
            label: 'How long do you interested for making routine?',
            value: controller.routineDuration,
            items: const ['1 Month', '2 Month', '3 Month', '6 Month', '1 Year'],
            onChanged: (e) => controller.routineDuration = e ?? "",
          ),
          SizedBox(height: 48.0),

          vPad35,
        ],
      ),
    );
  }
}
