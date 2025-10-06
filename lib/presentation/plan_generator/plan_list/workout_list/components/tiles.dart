part of '../ai_gen_tracks.dart';

@override
Widget _macroTile({required String value, required String label}) {
  return Column(
    children: [
      Text(
        value,
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
    ],
  );
}

_loadingShimmer() {
  return Row(
    spacing: 10,
    children: [
      ...List.generate(
        3,
        (i) => Expanded(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(defaultPadding / 2),
            child: Shimmer(
              color: Colors.grey,
              child: Container(height: 50, color: customGrey),
            ),
          ),
        ),
      ),
    ],
  );
}

class _WorkoutDayCard extends StatelessWidget {
  final Day day;
  // final String currentLanguage;
  final bool isToday;

  const _WorkoutDayCard({
    required this.day,
    // required this.currentLanguage,
    required this.isToday,
  });

  @override
  Widget build(BuildContext context) {
    final LanguageProvider languageProvider = context.watch();
    final translator = languageProvider.workoutPlanTranslation;
    return GestureDetector(
      onTap: () => animatedNavigateTo(context, WorkoutDailyPlanDetails(day: day,)),
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0x35576666),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: const Color(0xAAA0A0A6), width: 0.8),
        ),
        child: Padding(
          padding: EdgeInsets.all(18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Day circle
                  Container(
                    width: 33,
                    height: 33,
                    decoration: BoxDecoration(
                      color: day.completed
                          ? Colors.white
                          : const Color(0xFF263133),
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 1),
                    ),
                    child: day.completed
                        ? Icon(
                            Icons.check,
                            color: const Color(0xFF263133),
                            size: 20,
                          )
                        : null,
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                '${day.day} - ${day.weekday}',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontFamily: 'Outfit',
                                  fontWeight: FontWeight.w600,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            SizedBox(width: 8),
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 2,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: Text(
                                translator.beginner,
                                style: TextStyle(
                                  color: const Color(0xFF263133),
                                  fontSize: 11,
                                  fontFamily: 'Outfit',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Text(
                          isToday
                              ? translator.today
                              : _formatDate(day.date.toString()),
                          style: TextStyle(
                            color: const Color(0xFFA0A0A6),
                            fontSize: 12,
                            fontFamily: 'Outfit',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 8),
                  if (day.completed)
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: const Color(0xFF263133),
                        border: Border.all(color: Colors.white, width: 0.5),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Text(
                        translator.completed,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 11,
                          fontFamily: 'Outfit',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  if (isToday && !day.completed)
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: const Color(0xFF263133),
                        border: Border.all(color: Colors.white, width: 0.5),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Text(
                        translator.completeNow,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 11,
                          fontFamily: 'Outfit',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                ],
              ),
              vPad10,
              Text(
                languageProvider.currentLanguage == "english"
                    ? day.titleSpanish
                    : day.title,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontFamily: 'Outfit',
                  fontWeight: FontWeight.w600,
                ),
              ),
              vPad10,
              Row(
                children: [
                  Icon(
                    Icons.access_time,
                    size: 15,
                    color: const Color(0xFFA0A0A6),
                  ),
                  hPad5,
                  Text(
                    '${day.totalMinutes} ${translator.mins}',
                    style: TextStyle(
                      color: const Color(0xFFA0A0A6),
                      fontSize: 11,
                      fontFamily: 'Outfit',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  hPad10,
                  Icon(Icons.bolt, size: 15, color: const Color(0xFFA0A0A6)),
                  hPad5,
                  Text(
                    day.totalCaloriesBurned.toStringAsFixed(0),
                    style: TextStyle(
                      color: const Color(0xFFA0A0A6),
                      fontSize: 11,
                      fontFamily: 'Outfit',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  hPad10,
                  Icon(
                    Icons.fitness_center,
                    size: 15,
                    color: const Color(0xFFA0A0A6),
                  ),
                  hPad5,
                  Text(
                    translator.none,
                    style: TextStyle(
                      color: const Color(0xFFA0A0A6),
                      fontSize: 11,
                      fontFamily: 'Outfit',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              vPad10,
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children:
                    (languageProvider.currentLanguage == "english"
                            ? day.tagsSpanish
                            : day.tags)
                        .split(',')
                        .map(
                          (tag) => Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 5,
                            ),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: const Color(0xFFA0A0A6),
                                width: 0.88,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              tag.trim(),
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontFamily: 'Outfit',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        )
                        .toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _formatDate(String dateString) {
    try {
      final date = DateTime.parse(dateString);
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
      return '${months[date.month - 1]} ${date.day}';
    } catch (e) {
      return dateString;
    }
  }
}
