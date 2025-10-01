part of '../basic_info_screen.dart';

class SkinfoldForm extends StatelessWidget {
  const SkinfoldForm({super.key});

  @override
  Widget build(BuildContext context) {
    final BasicInfoController controller = context.watch();
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Skinfold Measurements',
            style: TextStyle(
              color: Colors.black,
              // Replaced 20.sp
              fontSize: 20.0,
              fontFamily: 'Outfit',
              fontWeight: FontWeight.w500,
              height: 1.5,
            ),
          ),
          // Replaced 4.h
          SizedBox(height: 4.0),
          Text(
            'Enter your skinfold measurements (in mm):',
            style: TextStyle(
              color: const Color(0xFF767781),
              // Replaced 14.sp
              fontSize: 14.0,
              fontFamily: 'Outfit',
              fontWeight: FontWeight.w300,
              height: 2.14,
            ),
          ),
          // Replaced 24.h
          SizedBox(height: 24.0),

          SkinfoldField(
            label: 'Abdominal',
            value: controller.abdominalValue,
            onChanged: (e) {
              controller.abdominalValue = e;
            },
          ),
          // Replaced 16.h
          SizedBox(height: 16.0),

          SkinfoldField(
            label: 'Sacroiliac',
            value: controller.sacroiliacValue,
            onChanged: (e) => controller.sacroiliacValue = e,
          ),
          // Replaced 16.h
          SizedBox(height: 16.0),

          SkinfoldField(
            label: 'Subscapularis',
            value: controller.subscapularisValue,
            onChanged: (e) {
              controller.subscapularisValue = e;
            },
          ),
          // Replaced 16.h
          SizedBox(height: 16.0),

          SkinfoldField(
            label: 'Triceps (right)',
            value: controller.tricepsValue,
            onChanged: (e) {
              controller.tricepsValue = e;
            },
          ),

          // Replaced 48.h
          SizedBox(height: 48.0),

          Row(
            spacing: defaultPadding,
            children: [
              Expanded(
                child: primaryFilledButton(
                  onTap: () {
                    controller.toggleStep(0);
                  },
                  title: "Previous",
                  isEnable: true,
                  bg: customGreyText,
                ),
              ),
              Expanded(
                child: primaryFilledButton(
                  onTap: () {
                    controller.toggleStep(2);
                  },
                  title: "Next",
                  isEnable: true,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
