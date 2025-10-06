part of '../search_screen.dart';
class _MealListView extends StatelessWidget {
  final String query;
  final List<Map<String, dynamic>> meals = const [
    {
      'image': 'https://images.unsplash.com/photo-1504674900247-0877df9cc836',
      'title': 'Protein-Packed Pancakes',
      'rating': 4.8,
      'difficulty': 'Easy',
      'time': 10,
      'calories': 340,
      'servings': 3,
      'macro': {'p': 40, 'v': 30, 'c': 30},
      'protein': 280,
      'carbs': 35,
      'fat': 12,
      'tags': ['High protein', 'Quick', 'Breakfast'],
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
      'healthyTip': 'Swap honey with sugar-free maple syrup to reduce calories by 60 and make it diabetic-friendly!',
    },
    {
      'image': 'https://images.unsplash.com/photo-1506744038136-46273834b3fb',
      'title': 'Avocado Toast',
      'rating': 4.7,
      'difficulty': 'Easy',
      'time': 8,
      'calories': 220,
      'servings': 2,
      'macro': {'p': 25, 'v': 45, 'c': 30},
      'protein': 60,
      'carbs': 28,
      'fat': 10,
      'tags': ['Healthy', 'Quick', 'Breakfast'],
      'ingredients': [
        '2 slices whole grain bread',
        '1 ripe avocado',
        'Salt and pepper to taste',
        'Lemon juice',
      ],
      'healthyTip': 'Use whole grain bread for extra fiber and nutrients.',
    },
    {
      'image': 'https://images.unsplash.com/photo-1504674900247-0877df9cc836',
      'title': 'Berry Smoothie',
      'rating': 4.9,
      'difficulty': 'Easy',
      'time': 5,
      'calories': 180,
      'servings': 1,
      'macro': {'p': 20, 'v': 50, 'c': 30},
      'protein': 15,
      'carbs': 22,
      'fat': 4,
      'tags': ['Healthy', 'Quick'],
      'ingredients': [
        '1 cup mixed berries',
        '1/2 cup Greek yogurt',
        '1/2 cup almond milk',
        '1 tbsp honey',
      ],
      'healthyTip': 'Add chia seeds for extra omega-3 and fiber.',
    },
  ];

  const _MealListView({required this.query});

  @override
  Widget build(BuildContext context) {
    final filteredMeals = query.isEmpty
        ? meals
        : meals.where((m) => m['title'].toString().toLowerCase().contains(query.toLowerCase())).toList();
    if (filteredMeals.isEmpty) {
      return Center(
        child: Text(
          'No results found',
          style: TextStyle(color: Colors.white.withOpacity(0.7), fontSize: 18, fontFamily: 'Outfit'),
        ),
      );
    }
    return ListView.separated(
      itemCount: filteredMeals.length,
      separatorBuilder: (_, __) => SizedBox(height: 14),
      itemBuilder: (context, i) {
        final meal = filteredMeals[i];
        final macro = meal['macro'] as Map<String, int>;
        return GestureDetector(
          onTap: () {
            context.push(
              '/meal-detail',
              extra: {
                'imageUrl': meal['image'],
                'title': meal['title'],
                'difficulty': meal['difficulty'],
                'rating': meal['rating'],
                'time': meal['time'],
                'servings': meal['servings'],
                'calories': meal['calories'],
                'protein': meal['protein'],
                'carbs': meal['carbs'],
                'fat': meal['fat'],
                'tags': meal['tags'],
                'ingredients': meal['ingredients'],
                'healthyTip': meal['healthyTip'],
              },
            );
          },
          child: Container(
            decoration: BoxDecoration(
              color: const Color(0xFF2D393A),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12),
                    bottomLeft: Radius.circular(12),
                  ),
                  child: Image.network(
                    meal['image'],
                    width: 72,
                    height: 72,
                    fit: BoxFit.cover,
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                meal['title'],
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 17,
                                  fontFamily: 'Outfit',
                                  fontWeight: FontWeight.w500,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 6),
                        Row(
                          children: [
                            Icon(Icons.star, color: const Color(0xFFFFB62E), size: 18),
                            SizedBox(width: 4),
                            Text(
                              meal['rating'].toString(),
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontFamily: 'Outfit',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            SizedBox(width: 16),
                            Text(
                              meal['difficulty'],
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontFamily: 'Outfit',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 8),
                        Row(
                          children: [
                            Icon(Icons.access_time, color: Colors.white.withOpacity(0.7), size: 16),
                            SizedBox(width: 4),
                            Text('${meal['time']} min', style: TextStyle(color: Colors.white, fontSize: 13)),
                            SizedBox(width: 12),
                            Icon(Icons.local_fire_department, color: Colors.white.withOpacity(0.7), size: 16),
                            SizedBox(width: 4),
                            Text('${meal['calories']}', style: TextStyle(color: Colors.white, fontSize: 13)),
                            SizedBox(width: 12),
                            Icon(Icons.people, color: Colors.white.withOpacity(0.7), size: 16),
                            SizedBox(width: 4),
                            Text('${meal['servings']}', style: TextStyle(color: Colors.white, fontSize: 13)),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 48,
                        height: 48,
                        child: PieChart(
                          PieChartData(
                            sectionsSpace: 0,
                            centerSpaceRadius: 18,
                            startDegreeOffset: -90,
                            sections: [
                              PieChartSectionData(
                                color: const Color(0xFF9C27B0), // P
                                value: macro['p']!.toDouble(),
                                radius: 10,
                                showTitle: false,
                              ),
                              PieChartSectionData(
                                color: const Color(0xFF009688), // V
                                value: macro['v']!.toDouble(),
                                radius: 10,
                                showTitle: false,
                              ),
                              PieChartSectionData(
                                color: const Color(0xFF1976D2), // C
                                value: macro['c']!.toDouble(),
                                radius: 10,
                                showTitle: false,
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 6),
                      Row(
                        children: [
                          _MacroLegendDot(color: const Color(0xFF9C27B0), label: 'P'),
                          SizedBox(width: 4),
                          _MacroLegendDot(color: const Color(0xFF009688), label: 'V'),
                          SizedBox(width: 4),
                          _MacroLegendDot(color: const Color(0xFF1976D2), label: 'C'),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

