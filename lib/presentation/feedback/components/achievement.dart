part of '../congratulation.dart';

class _AchievementCard extends StatelessWidget {
  final String value;
  final String label;

  const _AchievementCard({required this.value, required this.label});

  @override
  Widget build(BuildContext context) {
    final isHintText = value == '--';

    return Container(
      decoration: BoxDecoration(
        color: const Color(0x33576666),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            child: Text(
              value,
              style: TextStyle(
                color: isHintText
                    ? Colors.white.withOpacity(0.4)
                    : const Color(0xFFCCD7D9),
                fontSize: 14,
                fontFamily: 'Outfit',
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const SizedBox(height: 2),
          Flexible(
            child: Text(
              label,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 11,
                fontFamily: 'Outfit',
                fontWeight: FontWeight.w400,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
