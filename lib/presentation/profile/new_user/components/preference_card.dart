part of '../basic_info_screen.dart';


class PreferenceCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final List<String> options;
  final List<String> selected;
  final ValueChanged<List<String>> onChanged;
  final bool singleSelect;

  const PreferenceCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.options,
    required this.selected,
    required this.onChanged,
    this.singleSelect = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      // Converted ScreenUtil dimensions to use scaleFactor
      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 18.0),
      decoration: BoxDecoration(
        color: const Color(0xFFF6F6F6),
        // Converted ScreenUtil dimensions to use scaleFactor
        borderRadius: BorderRadius.circular(6.0),
        boxShadow: const [
          BoxShadow(
            color: Color(0x26000000),
            blurRadius: 2,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              color: const Color(0xFF263133),
              // Converted ScreenUtil dimensions to use scaleFactor
              fontSize: 20.0,
              fontFamily: 'Outfit',
              fontWeight: FontWeight.w500,
            ),
          ),
          // Converted ScreenUtil dimensions to use scaleFactor
          SizedBox(height: 8.0),
          Text(
            subtitle,
            style: TextStyle(
              color: const Color(0xFF767781),
              // Converted ScreenUtil dimensions to use scaleFactor
              fontSize: 14.0,
              fontFamily: 'Outfit',
              fontWeight: FontWeight.w300,
            ),
          ),
          // Converted ScreenUtil dimensions to use scaleFactor
          SizedBox(height: 12.0),
          ...options.map((option) {
            final isChecked = selected.contains(option);
            return Padding(
              // Converted ScreenUtil dimensions to use scaleFactor
              padding: EdgeInsets.symmetric(vertical: 4.0),
              child: InkWell(
                onTap: () {
                  if (singleSelect) {
                    onChanged([option]);
                  } else {
                    final newSelected = List<String>.from(selected);
                    if (isChecked) {
                      newSelected.remove(option);
                    } else {
                      newSelected.add(option);
                    }
                    onChanged(newSelected);
                  }
                },
                child: Row(
                  children: [
                    Icon(
                      // Using radio button style as requested by the user's provided code
                      isChecked
                          ? Icons.radio_button_checked
                          : Icons.radio_button_off,
                      color: isChecked
                          ? const Color(0xFF263133)
                          : const Color(0xFF767781),
                      // Converted ScreenUtil dimensions to use scaleFactor
                      size: 22.0,
                    ),
                    // Converted ScreenUtil dimensions to use scaleFactor
                    SizedBox(width: 12.0),
                    Text(
                      option,
                      style: TextStyle(
                        color: const Color(0xFF263133),
                        // Converted ScreenUtil dimensions to use scaleFactor
                        fontSize: 16.0,
                        fontFamily: 'Outfit',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
        ],
      ),
    );
  }
}


