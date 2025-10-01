part of '../basic_info_screen.dart';

class ProfileTextField extends StatelessWidget {
  final IconData icon;
  final String hint;
  final String? suffix;
  final String value;
  final FilteringTextInputFormatter? formatter;
  final ValueChanged<String> onChanged;

  const ProfileTextField({
    super.key,
    required this.icon,
    required this.hint,
    this.suffix,
    this.formatter,
    required this.value,
    required this.onChanged,
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
            child: TextFormField(
              initialValue: value,
              onChanged: onChanged,
              inputFormatters: formatter != null ? [formatter!] : null,
              style: TextStyle(
                color: const Color(0xFF767781),
                // Replaced 16.sp
                fontSize: 16.0,
                fontFamily: 'Outfit',
                fontWeight: FontWeight.w400,
              ),
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
            ),
          ),
          if (suffix != null)
            Padding(
              // Replaced 10.w and 8.h
              padding: EdgeInsets.only(left: 10.0, bottom: 8.0),
              child: Text(
                suffix!,
                style: TextStyle(
                  color: const Color(0xFF767781),
                  // Replaced 16.sp
                  fontSize: 16.0,
                  fontFamily: 'Outfit',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
