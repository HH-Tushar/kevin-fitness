part of '../ai_gen_tracks.dart';

String _formatDate(String dateString) {
  try {
    final date = DateTime.parse(dateString);
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final targetDate = DateTime(date.year, date.month, date.day);

    if (targetDate == today) {
      return 'Today';
    } else if (targetDate == today.add(const Duration(days: 1))) {
      return 'Tomorrow';
    } else if (targetDate == today.subtract(const Duration(days: 1))) {
      return 'Yesterday';
    } else {
      final weekdays = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
      final months = [
        'Jan',
        'Feb',
        'Mar',
        'Apr',
        'May',
        'Jun',
        'Jul',
        'Aug',
        'Sep',
        'Oct',
        'Nov',
        'Dec',
      ];
      return '${weekdays[date.weekday - 1]}, ${months[date.month - 1]} ${date.day}, ${date.year}';
    }
  } catch (e) {
    return dateString;
  }
}

// _calculateTotalCalory() {}

class _MealDayCard extends StatelessWidget {
  final Day day;
  final int dayNumber;
  // final String date;
  // final int totalKcal;
  // final List<_MealSlot> meals;
  const _MealDayCard({required this.day, required this.dayNumber});

  @override
  Widget build(BuildContext context) {
    double calories = 0;

    final LanguageProvider languageProvider = context.watch();
    final translator = languageProvider.workoutPlanTranslation;
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF2D393A),
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: const Color(0xAAA0A0A6), width: 0.8),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 18, vertical: 4),
                decoration: BoxDecoration(
                  color: const Color(0xFF222A2C),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: '${translator.day} $dayNumber - ',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontFamily: 'Outfit',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      TextSpan(
                        text: '${_formatDate(day.date.toString())} - ',
                        style: TextStyle(
                          color: const Color(0xFFA0A0A6),
                          fontSize: 12,
                          fontFamily: 'Outfit',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      TextSpan(
                        text: '$calories ${translator.calories}',
                        style: TextStyle(
                          color: const Color(0xFF8BF0E6),
                          fontSize: 12,
                          fontFamily: 'Outfit',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            vPad15,
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: day.meals.map((meal) {
                  calories += double.tryParse(meal.recipe.calories) ?? 0;
                  return Padding(
                    padding: EdgeInsets.only(right: 12),
                    child: _MealSlot(
                      image: meal.recipe.image,
                      kcal: meal.recipe.calories,
                      label: meal.mealType,
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _MealSlot extends StatelessWidget {
  final String label;
  final String image;
  final String kcal;
  const _MealSlot({
    required this.label,
    required this.image,
    required this.kcal,
  });

  @override
  Widget build(BuildContext context) {
    final LanguageProvider languageProvider = context.watch();
    final translator = languageProvider.workoutPlanTranslation;
    return SizedBox(
      width: 70, // Fixed width to prevent overflow
      child: Column(
        children: [
          Text(
            label,
            style: TextStyle(
              color: const Color(0xFFA0A0A6),
              fontSize: 12, // Reduced font size
              fontFamily: 'Outfit',
              fontWeight: FontWeight.w400,
            ),
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          vPad5,

          Container(
            width: 58,
            height: 58,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: const Color(0xFF119F46), width: 2),
              image: DecorationImage(
                //need to use cached network
                image: NetworkImage(image),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // ClipRRect(
          //   child: CachedNetworkImage(imageUrl: image, height: 50, width: 50),
          // ),
          vPad5,
          Row(
            spacing: 4,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.local_fire_department,
                color: const Color(0xFFFF7A00),
                size: 14,
              ), // Reduced icon size
              // Reduced spacing
              Flexible(
                child: Text(
                  '$kcal ${translator.calories}',
                  style: TextStyle(
                    color: const Color(0xFFA0A0A6),
                    fontSize: 11, // Reduced font size
                    fontFamily: 'Outfit',
                    fontWeight: FontWeight.w400,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
