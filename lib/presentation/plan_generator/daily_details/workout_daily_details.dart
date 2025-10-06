import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:kenvinorellana/common/navigator.dart';
import 'package:provider/provider.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

import '../../../application/auth/auth_controller.dart';
import '../../../application/daily_plan/daily_plan_repo.dart';
import '../../../application/daily_plan/models/ai_gen_workout_plans.dart';
import '../../../application/daily_plan/models/daily_workout_plan.dart';
import '../../../common/colors.dart';
import '../../../common/gaps.dart';
import '../../../translation/localization.dart';
import '../../workout_track/workout_details/workout_details.dart';

class WorkoutDailyPlanDetails extends StatefulWidget {
  const WorkoutDailyPlanDetails({super.key, required this.day});
  final Day day;
  @override
  State<WorkoutDailyPlanDetails> createState() =>
      _WorkoutDailyPlanDetailsState();
}

class _WorkoutDailyPlanDetailsState extends State<WorkoutDailyPlanDetails> {
  bool isLoading = false;
  DailyWorkoutPlanDetails? dailyWorkoutPlanDetails;
  final DailyPlanRepo dailyPlanRepo = DailyPlanRepo();

  void fetchDailyPlan() async {
    final lan = Provider.of<LanguageProvider>(
      context,
      listen: false,
    ).currentLanguage;
    final token = Provider.of<AuthController>(
      context,
      listen: false,
    ).accessToken;
    setState(() {
      isLoading = true;
    });
    final (data, error) = await dailyPlanRepo.getDailyWorkOutPlanDetails(
      token: token!,
      language: lan,
      id: widget.day.id,
    );
    if (data != null) {
      dailyWorkoutPlanDetails = data;
    }
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    fetchDailyPlan();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: SizedBox(
              height: 220,
              width: double.infinity,
              child: Stack(
                children: [
                  Image.asset(
                    "assets/images/workout_bg.png",
                    height: 220,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  Positioned.fill(child: Container(color: imageShadowColor)),
                ],
              ),
            ),
          ),
          Positioned(
            left: 10,
            top: 50,
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back, color: customWhite),
            ),
          ),
          Positioned(
            left: 25,
            top: 155,
            child: Text(
              widget.day.day,
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontFamily: 'Outfit',
                fontWeight: FontWeight.w600,
              ),
            ),
          ),

          Positioned(
            top: 200,
            left: 0,
            right: 0,
            bottom: 0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
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
                  child: isLoading
                      ? _loadingShimmer()
                      : dailyWorkoutPlanDetails == null
                      ? Text("No data")
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          spacing: 20,
                          children: [
                            _macroTile(
                              value: dailyWorkoutPlanDetails!
                                  .status
                                  .totalDurationMinutes
                                  .toString(),
                              label: 'Duration',
                            ),
                            _macroTile(
                              value: dailyWorkoutPlanDetails!
                                  .status
                                  .totalWorkout
                                  .toString(),
                              label: 'Exercise',
                            ),
                            _macroTile(
                              value: dailyWorkoutPlanDetails!
                                  .status
                                  .totalCaloriesBurn
                                  .toStringAsFixed(0),
                              label: 'Calories',
                            ),
                          ],
                        ),
                ),
                vPad10,
                // vPad20,
                Expanded(
                  child: MediaQuery.removePadding(
                    removeTop: true,
                    context: context,

                    child: RefreshIndicator(
                      onRefresh: () async {
                        fetchDailyPlan();
                      },
                      child: ListView.builder(
                        padding: EdgeInsets.symmetric(
                          horizontal: defaultPadding,
                        ),
                        itemCount:
                            dailyWorkoutPlanDetails?.workouts.length ?? 0,
                        itemBuilder: (context, index) {
                          final item = dailyWorkoutPlanDetails?.workouts[index];
                          return Padding(
                            padding: EdgeInsets.only(
                              top: 12,
                              bottom:
                                  index ==
                                      dailyWorkoutPlanDetails!.workouts.length -
                                          1
                                  ? defaultPadding * 2
                                  : 0,
                            ),

                            child: GestureDetector(
                              onTap: () => animatedNavigateTo(
                                context,
                                WorkoutDetailsView(workout: item.workout),
                              ),
                              child: Container(
                                // padding: EdgeInsets.all(defaultPadding),
                                decoration: BoxDecoration(
                                  border: Border.all(color: customGreyText),
                                  borderRadius: BorderRadius.circular(
                                    defaultRadius / 2,
                                  ),
                                ),
                                child: Row(
                                  spacing: 20,
                                  children: [
                                    ClipRRect(
                                      borderRadius:
                                          BorderRadiusGeometry.horizontal(
                                            left: Radius.circular(
                                              defaultRadius / 2,
                                            ),
                                          ),
                                      child: CachedNetworkImage(
                                        imageUrl: item!.workout.image,
                                        height: 90,
                                        width: 120,
                                        fit: BoxFit.cover,
                                      ),
                                    ),

                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      spacing: 4,
                                      children: [
                                        Text(
                                          item.workout.workoutName,
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: customWhite,
                                            fontFamily: "Outfit",
                                          ),
                                        ),
                                        Text(
                                          "${item.setOf} sets x ${item.reps} reps",
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: customWhite,
                                            fontFamily: "Outfit",
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            // child: _WorkoutDayCard(
                            //   day: dailyWorkoutPlanDetails!.workouts[index],
                            //   isToday:
                            //       dailyWorkoutPlanDetails!.workouts[index].date.day ==
                            //       DateTime.now().day,
                            // ),
                          );
                        },
                      ),
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

Widget _macroTile({required String value, required String label}) {
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

_loadingShimmer() {
  return Row(
    spacing: 10,
    children: [
      ...List.generate(
        3,
        (i) => Expanded(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(defaultPadding / 2),
            child: Shimmer(
              color: Colors.grey,
              child: Container(height: 50, color: customGrey),
            ),
          ),
        ),
      ),
    ],
  );
}
