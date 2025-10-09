part of '../meal_track.dart';

class _MealCard extends StatelessWidget {
  final String image;
  final String mealType;
  final String mealName;
  final String time;
  final String calories;
  final bool isDone;
  final VoidCallback? onTap;
  const _MealCard({
    required this.image,
    required this.mealType,
    required this.mealName,
    required this.time,
    required this.calories,
    required this.isDone,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: customGreyText, width: 1.2),
      ),
      child: Row(
        children: [
          CircleAvatar(radius: 30, backgroundImage: NetworkImage(image)),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  spacing: 8,
                  children: [
                    Text(
                      mealType,
                      style: TextStyle(
                        color: const Color(0xFFA0A0A6),
                        fontSize: 14,
                        fontFamily: 'Outfit',
                        fontWeight: FontWeight.w400,
                      ),
                    ),

                    GestureDetector(
                      onTap: onTap,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 2,
                        ),
                        decoration: BoxDecoration(
                          color:isDone? const Color(0xFF134E48):customGrey,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: SvgPicture.asset(
                          "assets/icons/hugeicons_tick.svg",
                          color:isDone? customLightBlue:customGreyText,
                          width: 20,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 2),
                Text(
                  mealName,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontFamily: 'Outfit',
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    Icon(
                      Icons.access_time,
                      size: 20,
                      color: const Color(0xFFA0A0A6),
                    ),
                    SizedBox(width: 4),
                    Text(
                      time,
                      style: TextStyle(
                        color: const Color(0xFFA0A0A6),
                        fontSize: 11,
                        fontFamily: 'Outfit',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(width: 12),
                    Container(
                      padding: EdgeInsets.all(0.5),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: customGreyText),
                      ),
                      child: Icon(
                        Icons.bolt,
                        size: 15,
                        color: const Color(0xFFA0A0A6),
                      ),
                    ),
                    SizedBox(width: 4),
                    Text(
                      calories,
                      style: TextStyle(
                        color: const Color(0xFFA0A0A6),
                        fontSize: 11,
                        fontFamily: 'Outfit',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
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
  final int value;
  final int totalValue;
  final String label;
  const _MacroStat({
    required this.value,
    required this.label,
    required this.totalValue,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: LayoutBuilder(
        builder: (context, constraints) {
          final double fraction = totalValue > 0
              ? (value / totalValue).clamp(0.0, 1.0)
              : 0.0;

          final width = constraints.maxWidth * fraction;
          return Column(
            children: [
              Text(
                value.toString(),
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
                    width: width,
                    decoration: BoxDecoration(
                      color: customTeal,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
