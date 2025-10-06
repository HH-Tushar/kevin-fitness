import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../application/auth/auth_controller.dart';
import '../../../application/daily_plan/daily_plan_repo.dart';
import '../../../application/daily_plan/models/daily_meal_plan.dart';
import '../../../common/colors.dart';
import '../../../common/gaps.dart';
import '../../../common/navigator.dart';
import '../../../common/shimmer_loading.dart';
import '../../../translation/localization.dart';
import '../../meal_track/meal_details/meal_details.dart';

part 'components/meal_loading.dart';
part 'components/meal_error.dart';
part 'components/meal_tile.dart';

class MealPlanDailyView extends StatefulWidget {
  const MealPlanDailyView({super.key, required this.mealId, required this.day});
  final int mealId;
  final int day;

  @override
  State<MealPlanDailyView> createState() => _MealPlanDailyViewState();
}

class _MealPlanDailyViewState extends State<MealPlanDailyView> {
  bool isLoading = false;
  DailyMealPlanDetails? dailyMealPlanDetails;
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
    final (data, error) = await dailyPlanRepo.getDailyMealPlanDetails(
      token: token!,
      language: lan,
      id: widget.mealId,
    );
    if (data != null) {
      dailyMealPlanDetails = data;
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
    final LanguageProvider languageProvider = context.watch();
    final translator = languageProvider.mealPlanTranslation;
    return Scaffold(
      body: isLoading
          ? _buildShimmerContent(context)
          : !isLoading && dailyMealPlanDetails == null
          ? _buildErrorContent(
              context: context,
              day: widget.day,
              error: "Something went wrong please try again",
              errorTranslator: languageProvider.basicInfoTranslation.error,
            )
          : Stack(
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
                          "assets/images/meal_bg.png",
                          height: 220,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                        Positioned.fill(
                          child: Container(color: imageShadowColor),
                        ),
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
                    "${translator.day} ${widget.day}",
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
                  child: isLoading
                      ? Text("Loading")
                      : Column(
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
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                spacing: 20,
                                children: [
                                  _macroTile(
                                    value: dailyMealPlanDetails!
                                        .status
                                        .totalProtein
                                        .toString(),
                                    label: translator.protein,
                                  ),
                                  _macroTile(
                                    value: dailyMealPlanDetails!
                                        .status
                                        .totalCarbs
                                        .toString(),
                                    label: translator.carbs,
                                  ),
                                  _macroTile(
                                    value: dailyMealPlanDetails!.status.totalFat
                                        .toStringAsFixed(0),
                                    label: translator.calories,
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
                                        dailyMealPlanDetails?.meals.length ?? 0,
                                    itemBuilder: (context, index) {
                                      final item =
                                          dailyMealPlanDetails?.meals[index];
                                      return Padding(
                                        padding: EdgeInsets.only(
                                          top: 12,
                                          bottom:
                                              index ==
                                                  dailyMealPlanDetails!
                                                          .meals
                                                          .length -
                                                      1
                                              ? defaultPadding * 2
                                              : 0,
                                        ),

                                        child: GestureDetector(
                                          onTap: () => animatedNavigateTo(
                                            context,
                                            MealDetailsView(
                                              mealUniqueId:
                                                  item.recipe.uniqueId,
                                              recipeDetails: item.recipe,
                                            ),
                                          ),
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: customGrey,
                                              // border: Border.all(
                                              //   color: customGreyText,
                                              // ),
                                              borderRadius:
                                                  BorderRadius.circular(
                                                    defaultRadius / 2,
                                                  ),
                                            ),
                                            child: Row(
                                              spacing: 2,
                                              children: [
                                                ClipRRect(
                                                  borderRadius:
                                                      BorderRadiusGeometry.horizontal(
                                                        left: Radius.circular(
                                                          defaultRadius / 2,
                                                        ),
                                                      ),
                                                  child: CachedNetworkImage(
                                                    imageUrl:
                                                        item!.recipe.image,
                                                    height: 135,
                                                    width: 110,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),

                                                Expanded(
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                          8.0,
                                                        ),
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Text(
                                                              item.mealType,
                                                              style: TextStyle(
                                                                color:
                                                                    const Color(
                                                                      0xFFA0A0A6,
                                                                    ),
                                                                fontSize: 14,
                                                                fontFamily:
                                                                    'Outfit',
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                              ),
                                                            ),

                                                            GestureDetector(
                                                              // onTap: onMakingTap,
                                                              child: Container(
                                                                padding:
                                                                    EdgeInsets.symmetric(
                                                                      horizontal:
                                                                          12,
                                                                      vertical:
                                                                          6,
                                                                    ),
                                                                decoration: BoxDecoration(
                                                                  color: const Color(
                                                                    0xFF134E48,
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius.circular(
                                                                        12,
                                                                      ),
                                                                  boxShadow: [
                                                                    BoxShadow(
                                                                      color: const Color(
                                                                        0x40000000,
                                                                      ),
                                                                      blurRadius:
                                                                          2,
                                                                      offset:
                                                                          const Offset(
                                                                            0,
                                                                            1,
                                                                          ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                child: Text(
                                                                  'Making',
                                                                  style: TextStyle(
                                                                    color: Colors
                                                                        .white,
                                                                    fontSize:
                                                                        10,
                                                                    fontFamily:
                                                                        'Outfit',
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        SizedBox(height: 2),
                                                        Text(
                                                          item
                                                              .recipe
                                                              .recipeName,
                                                          style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 15,
                                                            fontFamily:
                                                                'Outfit',
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          ),
                                                          maxLines: 2,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                        ),
                                                        // hPad10,
                                                        Row(
                                                          children: [
                                                            Icon(
                                                              Icons.access_time,
                                                              size: 15,
                                                              color:
                                                                  const Color(
                                                                    0xFFA0A0A6,
                                                                  ),
                                                            ),
                                                            hPad5,
                                                            Text(
                                                              item
                                                                  .recipe
                                                                  .makingTime,
                                                              style: TextStyle(
                                                                color:
                                                                    const Color(
                                                                      0xFFA0A0A6,
                                                                    ),
                                                                fontSize: 11,
                                                                fontFamily:
                                                                    'Outfit',
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                              ),
                                                            ),
                                                            hPad15,
                                                            Icon(
                                                              Icons.scale,
                                                              size: 15,
                                                              color:
                                                                  const Color(
                                                                    0xFFA0A0A6,
                                                                  ),
                                                            ),
                                                            hPad5,
                                                            Text(
                                                              '${item.grams}g',
                                                              style: TextStyle(
                                                                color:
                                                                    const Color(
                                                                      0xFFA0A0A6,
                                                                    ),
                                                                fontSize: 11,
                                                                fontFamily:
                                                                    'Outfit',
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        vPad5,
                                                        //Nutrition info
                                                        Row(
                                                          children: [
                                                            _NutritionInfo(
                                                              label: translator
                                                                  .calories,
                                                              value:
                                                                  item
                                                                      .recipe
                                                                      .calories +
                                                                  translator
                                                                      .kcal,
                                                              icon: Icons.bolt,
                                                            ),
                                                            hPad15,
                                                            _NutritionInfo(
                                                              label: translator
                                                                  .carbs,
                                                              value:
                                                                  "${item.recipe.carbs}g",
                                                              icon: Icons.grain,
                                                            ),
                                                            hPad15,
                                                            _NutritionInfo(
                                                              label: translator
                                                                  .protein,
                                                              value:
                                                                  "${item.recipe.protein}g",
                                                              icon: Icons
                                                                  .fitness_center,
                                                            ),
                                                            hPad15,
                                                            _NutritionInfo(
                                                              label: translator
                                                                  .fat,
                                                              value:
                                                                  "${item.recipe.fat}g",
                                                              icon: Icons
                                                                  .water_drop,
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ),
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
