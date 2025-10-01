part of '../home_screen.dart';

// --- Workout Section ---
class _WorkoutSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Today's Workout Plan",
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
              _WorkoutCard(
                day: 'Done',
                exercise: 'Leg exercise',
                isActive: true,
              ),
              _WorkoutCard(
                day: 'Done',
                exercise: 'Arm exercise',
                isActive: true,
              ),
              _WorkoutCard(
                day: 'Not Yet',
                exercise: 'Leg exercise',
                isActive: false,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _WorkoutCard extends StatelessWidget {
  final String day;
  final String exercise;
  final bool isActive;
  const _WorkoutCard({
    required this.day,
    required this.exercise,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => navigateTo(context, WorkOutTrackView()),
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
              left: 40,
              top: 11,
              child: Text(
                day,
                style: TextStyle(
                  color: isActive ? const Color(0xFFA855F7) : Colors.white,
                  fontSize: 13,
                  fontFamily: 'Outfit',
                  fontWeight: FontWeight.w400,
                  height: 1.23,
                ),
              ),
            ),
            Positioned(
              left: 18,
              top: 42,
              child: Text(
                exercise,
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
                    'Exercise',
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
