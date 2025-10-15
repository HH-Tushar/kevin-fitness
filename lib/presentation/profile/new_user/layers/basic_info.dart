part of '../basic_info_screen.dart';

/// Form widget for collecting basic user information
/// Includes fields for name, gender, date of birth, weight, and height
class BasicInfoForm extends StatelessWidget {
  const BasicInfoForm({super.key});

  @override
  Widget build(BuildContext context) {
    final BasicInfoController controller = context.watch();
    return Form(
      key: controller.basicInfoFormKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ProfileTextField(
            icon: Icons.person_outline,
            hint: 'Full Name',
            value: "",
            validator: (e) => CommonValidator.fieldRequired(e),
            onChanged: (value) {
              controller.fullName = value;
            },
          ),
          ProfileDropdownField(
            validator: CommonValidator.fieldRequired,
            icon: Icons.transgender,
            hint: 'Gender',
            items: const ['male', 'female', 'other'],
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
            value: controller.dateOfBirth.toString(),
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
                  validator: (e) => CommonValidator.fieldRequired(e),
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
                  validator: (e) => CommonValidator.fieldRequired(e),
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
                if (!controller.basicInfoFormKey.currentState!.validate()) {
                  return;
                }
                if (controller.dateOfBirth == null) {
                  showToast(
                    context: context,
                    title: "Please Select Date of birth",
                    isSuccess: false,
                  );
                  return;
                }

                controller.toggleStep(1);
              },
              title: "Next",
              isEnable: true,
            ),
          ),
        ],
      ),
    );
  }
}
