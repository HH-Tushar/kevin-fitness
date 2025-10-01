part of '../search_screen.dart';
class _MacroLegendDot extends StatelessWidget {
  final Color color;
  final String label;
  const _MacroLegendDot({required this.color, required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 7,
          height: 7,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
        ),
        SizedBox(width: 2),
        Text(
          label,
          style: TextStyle(
            color: Colors.white,
            fontSize: 11,
            fontFamily: 'Outfit',
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}

