part of '../workout_track.dart';

class _WorkOutTile extends StatelessWidget {
  final String image;
  final String title;
  final int times;
  final String duration;
  final bool isDone;
  final VoidCallback? onTap;
  const _WorkOutTile({
    required this.image,
    required this.isDone,
    required this.times,
    required this.title,
    required this.duration,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // onTap: onTap,
      child: Container(
        // padding: EdgeInsets.all(8),
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
            ClipRRect(
              borderRadius: BorderRadius.horizontal(left: Radius.circular(8)),
              clipBehavior: Clip.antiAlias,
              // radius: 30,
              child: Image.network(
                image,
                width: 100,
                height: 85,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontFamily: 'Outfit',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 8),
                  Row(
                    spacing: 4,
                    children: [
                      Text(
                        duration,
                        style: TextStyle(
                          color: customWhite,
                          fontSize: 14,
                          fontFamily: 'Outfit',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text(
                        "X",
                        style: TextStyle(
                          color: customWhite,
                          fontSize: 14,
                          fontFamily: 'Outfit',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "$times",
                        style: TextStyle(
                          color: customWhite,
                          fontSize: 14,
                          fontFamily: 'Outfit',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            Icon(Icons.check_circle_outline_outlined),
            hPad15,
          ],
        ),
      ),
    );
  }
}
