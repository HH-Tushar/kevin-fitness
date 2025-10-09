part of '../search_screen.dart';

class _WorkoutListView extends StatelessWidget {
  const _WorkoutListView();
  @override
  Widget build(BuildContext context) {
    final _SearchController controller = context.watch();

    if (controller.isLoadingRecipe) {
      return _MealListViewShimmer();
    }
    // else  if (controller.isLoadingRecipe && controller.recipe) {
    //     return _WorkoutListViewShimmer();
    //   }
    else if (controller.recipe.isEmpty) {
      return Center(
        child: Text(
          'No results found.Please generate Ai item plan first.',
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
            hintText: 'Search workouts',
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
            itemCount: controller.sortedWorkouts.length,
            // separatorBuilder: (_, __) => SizedBox(height: 14),
            itemBuilder: (context, i) {
              final item = controller.sortedWorkouts[i];
              // final macro = item['macro'] as Map<String, int>;
              return Padding(
                padding: const EdgeInsets.only(bottom: 12.0),
                child: GestureDetector(
                  onTap: () {
                    animatedNavigateTo(
                      context,
                      WorkoutDetailsView(workout: item),
                    );
                  },
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
                            item.image,
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
                                item.workoutName,
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
                                spacing: 5,
                                children: [
                                  Icon(
                                    Icons.watch_later_outlined,
                                    color: customGreyText,
                                    size: 16,
                                  ),

                                  Text(
                                    _formatTime(item.timeNeeded),
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontFamily: 'Outfit',
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),

                                  //need extra space
                                  hPad5,

                                  Icon(
                                    Icons.local_fire_department,
                                    color: customGreyText,
                                    size: 16,
                                  ),

                                  Text(
                                    "${item.caloriesBurn}cal",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontFamily: 'Outfit',
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 6),
                              // Time and category - full display
                              Wrap(
                                spacing: 5,
                                crossAxisAlignment: WrapCrossAlignment.center,
                                children: [
                                  Icon(
                                    Icons.fitness_center,
                                    color: Colors.white.withOpacity(0.7),
                                    size: 14,
                                  ),
                                  Text(
                                    item.equipmentNeeded,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                    ),
                                  ),
                                  hPad5,
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 10,
                                      vertical: 4,
                                    ),
                                    decoration: BoxDecoration(
                                      color: const Color(
                                        0xFF8BF0E6,
                                      ).withOpacity(0.15),
                                      borderRadius: BorderRadius.circular(6),
                                    ),
                                    child: Text(
                                      item.forBodyPart,
                                      style: TextStyle(
                                        color: const Color(0xFF8BF0E6),
                                        fontSize: 12,
                                        fontFamily: 'Outfit',
                                      ),
                                    ),
                                  ),
                                ],
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

String _formatTime(String timeString) {
  try {
    final parts = timeString.split(':');
    if (parts.length >= 2) {
      final hours = int.tryParse(parts[0]) ?? 0;
      final minutes = int.tryParse(parts[1]) ?? 0;

      if (hours > 0) {
        return '${hours}h ${minutes}m';
      } else {
        return '${minutes}m';
      }
    }
    return timeString;
  } catch (e) {
    return timeString;
  }
}
