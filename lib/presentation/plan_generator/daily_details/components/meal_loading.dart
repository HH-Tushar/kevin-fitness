part of '../Meal_plan_daily.dart';

Widget _buildShimmerContent(BuildContext context) {
  return Stack(
    children: [
      // Top background image with overlay
      Positioned(
        left: 0,
        right: 0,
        top: 0,
        child: SizedBox(
          width: double.infinity,
          height: 213,
          child: Stack(
            children: [
              Positioned.fill(
                child: Image.asset(
                     "assets/images/meal_bg.png",
                  fit: BoxFit.cover,
                ),
              ),
              Positioned.fill(child: Container(color: const Color(0xC4131313))),
              Positioned(
                left: 20,
                top: 48,
                child: GestureDetector(
                  onTap: () => Navigator.of(context).pop(),
                  child: const Icon(
                    Icons.arrow_back_ios_new_rounded,
                    color: Colors.white,
                    size: 22,
                  ),
                ),
              ),
              Positioned(
                left: 40,
                top: 149,
                child: ShimmerContainer(
                  width: 100,
                  height: 20,
                  borderRadius: 8,
                ),
              ),
            ],
          ),
        ),
      ),
      // Macro summary card with shimmer
      Positioned(
        left: 0,
        right: 0,
        top: 198,
        child: Container(
          width: double.infinity,
          height: 94,
          decoration: BoxDecoration(
            color: const Color(0xFF2D393A),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(12),
              topRight: Radius.circular(12),
            ),
            boxShadow: [
              BoxShadow(
                color: const Color(0x26000000),
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 70,
            ).copyWith(top: 33),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _ShimmerMacroStat(),
                _ShimmerMacroStat(),
                _ShimmerMacroStat(),
              ],
            ),
          ),
        ),
      ),
      // Meal list with shimmer
      Positioned(
        left: 0,
        right: 0,
        top: 309,
        bottom: 0,
        child: ListView.builder(
          padding: const EdgeInsets.fromLTRB(10, 10, 10, 20),
          itemCount: 4,
          itemBuilder: (context, index) {
            return const Padding(
              padding: EdgeInsets.only(bottom: 12),
              child: _ShimmerMealCard(),
            );
          },
        ),
      ),
    ],
  );
}

class _ShimmerMacroStat extends StatelessWidget {
  const _ShimmerMacroStat();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ShimmerContainer(width: 60, height: 18, borderRadius: 8),
        const SizedBox(height: 2),
        ShimmerContainer(width: 50, height: 14, borderRadius: 8),
      ],
    );
  }
}

class _ShimmerMealCard extends StatelessWidget {
  const _ShimmerMealCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF2D393A),
        borderRadius: BorderRadius.circular(6),
        boxShadow: [
          BoxShadow(
            color: const Color(0x26000000),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          ShimmerContainer(width: 90, height: 90, borderRadius: 4),
          const SizedBox(width: 16),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ShimmerContainer(width: 80, height: 14, borderRadius: 4),
                  const SizedBox(height: 2),
                  ShimmerContainer(width: 120, height: 15, borderRadius: 4),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      ShimmerContainer(width: 40, height: 11, borderRadius: 4),
                      const SizedBox(width: 12),
                      ShimmerContainer(width: 50, height: 11, borderRadius: 4),
                      const SizedBox(width: 12),
                      ShimmerContainer(width: 40, height: 11, borderRadius: 4),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Row(
                    children: List.generate(4, (index) {
                      return Padding(
                        padding: EdgeInsets.only(right: index < 3 ? 16 : 0),
                        child: ShimmerContainer(
                          width: 40,
                          height: 11,
                          borderRadius: 4,
                        ),
                      );
                    }),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
