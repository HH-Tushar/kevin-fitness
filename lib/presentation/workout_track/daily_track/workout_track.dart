import 'package:flutter/material.dart';
import 'package:kenvinorellana/common/navigator.dart';
import 'package:kenvinorellana/presentation/workout_track/workout_details/workout_details.dart';
import 'package:kenvinorellana/translation/localization.dart';
import 'package:provider/provider.dart';
import '../../../providers/daily_plan_provider.dart';
import '/common/colors.dart';
import '/common/gaps.dart';

part 'components/tile.dart';

class WorkOutTrackView extends StatelessWidget {
  final int day;
  final bool? shouldPop;
  const WorkOutTrackView({super.key, this.day = 3, this.shouldPop});

  @override
  Widget build(BuildContext context) {
    final DailyPlanProvider dailyPlanProvider = context.watch();
    final LanguageProvider lan = context.watch();
    final status = dailyPlanProvider.todayWorkoutPlan?.status;
    final translator = lan.homeTranslation;
    return Scaffold(
      backgroundColor: customGrey,
      body: Stack(
        children: [
          // Top background image with overlay
          Positioned(
            left: 0,
            right: 0,
            top: 0,
            child: SizedBox(
              width: 1,
              height: 213,
              child: Stack(
                children: [
                  Positioned.fill(
                    child: Image.asset(
                      'assets/images/workout_bg.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned.fill(child: Container(color: imageShadowColor)),

                  // Positioned(
                  //   right: 20.w,
                  //   top: 48.h,
                  //   child: Icon(Icons.more_vert, color: Colors.white, size: 20.sp),
                  // ),
                ],
              ),
            ),
          ),
          if (shouldPop == true)
            Positioned(
              left: 0,
              top: 48,
              child: IconButton(
                onPressed: () => Navigator.of(context).pop(),
                icon: Icon(Icons.arrow_back, color: Colors.white, size: 22),
              ),
            ),
          // Day title
          Positioned(
            left: 30,
            top: 155,
            child: Text(
              translator.todayWorkoutPlan,
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontFamily: 'Outfit',
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          // Macro summary card
          Positioned(
            left: 0,
            right: 0,
            top: 198,
            bottom: 0,
            child: Column(
              children: [
                Container(
                  // width: 100,
                  // height: 94,
                  decoration: BoxDecoration(
                    color: customDarkTeal,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(defaultRadius),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0x26000000),
                        blurRadius: 4,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),

                  padding: EdgeInsets.symmetric(
                    vertical: 20,
                    horizontal: defaultPadding * 3,
                  ),
                  child: Column(
                    children: [
                      vPad10,

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        spacing: 20,
                        children: [
                          _MacroStat(
                            value:
                                "${status?.totalCaloriesBurn.toStringAsFixed(0)} mins",
                            label: translator.duration,
                          ),
                          _MacroStat(
                            value:
                                status?.totalWorkout.toStringAsFixed(0) ?? "0",
                            label: translator.exercise,
                          ),
                          _MacroStat(
                            value:
                                status?.totalCaloriesBurn.toStringAsFixed(0) ??
                                "0",
                            label: translator.calorieCount,
                          ),
                        ],
                      ),
                      vPad35,

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            translator.progress,
                            style: TextStyle(
                              fontSize: 13,
                              color: customGreyText,
                            ),
                          ),
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: status?.totalCompletedDays.toString(),
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                    color: customWhite,
                                  ),
                                ),
                                TextSpan(
                                  text: "/15 days",
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: customGreyText,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      vPad10,
                      LayoutBuilder(
                        builder: (context, constraints) {
                          final double fraction =
                              ((status?.totalCompletedDays ?? 15) / 15).clamp(
                                0.0,
                                1.0,
                              );

                          final width = constraints.maxWidth * fraction;
                          return Stack(
                            children: [
                              Container(
                                height: 10,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: customGreyText,
                                  borderRadius: BorderRadius.circular(4),
                                ),
                              ),
                              Container(
                                height: 10,
                                width: width,
                                decoration: BoxDecoration(
                                  color: customDeepPurple,
                                  borderRadius: BorderRadius.circular(4),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                      vPad10,
                    ],
                  ),
                ),
                vPad10,
                Expanded(
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: defaultPadding),

                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        vPad5,
                        Text(
                          translator.todayWorkoutPlan,
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            fontFamily: "Outfit",
                            color: customWhite,
                          ),
                        ),
                        vPad10,
                        Expanded(
                          child: MediaQuery.removePadding(
                            context: context,
                            removeTop: true,
                            child: ListView.builder(
                              itemCount:
                                  dailyPlanProvider
                                      .todayWorkoutPlan
                                      ?.workouts
                                      .length ??
                                  0,
                              itemBuilder: (context, index) {
                                final item = dailyPlanProvider
                                    .todayWorkoutPlan
                                    ?.workouts[index];
                                0;
                                return GestureDetector(
                                  onTap: () {
                                    animatedNavigateTo(
                                      context,
                                      WorkoutDetailsView(workout: item.workout),
                                    );
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: _WorkOutTile(
                                      image: item!.workout.image,
                                      times: 16,
                                      isDone: item.completed,
                                      title: item.workout.workoutType,
                                      duration: item.workout.timeNeeded,
                                      onTap: () {
                                        dailyPlanProvider.markWorkoutAsDone(
                                          uniqueId: item.id ?? -1,
                                          contex: context,
                                        );
                                      },
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
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

class _MacroStat extends StatelessWidget {
  final String value;
  final String label;
  const _MacroStat({required this.value, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value,
          style: TextStyle(
            color: Colors.white,
            fontSize: 18.04,
            fontFamily: 'Outfit',
            fontWeight: FontWeight.w600,
            letterSpacing: 0.36,
            // height: 0,
          ),
        ),
        vPad5,
        Text(
          label,
          style: TextStyle(
            color: const Color(0xFFA0A0A6),
            fontSize: 14.63,
            fontFamily: 'Outfit',
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
