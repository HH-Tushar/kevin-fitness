import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:kenvinorellana/common/navigator.dart';
import '../meal_track/meal_track.dart';
import '../workout_track/workout_track.dart';
import '/common/gaps.dart';
import '../../common/colors.dart';
import 'package:lottie/lottie.dart';
part 'components/weekly.dart';
part 'components/water.dart';
part 'components/meal_plan.dart';
part 'components/workout_plan.dart';
part 'components/ai_recommendation.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double boxHeight = 90;
    final double boxSpacing = 12;
    return Scaffold(
      backgroundColor: const Color(0xFF263133),
      body: Stack(
        children: [
          // Full screen background image
          Positioned.fill(
            child: Image.asset(
              'assets/images/ai_recommended_bg.png',
              fit: BoxFit.cover,
            ),
          ),
          // Content
          SafeArea(
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 16),
                      _HomeHeader(),
                      SizedBox(height: 16),

                      WeeklyCalendarWidget(
                        selectedDate: DateTime.now(),
                        // backgroundColor: Colors.amber,
                        // selectedColor: Colors.blue,
                        // selectedTextColor: Colors.white,
                      ),
                      // vPad20,

                      // _WeeklyGoalSection(),
                      SizedBox(height: 16),
                      _MotivationCard(),
                      SizedBox(height: 16),
                      // Responsive 2x2 grid for Calorie, Sleep, Water
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "AI Recommended Today’s plan ",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: customWhite,
                                fontFamily: "Outfit",
                              ),
                            ),
                            vPad10,
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Column(
                                    children: [
                                      _CalorieBox(height: boxHeight),
                                      SizedBox(height: boxSpacing),
                                      _SleepBox(height: boxHeight),
                                    ],
                                  ),
                                ),
                                SizedBox(width: 12),
                                Expanded(
                                  child: _WaterBox(
                                    height: boxHeight * 2 + boxSpacing,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 24),
                      _MealIdeaSection(),
                      SizedBox(height: 24),
                      _WorkoutSection(),
                      SizedBox(height: 24),
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

class _HomeHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Name on the left
          Expanded(
            // child: Text(
            //   'KEVIN ORELLANA',
            //   style: TextStyle(
            //     color: Colors.white,
            //     fontSize: 20,
            //     fontFamily: 'Outfit',
            //     fontWeight: FontWeight.w300,
            //     letterSpacing: 6.0,
            //     height: 1.1,
            //   ),
            //   maxLines: 1,
            //   overflow: TextOverflow.ellipsis,
            // ),
            child: RichText(
              text: TextSpan(
                style: TextStyle(letterSpacing: 2.5),
                children: [
                  TextSpan(
                    text: 'K',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontFamily: 'Montserrat',
                      // fontWeight: FontWeight.w700,
                    ),
                  ),
                  TextSpan(
                    text: 'EVIN',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontFamily: 'Montserrat',
                      // fontWeight: FontWeight.w400,
                    ),
                  ),
                  TextSpan(text: " "),
                  TextSpan(
                    text: 'O',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontFamily: 'Outfit',
                      // fontWeight: FontWeight.w500,
                    ),
                  ),

                  TextSpan(
                    text: 'RELLANA',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontFamily: 'Outfit',
                      // fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(width: 12),

          CircleAvatar(),
        ],
      ),
    );
  }
}

// // --- Weekly Goal Section ---
// class _WeeklyGoalSection extends StatefulWidget {
//   @override
//   State<_WeeklyGoalSection> createState() => _WeeklyGoalSectionState();
// }

// class _WeeklyGoalSectionState extends State<_WeeklyGoalSection> {
//   DateTime _focusedDay = DateTime.now();
//   DateTime? _selectedDay;

//   @override
//   void initState() {
//     super.initState();
//     _selectedDay = _focusedDay;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.symmetric(horizontal: 20),
//       child: Container(
//         width: double.infinity,
//         padding: EdgeInsets.symmetric(vertical: 18, horizontal: 8),
//         decoration: BoxDecoration(
//           color: const Color(0xFF2D393A),
//           borderRadius: BorderRadius.circular(8),
//           boxShadow: [
//             BoxShadow(
//               color: const Color(0x26000000),
//               blurRadius: 4,
//               offset: const Offset(0, 2),
//             ),
//           ],
//         ),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Row(
//               children: [
//                 Text(
//                   'Weekly Goal',
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 17,
//                     fontFamily: 'Outfit',
//                     fontWeight: FontWeight.w600,
//                   ),
//                 ),
//                 const Spacer(),
//                 Text(
//                   '1 / 3',
//                   style: TextStyle(
//                     color: const Color(0xFF263133),
//                     fontSize: 17,
//                     fontFamily: 'Outfit',
//                     fontWeight: FontWeight.w400,
//                   ),
//                 ),
//               ],
//             ),
//             SizedBox(height: 12),
//             TableCalendar(
//               firstDay: DateTime.utc(2020, 1, 1),
//               lastDay: DateTime.utc(2030, 12, 31),
//               focusedDay: _focusedDay,
//               selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
//               calendarFormat: CalendarFormat.week,
//               availableCalendarFormats: const {CalendarFormat.week: 'Week'},
//               headerVisible: false,
//               daysOfWeekVisible: false,
//               rowHeight: 150,
//               calendarStyle: CalendarStyle(
//                 outsideDaysVisible: false,
//                 cellMargin: EdgeInsets.zero,
//                 cellPadding: EdgeInsets.zero,
//               ),
//               calendarBuilders: CalendarBuilders(
//                 defaultBuilder: (context, day, focusedDay) {
//                   final isSelected = isSameDay(_selectedDay, day);
//                   return Center(
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Center(
//                           child: Text(
//                             day.day.toString(),
//                             style: TextStyle(
//                               color: Colors.white,
//                               fontSize: 15,
//                               fontFamily: 'Outfit',
//                               fontWeight: FontWeight.w400,
//                             ),
//                           ),
//                         ),
//                         SizedBox(height: 20),
//                         Text(
//                           _getWeekdayLabel(day),
//                           style: TextStyle(
//                             color: Colors.white,
//                             fontSize: 13,
//                             fontFamily: 'Outfit',
//                             fontWeight: FontWeight.w400,
//                           ),
//                         ),
//                       ],
//                     ),
//                   );
//                 },
//               ),
//               onDaySelected: (selectedDay, focusedDay) {
//                 setState(() {
//                   // _selectedDay = selectedDay;
//                   // _focusedDay = focusedDay;
//                 });
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   String _getWeekdayLabel(DateTime day) {
//     const labels = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];
//     return labels[day.weekday % 7];
//   }
// }
