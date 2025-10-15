part of '../basic_info_screen.dart';

class SkinfoldField extends StatelessWidget {
  final String label;
  final String value;
  final ValueChanged<String> onChanged;
  final Function(String?) validator;
  const SkinfoldField({
    super.key,
    required this.label,
    required this.value,
    required this.onChanged,
    required this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            color: const Color(0xFF767781), // UPDATED: Changed label color
            // Replaced 14.sp
            fontSize: 14.0,
            fontFamily: 'Outfit',
            fontWeight: FontWeight.w400,
          ),
        ),
        // Replaced 4.h
        SizedBox(height: 4.0),
        TextFormField(
          initialValue: value,
          onChanged: onChanged,
          validator:(e)=> validator(e),
          keyboardType: TextInputType.number,
          inputFormatters: [
            FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*')),
          ],
          style: TextStyle(
            color: const Color(0xFF767781),
            // Keeping original font size for input text (16.0)
            fontSize: 16.0,
            fontFamily: 'Outfit',
            fontWeight: FontWeight.w400,
          ),
          decoration: InputDecoration(
            hintText: '0.0', // UPDATED: Changed hint text
            hintStyle: TextStyle(
              color: const Color(0xFF767781),
              // Replaced 13.sp
              fontSize: 13.0, // UPDATED: Changed hint font size
              fontFamily: 'Outfit',
              fontWeight: FontWeight.w400,
            ),
            // REMOVED suffixText and suffixStyle

            // UPDATED: Changed from UnderlineInputBorder to OutlineInputBorder
            border: OutlineInputBorder(
              // Replaced 3.r
              borderRadius: BorderRadius.circular(3.0),
              borderSide: const BorderSide(
                color: Color(0xFF767781),
                width: 1.0,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(3.0),
              borderSide: const BorderSide(
                color: Color(0xFF767781),
                width: 1.0,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(3.0),
              borderSide: const BorderSide(
                color: Color(0xFF767781),
                width: 1.0,
              ),
            ),
            isDense: true,
            // Replaced 8.h, 12.w
            contentPadding: EdgeInsets.symmetric(
              vertical: 8.0,
              horizontal: 12.0,
            ), // UPDATED: Changed padding
          ),
        ),
      ],
    );
  }
}
