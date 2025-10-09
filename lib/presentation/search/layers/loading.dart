part of '../search_screen.dart';


class _MealListViewShimmer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 6,
      separatorBuilder: (_, __) => SizedBox(height: 14),
      itemBuilder: (context, i) {
        return Container(
          decoration: BoxDecoration(
            color: const Color(0xFF2D393A),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ShimmerContainer(
                width: 72,
                height: 72,
                borderRadius: 12,
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ShimmerContainer(
                        width: 120,
                        height: 16,
                        borderRadius: 4,
                      ),
                      SizedBox(height: 6),
                      ShimmerContainer(
                        width: 80,
                        height: 14,
                        borderRadius: 4,
                      ),
                      SizedBox(height: 8),
                      ShimmerContainer(
                        width: 100,
                        height: 12,
                        borderRadius: 4,
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 16),
                child: Column(
                  children: [
                    ShimmerContainer(
                      width: 60,
                      height: 60,
                      borderRadius: 4,
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _MealListViewError extends StatelessWidget {
  final String error;
  const _MealListViewError({required this.error});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.error_outline,
            color: Colors.white.withOpacity(0.7),
            size: 48,
          ),
          SizedBox(height: 16),
          Text(
            'Error loading recipes',
            style: TextStyle(
              color: Colors.white.withOpacity(0.7),
              fontSize: 18,
                fontFamily: 'Outfit',
            ),
          ),
          SizedBox(height: 8),
          Text(
            error,
            style: TextStyle(
              color: Colors.white.withOpacity(0.5),
              fontSize: 14,
              fontFamily: 'Outfit',
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}


