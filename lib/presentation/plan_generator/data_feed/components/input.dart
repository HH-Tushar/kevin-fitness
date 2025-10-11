part of '../plan_data.dart';

Widget _buildSectionCard({required Widget child}) {
  return Container(
    width: double.infinity,
    decoration: BoxDecoration(
      color: customGrey,
      borderRadius: BorderRadius.circular(6),
      boxShadow: [
        BoxShadow(
          color: const Color(0x26000000),
          blurRadius: 2,
          offset: const Offset(0, 2),
        ),
      ],
    ),
    padding: EdgeInsets.all(20),
    child: child,
  );
}

Widget _buildInputField({
  required String label,
  // required TextEditingController controller,
  String? initialValue,
  required ValueChanged<String> onChanged,
  required String suffix,
  required IconData icon,
  TextInputFormatter? inputFormate,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        label,
        style: TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontFamily: 'Outfit',
          fontWeight: FontWeight.w500,
        ),
      ),
      SizedBox(height: 12),
      Container(
        width: double.infinity,
        height: 48,
        decoration: BoxDecoration(
          color: const Color(0xFF343F41),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: const Color(0xFF767781), width: 1),
        ),
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: TextFormField(
                  initialValue: initialValue,
                  onChanged: onChanged,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontFamily: 'Outfit',
                    fontWeight: FontWeight.w400,
                  ),
                  inputFormatters: inputFormate != null ? [inputFormate] : [],
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: '',
                  ),
                ),
              ),
            ),
            Container(
              width: 60,
              height: 48,
              decoration: BoxDecoration(
                color: const Color(0xFF263133),
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(8),
                  bottomRight: Radius.circular(8),
                ),
                border: Border(
                  left: BorderSide(color: const Color(0xFF767781), width: 1),
                ),
              ),
              child: Center(
                child: Text(
                  suffix,
                  style: TextStyle(
                    color: const Color(0xFFA0A0A6),
                    fontSize: 14,
                    fontFamily: 'Outfit',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ],
  );
}

Widget _buildDropdownField({
  required String label,
  required String? value,
  required List<String> items,
  required ValueChanged<String?> onChanged,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        label,
        style: TextStyle(
          color: customWhite,
          fontSize: 14,
          fontFamily: 'Outfit',
        ),
      ),
      SizedBox(height: 8),
      Container(
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
          border: Border.all(color: const Color(0xFFA0A0A6), width: 1),
          borderRadius: BorderRadius.circular(8),
        ),
        child: DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            padding: EdgeInsets.symmetric(horizontal: defaultPadding),
            value: value,
            isExpanded: true,
            items: items
                .map(
                  (item) => DropdownMenuItem(
                    value: item,
                    child: Padding(
                      padding: EdgeInsets.only(left: 12),
                      child: Text(
                        item,
                        style: TextStyle(
                          color: const Color(0xFFA0A0A6),
                          fontSize: 13,
                          fontFamily: 'Outfit',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                )
                .toList(),
            onChanged: onChanged,
            icon: Icon(
              Icons.keyboard_arrow_down,
              color: const Color(0xFFA0A0A6),
              size: 20,
            ),
            dropdownColor: const Color(0xFF3A4646),
          ),
        ),
      ),
    ],
  );
}

Widget _buildRadioSection({
  required String title,
  // required String question,
  required List<String> options,
  required String selectedValue,
  required ValueChanged<String> onChanged,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisSize: MainAxisSize.min,
    children: [
      Text(
        title,
        style: TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontFamily: 'Outfit',
          fontWeight: FontWeight.w500,
        ),
      ),

      SizedBox(height: 16),
      ...options.map(
        (option) => _buildRadioOption(
          option: option,
          isSelected: selectedValue == option,
          onChanged: (value) => onChanged(option),
        ),
      ),
    ],
  );
}

Widget _buildRadioOption({
  required String option,
  required bool isSelected,
  required ValueChanged<String> onChanged,
}) {
  return Padding(
    padding: EdgeInsets.only(bottom: 16),
    child: Row(
      children: [
        GestureDetector(
          onTap: () => onChanged(option),
          child: Container(
            width: 20,
            height: 20,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white, width: 1),
            ),
            child: isSelected
                ? Center(
                    child: Container(
                      width: 12,
                      height: 12,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                    ),
                  )
                : null,
          ),
        ),
        SizedBox(width: 12),
        Text(
          option,
          style: TextStyle(
            color: customWhite,
            fontSize: 16,
            fontFamily: 'Outfit',
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    ),
  );
}

Widget _buildCheckboxSection({
  required String title,
  // required String question,
  required List<String> options,
  required Set<String> selectedValues,
  required ValueChanged<Set<String>> onChanged,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        title,
        style: TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontFamily: 'Outfit',
          // fontWeight: FontWeight.w500,
        ),
      ),

      SizedBox(height: 16),
      ...options.map(
        (option) => _buildCheckboxOption(
          option: option,
          isSelected: selectedValues.contains(option),
          onChanged: (isSelected) {
            final newValues = Set<String>.from(selectedValues);
            if (isSelected) {
              newValues.add(option);
            } else {
              newValues.remove(option);
            }
            onChanged(newValues);
          },
        ),
      ),
    ],
  );
}

Widget _buildCheckboxOption({
  required String option,
  required bool isSelected,
  required ValueChanged<bool> onChanged,
}) {
  return Padding(
    padding: EdgeInsets.only(bottom: 8),
    child: Row(
      children: [
        GestureDetector(
          onTap: () => onChanged(!isSelected),
          child: Container(
            width: 20,
            height: 20,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white, width: 1),
            ),
            child: isSelected
                ? Center(
                    child: Container(
                      width: 12,
                      height: 12,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                    ),
                  )
                : null,
          ),
        ),
        SizedBox(width: 12),
        Text(
          option,
          style: TextStyle(
            color: const Color(0xFFA0A0A6),
            fontSize: 14,
            fontFamily: 'Outfit',
            fontWeight: FontWeight.w300,
          ),
        ),
      ],
    ),
  );
}

Widget _buildTextAreaField({
  required String label,
  // required TextEditingController controller,
  String? initialValue,
  required ValueChanged<String> onChanged,
  required String hint,
  TextInputFormatter? inputFormate,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        label,
        style: TextStyle(
          color: customWhite,
          fontSize: 14,
          fontFamily: 'Outfit',
          // fontWeight: FontWeight.w600,
        ),
      ),
      vPad10,
      Container(
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
          border: Border.all(color: const Color(0xFFA0A0A6), width: 1),
          borderRadius: BorderRadius.circular(8),
        ),
        child: TextFormField(
          // controller: controller,
          inputFormatters: inputFormate != null ? [inputFormate] : [],
          initialValue: initialValue,
          onChanged: onChanged,
          maxLines: 1,
          style: TextStyle(
            color: const Color(0xFF767781),
            fontSize: 14,
            fontFamily: 'Outfit',
            fontWeight: FontWeight.w400,
          ),

          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(
              color: const Color(0xFF767781),
              fontSize: 14,
              fontFamily: 'Outfit',
              fontWeight: FontWeight.w400,
            ),
            border: InputBorder.none,
            contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          ),
        ),
      ),
    ],
  );
}
