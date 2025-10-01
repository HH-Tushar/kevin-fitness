import 'package:flutter/material.dart';


import 'package:fl_chart/fl_chart.dart';
import 'package:go_router/go_router.dart';

part 'components/meal_list.dart';
part 'components/macro_legend_dot.dart';
part 'components/exercise_list_view.dart';
part 'components/filter_tag.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final selectedCategory = ref.watch(searchCategoryProvider);
    // final searchQuery = ref.watch(searchQueryProvider);
    return Scaffold(
      backgroundColor: const Color(0xFF263133),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () => Navigator.of(context).pop(),
                  child: Icon(
                    Icons.arrow_back_ios_new_rounded,
                    color: Colors.white,
                    size: 22,
                  ),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: Container(
                    height: 42,
                    decoration: BoxDecoration(
                      color: const Color(0xFF2D393A),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      children: [
                        SizedBox(width: 12),
                        Icon(Icons.search, color: Colors.white, size: 20),
                        SizedBox(width: 8),
                        Expanded(
                          child: TextField(
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontFamily: 'Outfit',
                            ),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Search recipes, ingredients, workouts',
                              hintStyle: TextStyle(
                                color: Colors.white.withOpacity(0.6),
                                fontSize: 15,
                                fontFamily: 'Outfit',
                              ),
                            ),
                            // onChanged: (value) => ref.read(searchQueryProvider.notifier).state = value,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 16),
            // Animated Category toggle
            Container(
              height: 44,
              decoration: BoxDecoration(
                color: const Color(0xFF232B2D),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 220),
                      curve: Curves.easeInOut,
                      decoration: BoxDecoration(
                        // color: selectedCategory == 0 ? const Color(0xFF2D393A) : Colors.transparent,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          // color: selectedCategory == 0 ? const Color(0xFF8BF0E6) : Colors.transparent,
                          width: 1.5,
                        ),
                      ),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(8),
                        onTap: () {
                          // ref.read(searchCategoryProvider.notifier).state = 0;
                        },
                        child: Center(
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 10),
                            child: Text(
                              'Meals',
                              style: TextStyle(
                                // color: selectedCategory == 0 ? Colors.white : Colors.white.withOpacity(0.7),
                                fontSize: 15,
                                fontFamily: 'Outfit',
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 220),
                      curve: Curves.easeInOut,
                      decoration: BoxDecoration(
                        // color: selectedCategory == 1 ? const Color(0xFF2D393A) : Colors.transparent,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          // color: selectedCategory == 1 ? const Color(0xFF8BF0E6) : Colors.transparent,
                          width: 1.5,
                        ),
                      ),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(8),
                        onTap: () {
                          // ref.read(searchCategoryProvider.notifier).state = 1;
                        },
                        child: Center(
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 10),
                            child: Text(
                              'Exercises',
                              style: TextStyle(
                                // color: selectedCategory == 1 ? Colors.white : Colors.white.withOpacity(0.7),
                                fontSize: 15,
                                fontFamily: 'Outfit',
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 18),
            // Filter tags (placeholder, can be dynamic based on category)
            Wrap(
              spacing: 10,
              runSpacing: 8,
              // children: selectedCategory == 0
              //     ? [
              //         _FilterTag(label: 'High protein', count: 38, selected: false),
              //         _FilterTag(label: 'Healthy', count: 20, selected: false),
              //         _FilterTag(label: 'Cheat meal', count: 120, selected: false),
              //         _FilterTag(label: 'Quick recipe', count: 120, selected: false),
              //       ]
              //     :
              children: [
                _FilterTag(label: 'Leg', count: 38, selected: false),
                _FilterTag(label: 'Chest', count: 20, selected: false),
                _FilterTag(label: 'Arm', count: 120, selected: false),
                _FilterTag(label: 'Belly', count: 120, selected: false),
                _FilterTag(label: 'Full body', count: 120, selected: false),
              ],
            ),
            SizedBox(height: 18),
            // Dummy data list for selected category
            Expanded(
              child: 0 == 0
                  ? _MealListView(query: "searchQuery")
                  : _ExerciseListView(query: "searchQuery"),
            ),
          ],
        ),
      ),
    );
  }
}
