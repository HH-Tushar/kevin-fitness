part of '../Meal_plan_daily.dart';


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

class _NutritionInfo extends StatelessWidget {
  final String label;
  final String value;
  final IconData icon;

  const _NutritionInfo({
    required this.label,
    required this.value,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        spacing: 2,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            spacing: 2,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(icon, size: 12, color: const Color(0xFFA0A0A6)),

              Expanded(
                child: Text(
                  label,
                  style: TextStyle(
                    color: const Color(0xFFA0A0A6),
                    fontSize: 9,
                    fontFamily: 'Outfit',
                    fontWeight: FontWeight.w400,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),

          Text(
            value,
            style: TextStyle(
              color: Colors.white,
              fontSize: 10,
              fontFamily: 'Outfit',
              fontWeight: FontWeight.w600,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
