import 'package:flutter/material.dart';
import 'package:kenvinorellana/common/navigator.dart';
import '../../daily_details/workout_daily_details.dart';
import '/application/auth/auth_controller.dart';
import '/translation/localization.dart';
import 'package:provider/provider.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

import '../../../../application/daily_plan/daily_plan_repo.dart';
import '../../../../application/daily_plan/models/ai_gen_workout_plans.dart';
import '../../../../common/colors.dart';
import '../../../../common/gaps.dart';
part 'components/tiles.dart';

class AiGenWorkOutPlansList extends StatefulWidget {
  const AiGenWorkOutPlansList({super.key, required this.planId});
  final int planId;
  @override
  State<AiGenWorkOutPlansList> createState() => _AiGenWorkOutPlansListState();
}

class _AiGenWorkOutPlansListState extends State<AiGenWorkOutPlansList> {
  bool isLoading = false;
  AiGeneratedWorkOutPlans? aiGeneratedWorkOutPlans;
  final DailyPlanRepo dailyPlanRepo = DailyPlanRepo();

  void fetchPlan() async {
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

    final (data, error) = await dailyPlanRepo.get15DaysWorkOutPlan(
      token: token!,
      language: lan,
      // id: mealPlanId,
    );
    if (data != null) {
      aiGeneratedWorkOutPlans = data;
    }

    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    fetchPlan();
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
              'Todays Workout Plan',
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
                      : aiGeneratedWorkOutPlans == null
                      ? Text("No data")
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          spacing: 20,
                          children: [
                            _macroTile(
                              value: aiGeneratedWorkOutPlans!.status.totalDays
                                  .toString(),
                              label: 'Days',
                            ),
                            _macroTile(
                              value: aiGeneratedWorkOutPlans!.status.averageTime
                                  .toString(),
                              label: 'Avg Time',
                            ),
                            _macroTile(
                              value: aiGeneratedWorkOutPlans!
                                  .status
                                  .totalWorkouts
                                  .toString(),
                              label: 'Workouts',
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
                        fetchPlan();
                      },
                      child: ListView.builder(
                        padding: EdgeInsets.symmetric(
                          horizontal: defaultPadding,
                        ),
                        itemCount: aiGeneratedWorkOutPlans?.days.length ?? 0,
                        itemBuilder: (context, index) => Padding(
                          padding: EdgeInsets.only(
                            top: 12,
                            bottom:
                                index ==
                                    aiGeneratedWorkOutPlans!.days.length - 1
                                ? defaultPadding * 2
                                : 0,
                          ),
                          child: _WorkoutDayCard(
                            day: aiGeneratedWorkOutPlans!.days[index],
                            isToday:
                                aiGeneratedWorkOutPlans!.days[index].date.day ==
                                DateTime.now().day,
                          ),
                        ),
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
