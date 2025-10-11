part of '../plan_update.dart';

Widget _buildFeatureItem(String text) {
  return Row(
    children: [
      Container(
        width: 24,
        height: 24,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Colors.white.withOpacity(0.8), width: 2),
        ),
        child: const Icon(Icons.check, color: Colors.white, size: 16),
      ),
      const SizedBox(width: 12),
      Expanded(
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white.withOpacity(0.9),
            fontSize: 15,
            height: 1.4,
          ),
        ),
      ),
    ],
  );
}

Widget _buildPricingCard({
  required Package package,
  // required String price,
  // required String period,
  String? subtitle,
  required bool isSelected,
  bool isPopular = false,
}) {
  _calculate({
    required int interval,
    required double price,
    required bool isYear,
  }) {
    if (isYear) {
      return "${price / (interval * 12)}";
    }
    return "${price / interval}";
  }

  return Stack(
    clipBehavior: Clip.none,
    children: [
      Container(
        height: 130,
        width: 170,
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFF4A5F5F) : const Color(0xFF3A4F4F),
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: isSelected
                ? Colors.white.withOpacity(0.3)
                : Colors.transparent,
            width: 2,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "$currency${package.amount}",
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "${package.intervalCount > 1 ? package.intervalCount : ""} ${package.billingInterval}",
                style: TextStyle(
                  color: Colors.white.withOpacity(0.8),
                  fontSize: 16,
                ),
              ),

              vPad15,
              // if (package.intervalCount > 1 ||
              //     package.billingInterval == "year")
              Text(
                "only $currency ${_calculate(interval: package.intervalCount, isYear: package.billingInterval == "year", price: package.amount)} /month",
                style: TextStyle(
                  color: Colors.white.withOpacity(0.8),
                  fontSize: 16,
                ),
              ),

              if (subtitle != null) ...[
                const SizedBox(height: 8),
                Text(
                  subtitle,
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.6),
                    fontSize: 12,
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
      if (isPopular)
        Positioned(
          top: -10,
          left: 0,
          right: 0,
          child: Center(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
              decoration: BoxDecoration(
                color: const Color(0xFFD4A574),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Text(
                'POPULAR',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.5,
                ),
              ),
            ),
          ),
        ),
    ],
  );
}
