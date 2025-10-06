part of '../meal_details.dart';

Widget _topTiles({
  required IconData icon,
  required String label,
  Color? iconColor,
}) {
  return Row(
    spacing: 4,
    children: [
      Icon(icon, color: iconColor ?? customWhite, size: 15),
      Text(
        label,
        style: TextStyle(
          color: customWhite,
          fontSize: 13,
          fontFamily: "Outline",
        ),
      ),
    ],
  );
}

_verticalTile({required String label, required String value, String? unit}) {
  if (value.contains(".")) {
    value = double.parse(value).toInt().toString();
  }

  return Expanded(
    child: Column(
      children: [
        Text(
          "$value${unit ?? ""}",
          style: TextStyle(
            fontSize: 16,
            color: customWhite,
            fontFamily: "Outfit",
          ),
        ),
        Text(
          label,
          style: TextStyle(
            fontSize: 14,
            color: customWhite,
            fontFamily: "Outfit",
          ),
        ),
      ],
    ),
  );
}
