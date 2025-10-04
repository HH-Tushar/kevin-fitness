part of '../home_screen.dart';

// --- Water Box with fl_chart (Fixed RenderFlex overflow) ---
class _WaterBox extends StatelessWidget {
  final double height;
  const _WaterBox({this.height = 192});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 170,
      decoration: BoxDecoration(
        color: const Color(0xFF2D393A),
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Stack(
        children: [
          // // Chart
          // Positioned.fill(
          //   top: height * 0.32,
          //   child: LineChart(
          //     LineChartData(
          //       gridData: FlGridData(show: false),
          //       titlesData: FlTitlesData(show: false),
          //       borderData: FlBorderData(show: false),
          //       lineBarsData: [
          //         LineChartBarData(
          //           spots: [
          //             FlSpot(0, 1.0),
          //             FlSpot(1, 1.2),
          //             FlSpot(2, 0.8),
          //             FlSpot(3, 1.4),
          //             FlSpot(4, 1.2),
          //             FlSpot(5, 1.0),
          //           ],
          //           isCurved: true,
          //           color: const Color(0xFF18A0FB),
          //           barWidth: 2.5,
          //           dotData: FlDotData(show: false),
          //           belowBarData: BarAreaData(
          //             show: true,
          //             gradient: LinearGradient(
          //               begin: Alignment.topCenter,
          //               end: Alignment.bottomCenter,
          //               colors: [
          //                 const Color(0xFF18A0FB).withOpacity(0.16),
          //                 const Color(0xFF18A0FB).withOpacity(0.04),
          //                 // const Color(0xFF2D393A).withOpacity(0.0),
          //               ],
          //             ),
          //           ),
          //         ),
          //       ],
          //       minY: 0.6,
          //       maxY: 1.6,
          //     ),
          //   ),
          // ),
          // // Header - Fixed layout to prevent overflow
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 4,
              ), // remove vertical padding
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Lottie.asset(
                  'assets/lottie/Water waves.json',
                  fit: BoxFit.cover,
                  repeat: true,
                  animate: true,
                ),
              ),
            ),
          ),

          Padding(
            padding: EdgeInsets.only(top: 10, left: 10, right: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.water_drop,
                      color: const Color(0xFF18A0FB),
                      size: 20,
                    ),
                    SizedBox(width: 8),
                    Text(
                      'Water',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontFamily: 'Outfit',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                // SizedBox(height: 4),
                Align(
                  alignment: Alignment.centerRight,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        '1.2',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(width: 4),
                      Text(
                        'ltr',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
