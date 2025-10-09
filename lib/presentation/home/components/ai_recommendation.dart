part of '../home_screen.dart';

// --- Motivation Card ---
class _MotivationCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final DailyPlanProvider planProvider = context.watch();
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            height: 155,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: AssetImage('assets/images/splash_2bg.png'),
                fit: BoxFit.cover,
              ),
              boxShadow: [
                BoxShadow(
                  color: const Color(0x26000000),
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
          ),
          Container(
            width: 359,
            height: 155,
            decoration: BoxDecoration(
              color: const Color(0xA82A2A2A),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            top: 48,
            child: Center(
              child: SizedBox(
                width: 305,
                child: Text(
                  'Every Step is your forward counts. Continue your journey!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontFamily: 'Outfit',
                    fontWeight: FontWeight.w400,
                    height: 1.36,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// --- Calorie Box ---
class _CalorieBox extends StatelessWidget {
  final double height;
  const _CalorieBox({this.height = 90});
  @override
  Widget build(BuildContext context) {
    final DailyPlanProvider planProvider = context.watch();
    final LanguageProvider languageProvider = context.watch();
    final translator = languageProvider.homeTranslation;
    return Container(
      height: 80,
      decoration: BoxDecoration(
        color: const Color(0xFF2D393A),
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: const Color(0x14110C11), width: 0.25),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        // spacing: 15,
        children: [
          vPad5,
          Row(
            children: [
              hPad5,
              Icon(Icons.bar_chart, color: const Color(0xFFA855F7), size: 22),
              SizedBox(width: 8),
              Expanded(
                child: Text(
                  translator.calorieNeedDaily,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontFamily: 'Outfit',
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),

          vPad5,
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: RichText(
                textAlign: TextAlign.right,

                text: TextSpan(
                  children: [
                    TextSpan(
                      text:
                          planProvider
                              .dailyPlan
                              ?.aiRecomended
                              .totalCaloriesPerDay
                              .toString() ??
                          "",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w700,
                      ),
                    ),

                    TextSpan(
                      text: ' Kcal',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          hPad15,
          Container(
            height: 6,
            decoration: BoxDecoration(
              color: const Color(0xFF463f5f),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(4),
                bottomRight: Radius.circular(4),
              ),
            ),
            // child: Row(
            //   children: [
            //     Container(
            //       width: double.infinity,
            //       height: 6,
            //       decoration: BoxDecoration(
            //         color: const Color(0xFFA855F7),
            //         borderRadius: BorderRadius.only(
            //           bottomLeft: Radius.circular(4),
            //         ),
            //       ),
            //     ),

            //   ],
            // ),
          ),
        ],
      ),
    );
  }
}

// --- Sleep Box ---
class _SleepBox extends StatelessWidget {
  final double height;
  const _SleepBox({this.height = 80});
  @override
  Widget build(BuildContext context) {
    final DailyPlanProvider planProvider = context.watch();
    final LanguageProvider languageProvider = context.watch();
    final translator = languageProvider.homeTranslation;
    return Container(
      height: 80,
      decoration: BoxDecoration(
        color: const Color(0xFF2D393A),
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: const Color(0xFF263133), width: 0.25),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          vPad5,

          Row(
            children: [
              hPad5,
              Icon(
                Icons.nightlight_round,
                color: const Color(0xFF134E48),
                size: 22,
              ),
              SizedBox(width: 8),
              Text(
                translator.sleep,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                  fontFamily: 'Outfit',
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),

          vPad10,
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text:
                          planProvider
                              .dailyPlan
                              ?.aiRecomended
                              .sleepNeedHoursPerDay
                              .toString() ??
                          "",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    TextSpan(
                      text: 'h ',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    TextSpan(
                      text: '34',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    TextSpan(
                      text: 'm',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          vPad5,
          Container(
            height: 6,
            decoration: BoxDecoration(
              color: const Color(0xFF134E48).withOpacity(0.3),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(4),
                bottomRight: Radius.circular(4),
              ),
            ),
            // child: Row(
            //   children: [
            //     Container(
            //       width: 170,
            //       height: 6,
            //       decoration: BoxDecoration(
            //         color: const Color(0xFF134E48),
            //         borderRadius: BorderRadius.only(
            //           bottomLeft: Radius.circular(4),
            //         ),
            //       ),
            //     ),
            //     Expanded(child: SizedBox()),
            //   ],
            // ),
          ),
        ],
      ),
    );
  }
}
