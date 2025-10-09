import 'package:flutter/material.dart';

import '../search/search_screen.dart';
import '../setting/settings.dart';
import '/application/auth/auth_controller.dart';
import '/common/navigator.dart';
import '/presentation/auth/view/login_screen.dart';
import '/providers/daily_plan_provider.dart';
import '/translation/localization.dart';
import 'package:provider/provider.dart';
import '../meal_track/daily_track/meal_track.dart';
import '../workout_track/daily_track/workout_track.dart';
import '/common/gaps.dart';
import '../../common/colors.dart';
import 'package:lottie/lottie.dart';
part 'components/weekly.dart';
part 'components/water.dart';
part 'components/meal_plan.dart';
part 'components/workout_plan.dart';
part 'components/ai_recommendation.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final DailyPlanProvider planProvider = context.watch();
    final LanguageProvider languageProvider = context.watch();
    final translator = languageProvider.homeTranslation;
    final double boxHeight = 90;
    final double boxSpacing = 12;
    return Scaffold(
      backgroundColor: const Color(0xFF263133),
      body: Stack(
        children: [
          // Full screen background image
          Positioned.fill(
            child: Image.asset(
              'assets/images/ai_recommended_bg.png',
              fit: BoxFit.cover,
            ),
          ),
          // Content
          SafeArea(
            child: Column(
              children: [
                SizedBox(height: 16),
                _HomeHeader(),
                SizedBox(height: 16),
                Expanded(
                  child: CustomScrollView(
                    slivers: [
                      SliverToBoxAdapter(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            WeeklyCalendarWidget(
                              selectedDate: DateTime.now(),
                              // backgroundColor: Colors.amber,
                              // selectedColor: Colors.blue,
                              // selectedTextColor: Colors.white,
                            ),
                            // vPad20,

                            // _WeeklyGoalSection(),
                            SizedBox(height: 16),
                            _MotivationCard(),
                            SizedBox(height: 16),
                            // Responsive 2x2 grid for Calorie, Sleep, Water
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    translator.aIRecommendedTodayPlan,
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: customWhite,
                                      fontFamily: "Outfit",
                                    ),
                                  ),
                                  vPad10,
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: Column(
                                          children: [
                                            _CalorieBox(height: boxHeight),
                                            SizedBox(height: boxSpacing),
                                            _SleepBox(height: boxHeight),
                                          ],
                                        ),
                                      ),
                                      SizedBox(width: 12),
                                      Expanded(
                                        child: _WaterBox(
                                          height: boxHeight * 2 + boxSpacing,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 24),
                            _MealIdeaSection(),
                            SizedBox(height: 24),
                            _WorkoutSection(),
                            SizedBox(height: 24),
                          ],
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
    );
  }
}

class _HomeHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final LanguageProvider lan = context.watch();
    final translator = lan.homeTranslation;
    final AuthController authController = context.watch();
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        spacing: 16,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Name on the left
              // Expanded(
              //   // child: Text(
              //   //   'KEVIN ORELLANA',
              //   //   style: TextStyle(
              //   //     color: Colors.white,
              //   //     fontSize: 20,
              //   //     fontFamily: 'Outfit',
              //   //     fontWeight: FontWeight.w300,
              //   //     letterSpacing: 6.0,
              //   //     height: 1.1,
              //   //   ),
              //   //   maxLines: 1,
              //   //   overflow: TextOverflow.ellipsis,
              //   // ),
              //   child: RichText(
              //     text: TextSpan(
              //       style: TextStyle(letterSpacing: 2.5),
              //       children: [
              //         TextSpan(
              //           text: 'K',
              //           style: TextStyle(
              //             color: Colors.white,
              //             fontSize: 28,
              //             fontFamily: 'Montserrat',
              //             // fontWeight: FontWeight.w700,
              //           ),
              //         ),
              //         TextSpan(
              //           text: 'EVIN',
              //           style: TextStyle(
              //             color: Colors.white,
              //             fontSize: 22,
              //             fontFamily: 'Montserrat',
              //             // fontWeight: FontWeight.w400,
              //           ),
              //         ),
              //         TextSpan(text: " "),
              //         TextSpan(
              //           text: 'O',
              //           style: TextStyle(
              //             color: Colors.white,
              //             fontSize: 28,
              //             fontFamily: 'Outfit',
              //             // fontWeight: FontWeight.w500,
              //           ),
              //         ),

              //         TextSpan(
              //           text: 'RELLANA',
              //           style: TextStyle(
              //             color: Colors.white,
              //             fontSize: 22,
              //             fontFamily: 'Outfit',
              //             // fontWeight: FontWeight.w400,
              //           ),
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
              Expanded(
                child: const Text(
                  'KEVIN ORELLANA',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: Colors.white,
                    // Fixed font size (was 28.sp)
                    fontSize: 24.0,
                    fontFamily: 'Outfit',
                    // fontWeight: FontWeight.w700,
                    letterSpacing: 2.0,
                  ),
                ),
              ),

              SizedBox(width: 12),

              InkWell(
                child: CircleAvatar(
                  // radius: 44,
                  backgroundColor: Colors.white.withOpacity(0.08),
                  backgroundImage:
                      authController.userProfile?.image != null &&
                          authController.userProfile!.image.isNotEmpty
                      ? NetworkImage(authController.userProfile!.image)
                      : null,

                  child: authController.userProfile?.image == null
                      ? Icon(
                          Icons.person,
                          size: 54,
                          color: Colors.white.withOpacity(0.7),
                        )
                      : null,
                ),
                onTap: () => animatedNavigateTo(context, ProfileScreen()),
              ),
            ],
          ),

          // Search field and Generate by AI button row (restored)
          Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => const SearchScreen()),
                    );
                  },
                  child: Container(
                    height: 40,
                    decoration: BoxDecoration(
                      color: const Color(0xFF2D393A),
                      borderRadius: BorderRadius.circular(6),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0x26000000),
                          blurRadius: 4,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        SizedBox(width: 16),
                        Icon(Icons.search, color: Colors.white, size: 18),
                        SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            translator.searchDietPlanWorkout,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 13,
                              fontFamily: 'Outfit',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(width: 12),
              Container(
                // width: 103,
                height: 39,
                padding: EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [Color(0xFF576666), Color(0xFF2C3437)],
                  ),
                  borderRadius: BorderRadius.circular(6),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0x26000000),
                      blurRadius: 4,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Center(
                  child: Text(
                    translator.generateByAI,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                      fontFamily: 'Outfit',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
