part of '../home_screen.dart';

class WeeklyCalendarWidget extends StatelessWidget {
  final DateTime selectedDate;
  // final Color backgroundColor;
  // final Color selectedColor;
  // final Color textColor;
  // final Color selectedTextColor;

  const WeeklyCalendarWidget({
    super.key,
    required this.selectedDate,
    // this.backgroundColor = const Color(0xFF2C3E50),
    // this.selectedColor = customLightBlue,
    // this.textColor = Colors.white,
    // this.selectedTextColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: const Color(0xFF2D393A),
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: const Color(0x26000000),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Weekly Goal',
                style: TextStyle(
                  color: customWhite,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                '${_getWeekNumberInMonth()}/${_getTotalWeeksInMonth()}',
                style: TextStyle(
                  color: const Color(0xff585e5f),
                  fontSize: 17,
                  fontFamily: "Outfit",
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: _buildWeekDays(),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildWeekDays() {
    final startOfWeek = selectedDate.subtract(
      Duration(days: selectedDate.weekday - 1),
    );
    final weekDays = ['Sat', 'Sat', 'Sat', 'Sat', 'Sat', 'Sat', 'Sat'];
    final days = List.generate(
      7,
      (index) => startOfWeek.add(Duration(days: index)),
    );

    return List.generate(7, (index) {
      final day = days[index];
      final isSelected =
          day.day == selectedDate.day &&
          day.month == selectedDate.month &&
          day.year == selectedDate.year;

      return Column(
        children: [
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.transparent,
              border: isSelected
                  ? Border.all(color: customLightBlue, width: 1)
                  : null,
            ),
            child: Center(
              child: Text(
                '${day.day}',
                style: TextStyle(
                  color: isSelected ? customLightBlue : customWhite,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            weekDays[index],
            style: TextStyle(
              color: isSelected ? customLightBlue : customWhite,
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      );
    });
  }

  int _getWeekNumberInMonth() {
    final firstDayOfMonth = DateTime(selectedDate.year, selectedDate.month, 1);
    final firstMondayOfMonth = firstDayOfMonth.add(
      Duration(days: (8 - firstDayOfMonth.weekday) % 7),
    );

    if (selectedDate.isBefore(firstMondayOfMonth)) {
      return 1;
    }

    final daysDifference = selectedDate.difference(firstMondayOfMonth).inDays;
    return (daysDifference / 7).floor() + 2;
  }

  int _getTotalWeeksInMonth() {
    final firstDayOfMonth = DateTime(selectedDate.year, selectedDate.month, 1);
    final lastDayOfMonth = DateTime(
      selectedDate.year,
      selectedDate.month + 1,
      0,
    );

    final firstMondayOfMonth = firstDayOfMonth.add(
      Duration(days: (8 - firstDayOfMonth.weekday) % 7),
    );

    final daysDifference = lastDayOfMonth.difference(firstMondayOfMonth).inDays;
    return (daysDifference / 7).ceil() + 1;
  }
}

// Usage Example
class WeeklyCalendarDemo extends StatefulWidget {
  @override
  _WeeklyCalendarDemoState createState() => _WeeklyCalendarDemoState();
}

class _WeeklyCalendarDemoState extends State<WeeklyCalendarDemo> {
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: Text('Weekly Calendar'),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            WeeklyCalendarWidget(selectedDate: selectedDate),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  selectedDate = DateTime.now();
                });
              },
              child: Text('Reset to Today'),
            ),
          ],
        ),
      ),
    );
  }
}
