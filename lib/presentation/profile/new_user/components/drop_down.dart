part of '../basic_info_screen.dart';

class ProfileDropdownField extends StatelessWidget {
  final IconData icon;
  final String hint;
  final List<String> items;
  final String value;
  final ValueChanged<String> onChanged;
  final Function(String?) validator;
  const ProfileDropdownField({
    super.key,
    required this.icon,
    required this.hint,
    required this.items,
    required this.value,
    required this.onChanged,
    required this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      // Replaced 16.h
      padding: EdgeInsets.only(bottom: 16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          // Replaced 20.sp
          Icon(icon, size: 20.0, color: const Color(0xFF767781)),
          // Replaced 10.w
          SizedBox(width: 10.0),
          Expanded(
            child: DropdownButtonFormField<String>(
              validator: (value) => validator(value),
              initialValue: value.isEmpty ? null : value,
              decoration: InputDecoration(
                hintText: hint,
                hintStyle: TextStyle(
                  color: const Color(0xFF767781),
                  // Replaced 16.sp
                  fontSize: 16.0,
                  fontFamily: 'Outfit',
                  fontWeight: FontWeight.w400,
                ),
                border: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF767781), width: 0.8),
                ),
                enabledBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF767781), width: 0.8),
                ),
                focusedBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF767781), width: 0.8),
                ),
                isDense: true,
                // Replaced 8.h
                contentPadding: EdgeInsets.only(bottom: 8.0),
              ),
              style: TextStyle(
                color: const Color(0xFF767781),
                // Replaced 16.sp
                fontSize: 16.0,
                fontFamily: 'Outfit',
                fontWeight: FontWeight.w400,
              ),
              dropdownColor: Colors.white,
              icon: Icon(
                Icons.keyboard_arrow_down,
                color: const Color(0xFF767781),
                // Replaced 20.sp
                size: 20.0,
              ),
              items: items.map((String item) {
                return DropdownMenuItem<String>(value: item, child: Text(item));
              }).toList(),
              onChanged: (String? newValue) {
                if (newValue != null) {
                  onChanged(newValue);
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

class DatePickerField extends StatefulWidget {
  final IconData icon;
  final String hint;
  final String value; // Current selected date string (passed by parent)
  final ValueChanged<DateTime> onDateChanged; // Callback to update parent state

  const DatePickerField({
    super.key,
    required this.icon,
    required this.hint,
    required this.value,
    required this.onDateChanged,
  });

  @override
  State<DatePickerField> createState() => _DatePickerFieldState();
}

class _DatePickerFieldState extends State<DatePickerField> {
  String formattedDate = "";

  Future<void> _selectDate(BuildContext context) async {
    try {
      final DateTime now = DateTime.now();
      // Set initial/first/last dates for the picker constraints
      final DateTime initialDate = DateTime(now.year - 18, now.month, now.day);
      final DateTime firstDate = DateTime(1900, 1, 1);
      final DateTime lastDate = DateTime(now.year - 13, now.month, now.day);

      final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: initialDate,
        firstDate: firstDate,
        lastDate: lastDate,
        builder: (context, child) {
          return Theme(
            data: Theme.of(context).copyWith(
              colorScheme: const ColorScheme.light(
                primary: Color(0xFF343F41),
                onPrimary: Colors.white,
                onSurface: Color(0xFF263133),
              ),
              textButtonTheme: TextButtonThemeData(
                style: TextButton.styleFrom(
                  foregroundColor: const Color(0xFF343F41),
                ),
              ),
              dialogTheme: DialogThemeData(
                shape: RoundedRectangleBorder(
                  // Replaced 12.r
                  borderRadius: BorderRadius.circular(12.0),
                ),
              ),
            ),
            child: child!,
          );
        },
      );

      if (picked != null) {
        formattedDate =
            '${picked.day.toString().padLeft(2, '0')}/${picked.month.toString().padLeft(2, '0')}/${picked.year}';
        // Use the callback to notify the parent widget of the change
        widget.onDateChanged(picked);
        setState(() {});
      }
    } catch (e) {
      if (context.mounted) {
        // Use SnackBar for non-blocking error display
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error opening date picker: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // final dateOfBirth = widget.value; // Get value from widget property

    return Padding(
      // Replaced 16.h
      padding: EdgeInsets.only(bottom: 16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          // Replaced 20.sp
          Icon(widget.icon, size: 20.0, color: const Color(0xFF767781)),
          // Replaced 10.w
          SizedBox(width: 10.0),
          Expanded(
            child: InkWell(
              onTap: () {
                _selectDate(context); // Call local method
              },
              child: Container(
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: Color(0xFF767781), width: 0.8),
                  ),
                ),
                child: Padding(
                  // Replaced 8.h
                  padding: EdgeInsets.only(bottom: 8.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          formattedDate.isEmpty ? widget.hint : formattedDate,
                          style: TextStyle(
                            color: const Color(0xFF767781),
                            // Replaced 16.sp
                            fontSize: 16.0,
                            fontFamily: 'Outfit',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      Icon(
                        Icons.calendar_today,
                        color: const Color(0xFF767781),
                        // Replaced 18.sp
                        size: 18.0,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
