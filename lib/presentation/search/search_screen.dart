import 'package:flutter/material.dart';

import 'package:fl_chart/fl_chart.dart';
import 'package:go_router/go_router.dart';
import 'package:kenvinorellana/common/colors.dart';
import 'package:kenvinorellana/common/gaps.dart';
import 'package:kenvinorellana/common/navigator.dart';
import 'package:kenvinorellana/presentation/workout_track/workout_details/workout_details.dart';
import 'package:provider/provider.dart';

import '../../application/daily_plan/models/daily_meal_plan.dart';
import '../../application/daily_plan/models/daily_workout_plan.dart';
import '../../application/daily_plan/search_repo.dart';
import '../../common/shimmer_loading.dart';
import '../../translation/localization.dart';

part 'components/macro_legend_dot.dart';
part 'components/exercise_list_view.dart';
part 'components/filter_tag.dart';

part 'layers/meal.dart';
part 'layers/workout.dart';
part 'layers/loading.dart';

part 'controller.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => _SearchController(context: context),
      child: _Layout(),
    );
  }
}

class _Layout extends StatelessWidget {
  const _Layout();

  @override
  Widget build(BuildContext context) {
    final _SearchController controller = context.watch();
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: Icon(Icons.arrow_back, color: customWhite),
                ),
                hPad5,
                Expanded(
                  child: Text(
                    "Search",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontFamily: 'Outfit',
                      fontWeight: FontWeight.w600,
                      // height: 0.71,
                      // letterSpacing: 1.5,
                    ),
                  ),
                ),
                hPad20,
                hPad20,
              ],
            ),
            vPad10,

            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
                child: DefaultTabController(
                  length: 2,
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: const Color(0xFF232B2D),
                          borderRadius: BorderRadius.circular(8),
                        ),

                        child: TabBar(
                          dividerHeight: 0,
                          // se
                          labelColor: customWhite,
                          unselectedLabelColor: customGreyText,
                          indicator: BoxDecoration(
                            color: customGrey,
                            border: Border.all(color: customLightBlue),
                            borderRadius: BorderRadius.circular(8),
                          ),

                          indicatorSize: TabBarIndicatorSize.tab,
                          labelStyle: TextStyle(
                            fontSize: 16,
                            fontFamily: 'Outfit',
                            fontWeight: FontWeight.w600,
                          ),
                          tabs: [
                            Tab(text: "Meals"),
                            Tab(text: "Workouts"),
                          ],
                        ),
                      ),
                      vPad15,

                      // SizedBox(
                      //   // height: 80, // Fixed height for two rows
                      //   child: SingleChildScrollView(
                      //     scrollDirection: Axis.horizontal,
                      //     child: Padding(
                      //       padding: EdgeInsets.symmetric(horizontal: 4),
                      //       child: Row(
                      //         spacing: 10,
                      //         children: controller.selectedCategory == 0
                      //             ? [
                      //                 _FilterTag2(
                      //                   label: 'High protein',
                      //                   selected:
                      //                       controller.selectedFilterTag ==
                      //                       'High protein',
                      //                   onTap: () {},
                      //                 ),

                      //                 _FilterTag2(
                      //                   label: 'Healthy',
                      //                   selected:
                      //                       controller.selectedFilterTag ==
                      //                       'Healthy',
                      //                   onTap: () {},
                      //                 ),

                      //                 _FilterTag2(
                      //                   label: 'Cheat meal',
                      //                   selected:
                      //                       controller.selectedFilterTag ==
                      //                       'Cheat meal',
                      //                   onTap: () {},
                      //                 ),

                      //                 _FilterTag2(
                      //                   label: 'Quick recipe',
                      //                   selected:
                      //                       controller.selectedFilterTag ==
                      //                       'Quick recipe',
                      //                   onTap: () {},
                      //                 ),

                      //                 _FilterTag2(
                      //                   label: 'Low carb',
                      //                   selected:
                      //                       controller.selectedFilterTag ==
                      //                       'Low carb',
                      //                   onTap: () {},
                      //                 ),

                      //                 _FilterTag2(
                      //                   label: 'Vegetarian',
                      //                   selected:
                      //                       controller.selectedFilterTag ==
                      //                       'Vegetarian',
                      //                   onTap: () {},
                      //                 ),

                      //                 _FilterTag2(
                      //                   label: 'Gluten free',
                      //                   selected:
                      //                       controller.selectedFilterTag ==
                      //                       'Gluten free',
                      //                   onTap: () {},
                      //                 ),

                      //                 _FilterTag2(
                      //                   label: 'Keto',
                      //                   selected:
                      //                       controller.selectedFilterTag ==
                      //                       'Keto',
                      //                   onTap: () {},
                      //                 ),
                      //               ]
                      //             : [
                      //                 _FilterTag2(
                      //                   label: 'Leg',
                      //                   selected:
                      //                       controller.selectedFilterTag ==
                      //                       'Leg',
                      //                   onTap: () {},
                      //                 ),

                      //                 _FilterTag2(
                      //                   label: 'Chest',
                      //                   selected:
                      //                       controller.selectedFilterTag ==
                      //                       'Chest',
                      //                   onTap: () {},
                      //                 ),

                      //                 _FilterTag2(
                      //                   label: 'Arm',
                      //                   selected:
                      //                       controller.selectedFilterTag ==
                      //                       'Arm',
                      //                   onTap: () {},
                      //                 ),

                      //                 _FilterTag2(
                      //                   label: 'Belly',
                      //                   selected:
                      //                       controller.selectedFilterTag ==
                      //                       'Belly',
                      //                   onTap: () {},
                      //                 ),

                      //                 _FilterTag2(
                      //                   label: 'Full body',
                      //                   selected:
                      //                       controller.selectedFilterTag ==
                      //                       'Full body',
                      //                   onTap: () {},
                      //                 ),

                      //                 _FilterTag2(
                      //                   label: 'Back',
                      //                   selected:
                      //                       controller.selectedFilterTag ==
                      //                       'Back',
                      //                   onTap: () {},
                      //                 ),

                      //                 _FilterTag2(
                      //                   label: 'Shoulder',
                      //                   selected:
                      //                       controller.selectedFilterTag ==
                      //                       'Shoulder',
                      //                   onTap: () {},
                      //                 ),

                      //                 _FilterTag2(
                      //                   label: 'Cardio',
                      //                   selected:
                      //                       controller.selectedFilterTag ==
                      //                       'Cardio',
                      //                   onTap: () {},
                      //                 ),
                      //               ],
                      //       ),
                      //     ),
                      //   ),
                      // ),
                      // vPad10,
                      Expanded(
                        child: TabBarView(
                          children: [_MealListView(), _WorkoutListView()],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
