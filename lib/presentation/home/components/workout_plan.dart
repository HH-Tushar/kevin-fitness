part of '../home_screen.dart';

// --- Workout Section ---
class _WorkoutSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final DailyPlanProvider planProvider = context.watch();
    final LanguageProvider languageProvider = context.watch();
    final translator = languageProvider.homeTranslation;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            translator.todayWorkoutPlan,
            style: TextStyle(
              color: Colors.white,
              fontSize: 15,
              fontFamily: 'Outfit',
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 12),
          SizedBox(
            height: 110,
            child:
                (planProvider.dailyPlan?.dailyMeal.entries == null ||
                    planProvider.dailyPlan!.dailyMeal.entries.isEmpty)
                ? Center(
                    child: Text(
                      translator.noWorkoutPlan,
                      style: TextStyle(color: customWhite, fontSize: 16),
                    ),
                  )
                : ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount:
                        planProvider.dailyPlan?.dailyWorkout.entries.length ??
                        0,
                    itemBuilder: (context, index) {
                      final item =
                          planProvider.dailyPlan?.dailyWorkout.entries[index];
                      return Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: _WorkoutCard(
                          isActive: item!.completed,
                          exercise: item.workoutName ?? "",
                          // button: item?.completed == true ? "" : "Eat Now",
                          status: "",
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}

class _WorkoutCard extends StatelessWidget {
  final String status;
  final String exercise;
  final bool isActive;
  const _WorkoutCard({
    required this.status,
    required this.exercise,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    final LanguageProvider languageProvider = context.watch();
    final translator = languageProvider.homeTranslation;
    return GestureDetector(
      onTap: () => navigateTo(context, WorkOutTrackView(shouldPop: true,)),
      child: Container(
        width: 130,
        height: 106,
        decoration: BoxDecoration(
          color: const Color(0xFF2D393A),
          borderRadius: BorderRadius.circular(6),
          boxShadow: [
            BoxShadow(
              color: const Color(0x1E000000),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 8,
          children: [
            Text(
              isActive ? translator.done : translator.notYet,
              style: TextStyle(
                color: isActive ? const Color(0xFFA855F7) : Colors.white,
                fontSize: 13,
                fontFamily: 'Outfit',
                fontWeight: FontWeight.w400,
                height: 1.23,
              ),
            ),
            Text(
              textAlign: TextAlign.center,
              exercise,
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontFamily: 'Outfit',
                fontWeight: FontWeight.w400,
                height: 1.30,
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              margin: EdgeInsets.symmetric(horizontal: 12),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: isActive
                      ? [const Color(0xFF797F7F), const Color(0xFF475257)]
                      : [const Color(0xFF576666), const Color(0xFF2C3437)],
                ),
                borderRadius: BorderRadius.circular(4),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0x26000000),
                    blurRadius: 4,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Center(
                child: Text(
                  translator.exercise,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontFamily: 'Outfit',
                    fontWeight: FontWeight.w400,
                    height: 1.33,
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
