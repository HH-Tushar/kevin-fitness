part of '../meal_track.dart';

class _MealCard extends StatelessWidget {
  final String image;
  final String mealType;
  final String mealName;
  final String time;
  final String calories;
  final VoidCallback? onTap;
  const _MealCard({
    required this.image,
    required this.mealType,
    required this.mealName,
    required this.time,
    required this.calories,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          // color: const Color(0xFF2D393A),
          borderRadius: BorderRadius.circular(6),
          border: Border.all(color: customGreyText, width: 1.2),

          // boxShadow: [
          //   BoxShadow(
          //     color: const Color(0x26000000),
          //     blurRadius: 4,
          //     offset: const Offset(0, 2),
          //   ),
          // ],
        ),
        child: Row(
          children: [
            CircleAvatar(
              // borderRadius: BorderRadius.circular(100),
              // clipBehavior: Clip.antiAlias,
              radius: 30,
              backgroundImage: NetworkImage(
                image,
                // width: 90,
                // height: 100,
                // fit: BoxFit.cover,
              ),
            ),
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

                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 2,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFF134E48),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: SvgPicture.asset(
                          "assets/icons/hugeicons_tick.svg",
                          color: customLightBlue,
                          width: 20,
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
      ),
    );
  }
}
