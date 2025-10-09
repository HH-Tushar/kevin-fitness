part of '../search_screen.dart';

class _MealListView extends StatefulWidget {
  const _MealListView();
  @override
  State<_MealListView> createState() => _MealListViewState();
}

class _MealListViewState extends State<_MealListView> {
  @override
  Widget build(BuildContext context) {
    final _SearchController controller = context.watch();

    if (controller.isLoadingRecipe) {
      return _MealListViewShimmer();
    }
    // else  if (controller.isLoadingRecipe && controller.recipe) {
    //     return _MealListViewShimmer();
    //   }
    else if (controller.recipe.isEmpty) {
      return Center(
        child: Text(
          'No results found.Please generate Ai meal plan first.',
          style: TextStyle(
            color: Colors.white.withOpacity(0.7),
            fontSize: 18,
            fontFamily: 'Outfit',
          ),
        ),
      );
    } else if (controller.sortedRecipe.isEmpty) {
      return Center(
        child: Text(
          'No results found',
          style: TextStyle(
            color: Colors.white.withOpacity(0.7),
            fontSize: 18,
            fontFamily: 'Outfit',
          ),
        ),
      );
    }
    return Column(
      children: [
        TextField(
          // controller: _searchController,
          style: TextStyle(
            color: Colors.white,
            fontSize: 15,
            fontFamily: 'Outfit',
          ),
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(8),
            ),
            contentPadding: EdgeInsets.symmetric(horizontal: 10),
            hintText: 'Search recipes, ingredients, workouts',
            fillColor: const Color(0xFF2D393A),
            filled: true,
            hintStyle: TextStyle(
              color: Colors.white.withOpacity(0.6),
              fontSize: 15,
              fontFamily: 'Outfit',
              height: 2,
            ),

            prefixIcon: Icon(Icons.search, color: customWhite),
            // suffixIcon: selectedFilterTag != null || searchQuery.isNotEmpty
            //     ? GestureDetector(
            //         onTap: () {
            //           _searchController.clear();
            //           ref.read(searchQueryProvider.notifier).state = '';
            //           ref.read(selectedFilterTagProvider.notifier).state = null;
            //         },
            //         child: Icon(
            //           Icons.clear,
            //           color: Colors.white.withOpacity(0.7),
            //           size: 20,
            //         ),
            //       )
            //     : null,
          ),
          onChanged: (value) {},
        ),

        vPad10,

        Expanded(
          child: ListView.builder(
            itemCount: controller.sortedRecipe.length,
            // separatorBuilder: (_, __) => SizedBox(height: 14),
            itemBuilder: (context, i) {
              final meal = controller.sortedRecipe[i];
              // final macro = meal['macro'] as Map<String, int>;
              return Padding(
                padding: const EdgeInsets.only(bottom: 12.0),
                child: GestureDetector(
                  onTap: () {},
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFF2D393A),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      spacing: 10,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(12),
                            bottomLeft: Radius.circular(12),
                          ),
                          child: Image.network(
                            meal.image,
                            width: 100,
                            height: 100,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return Container(
                                width: 72,
                                height: 72,
                                color: const Color(0xFF2D393A),
                                child: Icon(
                                  Icons.restaurant,
                                  color: Colors.white.withOpacity(0.5),
                                  size: 24,
                                ),
                              );
                            },
                          ),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              // Recipe name - full display
                              Text(
                                meal.recipeName,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontFamily: 'Outfit',
                                  fontWeight: FontWeight.w500,
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                              SizedBox(height: 6),
                              // Rating and recipe type - full display
                              Row(
                                children: [
                                  Icon(
                                    Icons.star,
                                    color: const Color(0xFFFFB62E),
                                    size: 16,
                                  ),
                                  SizedBox(width: 4),
                                  Text(
                                    meal.ratings,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontFamily: 'Outfit',
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  SizedBox(width: 12),
                                  Expanded(
                                    child: Text(
                                      meal.recipeType,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 14,
                                        fontFamily: 'Outfit',
                                        fontWeight: FontWeight.w400,
                                      ),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 6),
                              // Time and category - full display
                              Row(
                                children: [
                                  Icon(
                                    Icons.access_time,
                                    color: Colors.white.withOpacity(0.7),
                                    size: 14,
                                  ),
                                  SizedBox(width: 4),
                                  Text(
                                    meal.makingTime,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                    ),
                                  ),
                                  SizedBox(width: 12),
                                  Icon(
                                    Icons.category,
                                    color: Colors.white.withOpacity(0.7),
                                    size: 14,
                                  ),
                                  SizedBox(width: 4),
                                  Expanded(
                                    child: Text(
                                      meal.category,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 12,
                                      ),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Column(
                            spacing: 2,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _NutritionalValue(
                                label: 'Calories',
                                value: meal.calories,
                                color: const Color(0xFFFFB62E),
                              ),

                              _NutritionalValue(
                                label: 'Carbs',
                                value: meal.carbs,
                                color: const Color(0xFF1976D2),
                              ),

                              _NutritionalValue(
                                label: 'Protein',
                                value: meal.protein,
                                color: const Color(0xFF9C27B0),
                              ),

                              _NutritionalValue(
                                label: 'Fat',
                                value: meal.fat,
                                color: const Color(0xFF009688),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class _NutritionalValue extends StatelessWidget {
  final String label;
  final String value;
  final Color color;
  const _NutritionalValue({
    required this.label,
    required this.value,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      '$label: $value',
      style: TextStyle(
        color: color,
        fontSize: 9,
        fontFamily: 'Outfit',
        fontWeight: FontWeight.w400,
      ),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }
}
