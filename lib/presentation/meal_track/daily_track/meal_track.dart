import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:go_router/go_router.dart';
import 'package:kenvinorellana/common/colors.dart';
import 'package:kenvinorellana/common/gaps.dart';

part 'components/meal_tile.dart';

class MealPlanDayScreen extends StatelessWidget {
  final int day;
  const MealPlanDayScreen({super.key, this.day = 3});

  @override
  Widget build(BuildContext context) {
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

          // Positioned(
          //   left: 0,
          //   top: 48,
          //   child: IconButton(
          //     onPressed: () => Navigator.of(context).pop(),
          //     icon: Icon(Icons.arrow_back, color: Colors.white, size: 22),
          //   ),
          // ),
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

                  // child: Padding(
                  //   padding: EdgeInsets.only(top: 33, left: 70, right: 70),
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //     children: const [
                  //       _MacroStat(value: '280g', label: 'Protein'),
                  //       _MacroStat(value: '35g', label: 'Carbs'),
                  //       _MacroStat(value: '12g', label: 'Fat'),
                  //     ],
                  //   ),
                  // ),
                  padding: EdgeInsets.symmetric(
                    vertical: 20,
                    horizontal: defaultPadding * 3,
                  ),
                  child: Column(
                    children: [
                      vPad10,
                      Text(
                        "20000",
                        style: TextStyle(
                          fontSize: 27,
                          color: customWhite,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        "of 2000 calories",
                        style: TextStyle(
                          fontSize: 15,
                          color: customWhite,
                          // fontWeight: FontWeight.w600,
                        ),
                      ),
                      vPad20,
                      Stack(
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
                            width: 200,
                            decoration: BoxDecoration(
                              color: customTeal,
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ),
                        ],
                      ),
                      vPad20,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        spacing: 20,
                        children: const [
                          _MacroStat(value: '280g', label: 'Protein'),
                          _MacroStat(value: '35g', label: 'Carbs'),
                          _MacroStat(value: '12g', label: 'Fat'),
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
                    padding: EdgeInsets.symmetric(
                      horizontal: defaultPadding * 1.5,
                    ),

                    decoration: BoxDecoration(
                      color: customDarkTeal,
                      borderRadius: BorderRadius.circular(defaultRadius),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        vPad5,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Today’s Meal Plan",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                fontFamily: "Outfit",
                                color: customWhite,
                              ),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.add, color: customWhite),
                            ),
                          ],
                        ),
                        Expanded(
                          child: ListView(
                            padding: EdgeInsets.all(0),
                            children: [
                              _MealCard(
                                image:
                                    'https://images.pexels.com/photos/461382/pexels-photo-461382.jpeg',
                                mealType: 'Breakfast',
                                mealName: 'Protein-Packed Pancakes',
                                time: '10 min',
                                calories: '340',
                                onTap: () {
                                  // context.push('/meal-detail', extra: {
                                  //   'imageUrl': 'https://images.pexels.com/photos/461382/pexels-photo-461382.jpeg',
                                  //   'title': 'Protein-Packed Pancakes',
                                  //   'difficulty': 'Easy',
                                  //   'rating': 4.8,
                                  //   'time': 10,
                                  //   'servings': 3,
                                  //   'calories': 340,
                                  //   'protein': 280,
                                  //   'carbs': 35,
                                  //   'fat': 12,
                                  //   'tags': ['High protein', 'Quick', 'Breakfast'],
                                  //   'ingredients': [
                                  //     '1 cup oat flour',
                                  //     '2 scoops vanilla protein powder',
                                  //     '2 eggs',
                                  //     '1 cup almond milk',
                                  //     '1 tsp baking powder',
                                  //     '1 tbsp honey',
                                  //     '1/2 tsp vanilla extract',
                                  //     'Pinch of salt',
                                  //   ],
                                  //   'healthyTip': 'Swap honey with sugar-free maple syrup to reduce calories by 60 and make it diabetic-friendly!',
                                  // });
                                },
                              ),
                              SizedBox(height: 12),
                              _MealCard(
                                image:
                                    'https://images.pexels.com/photos/461382/pexels-photo-461382.jpeg',
                                mealType: 'Lunch',
                                mealName: 'Protein-Packed Pancakes',
                                time: '10 min',
                                calories: '340',
                                onTap: () {
                                  // context.push(
                                  //   '/meal-detail',
                                  //   extra: {
                                  //     'imageUrl':
                                  //         'https://images.pexels.com/photos/70497/pexels-photo-70497.jpeg',
                                  //     'title': 'Protein-Packed Pancakes',
                                  //     'difficulty': 'Easy',
                                  //     'rating': 4.7,
                                  //     'time': 10,
                                  //     'servings': 2,
                                  //     'calories': 340,
                                  //     'protein': 220,
                                  //     'carbs': 30,
                                  //     'fat': 10,
                                  //     'tags': ['Healthy', 'Quick', 'Lunch'],
                                  //     'ingredients': [
                                  //       '2 slices whole grain bread',
                                  //       '1 ripe avocado',
                                  //       'Salt and pepper to taste',
                                  //       'Lemon juice',
                                  //     ],
                                  //     'healthyTip':
                                  //         'Use whole grain bread for extra fiber and nutrients.',
                                  //   },
                                  // );
                                },
                              ),
                              SizedBox(height: 12),
                              _MealCard(
                                image:
                                    'https://images.pexels.com/photos/5938/food-salad-healthy-lunch.jpg',
                                mealType: 'Snacks',
                                mealName: 'Protein-Packed Pancakes',
                                time: '10 min',
                                calories: '340',
                                onTap: () {
                                  // context.push(
                                  //   '/meal-detail',
                                  //   extra: {
                                  //     'imageUrl':
                                  //         'https://images.pexels.com/photos/461382/pexels-photo-461382.jpeg',
                                  //     'title': 'Berry Smoothie',
                                  //     'difficulty': 'Easy',
                                  //     'rating': 4.9,
                                  //     'time': 5,
                                  //     'servings': 1,
                                  //     'calories': 180,
                                  //     'protein': 20,
                                  //     'carbs': 22,
                                  //     'fat': 4,
                                  //     'tags': ['Healthy', 'Quick', 'Snack'],
                                  //     'ingredients': [
                                  //       '1 cup mixed berries',
                                  //       '1/2 cup Greek yogurt',
                                  //       '1/2 cup almond milk',
                                  //       '1 tbsp honey',
                                  //     ],
                                  //     'healthyTip':
                                  //         'Add chia seeds for extra omega-3 and fiber.',
                                  //   },
                                  // );
                                },
                              ),
                              SizedBox(height: 12),
                              _MealCard(
                                image:
                                    'https://images.pexels.com/photos/70497/pexels-photo-70497.jpeg',
                                mealType: 'Dinner',
                                mealName: 'Protein-Packed Pancakes',
                                time: '10 min',
                                calories: '340',
                                onTap: () {
                                  context.push(
                                    '/meal-detail',
                                    extra: {
                                      'imageUrl':
                                          'https://images.pexels.com/photos/70497/pexels-photo-70497.jpeg',
                                      'title': 'Protein-Packed Pancakes',
                                      'difficulty': 'Easy',
                                      'rating': 4.8,
                                      'time': 10,
                                      'servings': 2,
                                      'calories': 340,
                                      'protein': 200,
                                      'carbs': 25,
                                      'fat': 8,
                                      'tags': ['Dinner', 'Quick'],
                                      'ingredients': [
                                        '1 cup oat flour',
                                        '2 scoops vanilla protein powder',
                                        '2 eggs',
                                        '1 cup almond milk',
                                        '1 tsp baking powder',
                                        '1 tbsp honey',
                                        '1/2 tsp vanilla extract',
                                        'Pinch of salt',
                                      ],
                                      'healthyTip':
                                          'Try adding cinnamon for extra flavor.',
                                    },
                                  );
                                },
                              ),

                              vPad20,
                            ],
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
    return Expanded(
      child: Column(
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
          vPad10,
          Stack(
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
                width: 50,
                decoration: BoxDecoration(
                  color: customTeal,
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
