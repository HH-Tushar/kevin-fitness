import 'package:flutter/material.dart';
import 'package:kenvinorellana/common/navigator.dart';
import 'package:provider/provider.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

import '../../../../application/auth/auth_controller.dart';
import '../../../../application/daily_plan/daily_plan_repo.dart';
import '../../../../application/daily_plan/models/ai_gen_meals_plan.dart';
import '../../../../common/colors.dart';
import '../../../../common/gaps.dart';
import '../../../../translation/localization.dart';
import '../../daily_details/Meal_plan_daily.dart';
part 'components/tiles.dart';
part 'components/day_tile.dart';

class AiGenMealsPlanList extends StatefulWidget {
  const AiGenMealsPlanList({super.key, required this.planId});
  final int planId;
  @override
  State<AiGenMealsPlanList> createState() => _AiGenMealsPlanListState();
}

class _AiGenMealsPlanListState extends State<AiGenMealsPlanList> {
  bool isLoading = false;
  AiGeneratedMealPlans? aiGeneratedMealPlans;
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

    final (data, error) = await dailyPlanRepo.get15DaysMealPlan(
      token: token!,
      language: lan,
      id: widget.planId,
    );
    if (data != null) {
      aiGeneratedMealPlans = data;
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
      // appBar: childAppBar(context: context),
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: SizedBox(
              height: 220,
              child: Stack(
                children: [
                  Image.asset(
                    "assets/images/meal_bg.png",
                    height: 220,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  Positioned.fill(child: ColoredBox(color: imageShadowColor)),
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
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: customDarkTeal,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(defaultRadius * 1.5),
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
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          spacing: 20,
                          children: [
                            _macroTile(
                              value: aiGeneratedMealPlans!.status.day
                                  .toStringAsFixed(0),
                              label: 'Days',
                            ),
                            _macroTile(
                              value:
                                  (aiGeneratedMealPlans!.status.totalCalories /
                                          15)
                                      .toStringAsFixed(0),
                              label: 'Avg Calories',
                            ),
                            _macroTile(
                              value: aiGeneratedMealPlans!.status.totalMeals
                                  .toStringAsFixed(0),
                              label: 'Total Meals',
                            ),
                          ],
                        ),
                ),

                Expanded(
                  child: ListView.builder(
                    padding: EdgeInsets.symmetric(horizontal: defaultPadding),
                    itemCount: aiGeneratedMealPlans?.days.length ?? 0,
                    itemBuilder: (context, index) => Padding(
                      padding: EdgeInsets.only(
                        top: defaultPadding,
                        bottom: index == aiGeneratedMealPlans!.days.length - 1
                            ? defaultPadding * 2
                            : 0,
                      ),
                      child: GestureDetector(
                        onTap: () => animatedNavigateTo(
                          context,
                          MealPlanDailyView(
                            day: index + 1,
                            mealId: aiGeneratedMealPlans!.days[index].id,
                          ),
                        ),
                        child: _MealDayCard(
                          day: aiGeneratedMealPlans!.days[index],
                          dayNumber: index + 1,
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
