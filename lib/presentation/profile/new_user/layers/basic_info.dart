part of '../basic_info_screen.dart';

/// Form widget for collecting basic user information
/// Includes fields for name, gender, date of birth, weight, and height
class BasicInfoForm extends StatelessWidget {
  const BasicInfoForm({super.key});

  @override
  Widget build(BuildContext context) {
    final BasicInfoController controller = context.watch();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ProfileTextField(
          icon: Icons.person_outline,
          hint: 'Full Name',
          value: "",
          onChanged: (value) {},
        ),
        ProfileDropdownField(
          icon: Icons.transgender,
          hint: 'Gender',
          items: const ['Male', 'Female', 'Other'],
          value: controller.gender,
          onChanged: (value) {
            controller.gender = value;
          },
        ),
        DatePickerField(
          icon: Icons.calendar_today_outlined,
          hint: 'Date of birth',
          onDateChanged: (value) {
            controller.dateOfBirth = value;
          },
          value: controller.dateOfBirth,
        ),
        Row(
          children: [
            Expanded(
              flex: 2,
              child: ProfileTextField(
                icon: Icons.monitor_weight_outlined,
                hint: 'Weight',
                suffix: 'kg',
                value: controller.weight,
                formatter: FilteringTextInputFormatter.allow(
                  RegExp(r'^\d*\.?\d*'),
                ),

                onChanged: (value) {
                  controller.weight = value;
                },
              ),
            ),
            SizedBox(width: 16),
            Expanded(
              flex: 2,
              child: ProfileTextField(
                icon: Icons.height,
                hint: 'Height',
                suffix: 'cm',
                value: controller.height,
                formatter: FilteringTextInputFormatter.allow(
                  RegExp(r'^\d*\.?\d*'),
                ),
                onChanged: (value) {
                  controller.height = value;
                },
              ),
            ),
          ],
        ),
        SizedBox(height: 48),
        Center(
          child: primaryFilledButton(
            onTap: () {
              controller.toggleStep(1);
            },
            title: "Next",
            isEnable: true,
          ),
        ),
      ],
    );
  }
}
