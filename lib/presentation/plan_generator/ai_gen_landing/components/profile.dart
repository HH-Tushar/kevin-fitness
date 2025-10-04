part of '../plan_generator.dart';

class _ProfileSection extends StatelessWidget {
  const _ProfileSection({super.key});

  @override
  Widget build(BuildContext context) {
    final LanguageProvider languageProvider = context.watch();
    final AuthController authController = context.watch();
    final planGen = languageProvider.aiScreenTranslation;
    final userInfo = authController.getUserInfo?.profile;
    return Container(
      width: double.infinity,
      // height: 182,
      padding: EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        color: const Color(0xFF2D393A),
        borderRadius: BorderRadius.circular(6),
        boxShadow: [
          BoxShadow(
            color: const Color(0x1E000000),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Profile Title
          Text(
            planGen.yourProfile,
            style: TextStyle(
              color: Colors.white,
              fontSize: 17,
              fontFamily: 'Outfit',
              fontWeight: FontWeight.w500,
              height: 1.76,
            ),
          ),

          Row(
            spacing: 8,
            children: [
              // Goal   // Diet
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: planGen.goal,
                            style: TextStyle(
                              color: const Color(0xFF767781),
                              fontSize: 15,
                              fontFamily: 'Outfit',
                              fontWeight: FontWeight.w400,
                              height: 1.27,
                            ),
                          ),
                          TextSpan(
                            text: '\n${userInfo?.interestedWorkout}',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontFamily: 'Outfit',
                              fontWeight: FontWeight.w400,
                              height: 1.27,
                            ),
                          ),
                        ],
                      ),
                    ),
                    vPad15,
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: planGen.diet,
                            style: TextStyle(
                              color: const Color(0xFF767781),
                              fontSize: 15,
                              fontFamily: 'Outfit',
                              fontWeight: FontWeight.w400,
                              height: 1.33,
                            ),
                          ),
                          TextSpan(
                            text: '\n${userInfo?.dietaryPreferences}',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontFamily: 'Outfit',
                              fontWeight: FontWeight.w400,
                              height: 1.33,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              // Level  // Current Weight
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: '${planGen.diet}\n',
                            style: TextStyle(
                              color: const Color(0xFF767781),
                              fontSize: 15,
                              fontFamily: 'Outfit',
                              fontWeight: FontWeight.w400,
                              height: 1.27,
                            ),
                          ),
                          TextSpan(
                            text: userInfo?.fitnessLevel,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontFamily: 'Outfit',
                              fontWeight: FontWeight.w400,
                              height: 1.27,
                            ),
                          ),
                        ],
                      ),
                    ),
                    vPad15,
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: '${planGen.currentWeight}\n',
                            style: TextStyle(
                              color: const Color(0xFF767781),
                              fontSize: 15,
                              fontFamily: 'Outfit',
                              fontWeight: FontWeight.w400,
                              height: 1.33,
                            ),
                          ),
                          TextSpan(
                            text: '${userInfo?.weight.toStringAsFixed(1)} kg',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontFamily: 'Outfit',
                              fontWeight: FontWeight.w400,
                              height: 1.33,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
