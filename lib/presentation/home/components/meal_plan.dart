part of '../home_screen.dart';

// --- Meal Idea Section ---
class _MealIdeaSection extends StatelessWidget {
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
            translator.todaysMealIdea,
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
                      translator.noMealPlan,
                      style: TextStyle(color: customWhite, fontSize: 16),
                    ),
                  )
                : ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount:
                        planProvider.dailyPlan?.dailyMeal.entries.length ?? 0,
                    itemBuilder: (context, index) {
                      final item =
                          planProvider.dailyPlan?.dailyMeal.entries[index];
                      return Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: _MealCard(
                          status: item?.completed == true
                              ? translator.done
                              : translator.notYet,
                          title: item?.mealType ?? "",
                          button: item?.completed == true
                              ? ""
                              : translator.eatNow,
                          statusColor: item?.completed == true
                              ? customLightBlue
                              : customWhite,
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

class _MealCard extends StatelessWidget {
  final String status;
  final String title;
  final String button;
  final Color statusColor;
  const _MealCard({
    required this.status,
    required this.title,
    required this.button,
    required this.statusColor,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => navigateTo(context, MealPlanDayScreen(shouldPop: true)),
      child: Container(
        width: 130,
        alignment: Alignment.center,
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
              status,
              style: TextStyle(
                color: statusColor,
                fontSize: 13,
                fontFamily: 'Outfit',
                fontWeight: FontWeight.w400,
                height: 1.23,
              ),
            ),
            Text(
              title,
              textAlign: TextAlign.center,
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
                gradient: const LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [Color(0xFF576666), Color(0xFF2C3437)],
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
              child: Text(
                button,
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
          ],
        ),
      ),
    );
  }
}
