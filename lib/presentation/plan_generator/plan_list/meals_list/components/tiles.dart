part of '../ai_gen_tracks.dart';

@override
Widget _macroTile({required String value, required String label}) {
  return Expanded(
    child: Column(
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
    ),
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
