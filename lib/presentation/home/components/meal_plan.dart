part of '../home_screen.dart';

// --- Meal Idea Section ---
class _MealIdeaSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Today's Meal Idea",
            style: TextStyle(
              color: Colors.white,
              fontSize: 15,
              fontFamily: 'Outfit',
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _MealCard(
                status: 'Done',
                title: 'Breakfast',
                button: 'Eat Now',
                statusColor: customLightBlue,
              ),
              _MealCard(
                status: 'Done',
                title: 'Snacks',
                button: 'Eat Now',
                statusColor: const Color(0xFF8BF0E6),
              ),
              _MealCard(
                status: 'Upcoming',
                title: 'Lunch',
                button: 'Eat Now',
                statusColor: Colors.white,
              ),
            ],
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
      onTap: () => navigateTo(context, MealPlanDayScreen()),
      child: Container(
        width: 118,
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
        child: Stack(
          children: [
            Positioned(
              left: 42,
              top: 11,
              child: Text(
                status,
                style: TextStyle(
                  color: statusColor,
                  fontSize: 13,
                  fontFamily: 'Outfit',
                  fontWeight: FontWeight.w400,
                  height: 1.23,
                ),
              ),
            ),
            Positioned(
              left: 26,
              top: 42,
              child: Text(
                title,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontFamily: 'Outfit',
                  fontWeight: FontWeight.w400,
                  height: 1.07,
                ),
              ),
            ),
            Positioned(
              left: 25,
              top: 70,
              child: Container(
                width: 67,
                height: 25,
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
                child: Center(
                  child: Text(
                    button,
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
            ),
          ],
        ),
      ),
    );
  }
}
