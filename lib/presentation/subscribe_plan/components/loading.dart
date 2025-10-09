part of '../plan_update.dart';



  Widget _buildShimmerCards() {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: ShimmerContainer(
                width: double.infinity,
                height: 140,
              ),
            ),
            SizedBox(width: 16),
            Expanded(
              child: ShimmerContainer(
                width: double.infinity,
                height: 140,
              ),
            ),
          ],
        ),
     vPad15,
        Row(
          children: [
            Expanded(child: SizedBox()),
            Expanded(
              flex: 2,
              child: ShimmerContainer(
                width: double.infinity,
                height: 140,
              ),
            ),
            Expanded(child: SizedBox()),
          ],
        ),
      ],
    );
  }


