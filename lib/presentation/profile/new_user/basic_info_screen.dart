import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '/common/app_bars.dart';
import '/common/colors.dart';
import '/common/gaps.dart';
import 'package:provider/provider.dart';

import '../../../common/custom_buttons.dart';
import 'controller.dart';

part 'components/drop_down.dart';
part 'components/skin_fold_field.dart';
part 'components/preference_card.dart';
part 'components/text_form.dart';
part 'layers/basic_info.dart';
part 'layers/skin_fold_form.dart';
part 'layers/workout_form.dart';
part 'layers/preference_form.dart';

class BasicInfoScreen extends StatelessWidget {
  const BasicInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => BasicInfoController(),
      child: _Layout(),
    );
  }
}

class _Layout extends StatelessWidget {
  const _Layout();

  @override
  Widget build(BuildContext context) {
    final BasicInfoController controller = context.watch();
    return Scaffold(
      appBar: childAppBar(context: context),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: defaultPadding * 1.5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // SizedBox(height: 40.0 ),
            vPad10,
            Text(
              'Complete your profile',
              style: TextStyle(
                color: const Color(0xFF343F41),
                fontSize: 23.0,
                fontFamily: 'Outfit',
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 24.0),
            // Tabs
            Row(
              children: [
                ProfileTab(
                  label: 'Basic Info',
                  selected: controller.step == 0 || controller.step == 1,
                  // Use the local _setStep method
                  onTap: () => controller.toggleStep(0),
                ),
                SizedBox(width: 12.0),
                ProfileTab(
                  label: 'Work Out',
                  selected: controller.step == 2,
                  // Use the local _setStep method
                  onTap: () => controller.toggleStep(2),
                ),
                SizedBox(width: 12.0),
                ProfileTab(
                  label: 'Preference',
                  selected: controller.step == 3,
                  // Use the local _setStep method
                  onTap: () => controller.toggleStep(3),
                ),
              ],
            ),

            // SizedBox(height: 32.0),
            vPad20,
            Expanded(
              child: SingleChildScrollView(
                child: controller.step == 0
                    ? const BasicInfoForm()
                    : controller.step == 1
                    ? const SkinfoldForm()
                    : controller.step == 2
                    ? const WorkOutForm()
                    : PreferencesForm(),
              ),
            ),

            // Conditional content rendering based on local state
            // if (controller.step == 0) const BasicInfoForm(),
            // if (controller.step == 1) const SkinfoldForm(),
            // if (controller. step == 2) const WorkOutForm(),
            // if (step == 3) const PreferencesForm(),
          ],
        ),
      ),
    );
  }
}

class ProfileTab extends StatelessWidget {
  final String label;
  final bool selected;
  final VoidCallback onTap;

  const ProfileTab({
    super.key,
    required this.label,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: 43,
          decoration: BoxDecoration(
            color: selected ? const Color(0xFF263133) : Colors.transparent,
            border: Border.all(
              color: selected
                  ? const Color(0xFF263133)
                  : const Color(0xFF3A4646),
              width: 1,
            ),
            borderRadius: BorderRadius.circular(3),
          ),
          child: Center(
            child: Text(
              label,
              style: TextStyle(
                color: selected ? Colors.white : const Color(0xFF263133),
                fontSize: 13,
                fontFamily: 'Outfit',
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
