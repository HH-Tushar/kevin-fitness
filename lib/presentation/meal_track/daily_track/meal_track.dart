import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:go_router/go_router.dart';
import 'package:kenvinorellana/common/colors.dart';
import 'package:kenvinorellana/common/gaps.dart';
import 'package:kenvinorellana/common/navigator.dart';
import 'package:provider/provider.dart';

import '../../../providers/daily_plan_provider.dart';
import '../meal_details/meal_details.dart';

part 'components/meal_tile.dart';

class MealPlanDayScreen extends StatelessWidget {
  final int day;
  final bool? shouldPop;
  const MealPlanDayScreen({super.key, this.day = 3, this.shouldPop});

  @override
  Widget build(BuildContext context) {
    final DailyPlanProvider dailyPlanProvider = context.watch();
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
                      'assets/images/meal_bg.png',
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
              'Todays Meal Plan',
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
                        blurRadius: 2,
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
                      Text(
                        "${dailyPlanProvider.todayMealPlan?.stats.the15DayCompleted.calories.toInt() ?? 0}",
                        style: TextStyle(
                          fontSize: 27,
                          color: customWhite,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        "of ${dailyPlanProvider.todayMealPlan?.stats.the15DayTotals.calories.toInt() ?? 0} Calories",
                        style: TextStyle(
                          fontSize: 15,
                          color: customWhite,
                          // fontWeight: FontWeight.w600,
                        ),
                      ),
                      vPad20,
                      LayoutBuilder(
                        builder: (context, constraints) {
                          final total =
                              dailyPlanProvider
                                  .todayMealPlan
                                  ?.stats
                                  .the15DayTotals
                                  .calories
                                  .toInt() ??
                              0;
                          final completed =
                              dailyPlanProvider
                                  .todayMealPlan
                                  ?.stats
                                  .the15DayCompleted
                                  .calories
                                  .toInt() ??
                              0;
                          final double fraction = total > 0
                              ? (completed / total).clamp(0.0, 1.0)
                              : 0.0;

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
                                  color: customTeal,
                                  borderRadius: BorderRadius.circular(4),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                      vPad20,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        spacing: 20,
                        children: [
                          _MacroStat(
                            value:
                                dailyPlanProvider
                                    .todayMealPlan
                                    ?.stats
                                    .the15DayCompleted
                                    .calories
                                    .toInt() ??
                                0,
                            totalValue:
                                dailyPlanProvider
                                    .todayMealPlan
                                    ?.stats
                                    .the15DayTotals
                                    .calories
                                    .toInt() ??
                                0,
                            label: 'Protein',
                          ),
                          _MacroStat(
                            value:
                                dailyPlanProvider
                                    .todayMealPlan
                                    ?.stats
                                    .the15DayCompleted
                                    .carbs
                                    .toInt() ??
                                0,
                            totalValue:
                                dailyPlanProvider
                                    .todayMealPlan
                                    ?.stats
                                    .the15DayTotals
                                    .carbs
                                    .toInt() ??
                                0,
                            label: 'Carbs',
                          ),
                          _MacroStat(
                            value:
                                dailyPlanProvider
                                    .todayMealPlan
                                    ?.stats
                                    .the15DayCompleted
                                    .fat
                                    .toInt() ??
                                0,
                            totalValue:
                                dailyPlanProvider
                                    .todayMealPlan
                                    ?.stats
                                    .the15DayTotals
                                    .fat
                                    .toInt() ??
                                0,
                            label: 'Fat',
                          ),
                        ],
                      ),
                      vPad15,
                    ],
                  ),
                ),
                vPad10,
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(defaultPadding),
                    padding: EdgeInsets.symmetric(horizontal: defaultPadding),

                    decoration: BoxDecoration(
                      color: customDarkTeal,
                      borderRadius: BorderRadius.circular(defaultRadius),
                    ),
                    child: Column(
                      // mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        vPad15,

                        Text(
                          "Today’s Meal Plan",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            fontFamily: "Outfit",
                            color: customWhite,
                          ),
                        ),
                        vPad5,

                        Expanded(
                          child: MediaQuery.removePadding(
                            removeTop: true,
                            context: context,
                            child: ListView.builder(
                              itemCount:
                                  dailyPlanProvider
                                      .todayMealPlan
                                      ?.todayMeals
                                      .length ??
                                  0,
                              itemBuilder: (context, index) {
                                final item = dailyPlanProvider
                                    .todayMealPlan
                                    ?.todayMeals[index];
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: GestureDetector(
                                    onTap: () => animatedNavigateTo(
                                      context,
                                      MealDetailsView(
                                        recipeDetails: item.recipe,
                                        mealUniqueId: item.recipe.uniqueId,
                                      ),
                                    ),
                                    child: _MealCard(
                                      image: item!.recipe.image,
                                      mealType: item.mealType,
                                      isDone: item.completed,
                                      mealName: item.recipe.recipeName,
                                      time: item.recipe.makingTime,
                                      calories: item.recipe.calories,
                                      onTap: () {
                                        dailyPlanProvider.markMealPlanAsDone(
                                          uniqueId: item.recipe.uniqueId,
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
