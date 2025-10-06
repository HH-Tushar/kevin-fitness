part of '../Meal_plan_daily.dart';

Widget _buildErrorContent({required String error ,required BuildContext context,required String errorTranslator,required int day}) {
  return Scaffold(
    backgroundColor: const Color(0xFF263133),
    body: Stack(
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
                Positioned.fill(
                  child: Container(color: const Color(0xC4131313)),
                ),
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
                  child: Text(
                    'Day $day',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontFamily: 'Outfit',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        // Error content
        Positioned(
          left: 0,
          right: 0,
          top: 198,
          bottom: 0,
          child: Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Color(0xFF2D393A),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              ),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.error_outline,
                    color: Colors.redAccent,
                    size: 64,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    errorTranslator,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontFamily: 'Outfit',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 8),
                   Padding(
                    padding: EdgeInsets.symmetric(horizontal: 32),
                    child: Text(
                      error,
                      style: TextStyle(
                        color: Color(0xFFA0A0A6),
                        fontSize: 14,
                        fontFamily: 'Outfit',
                        fontWeight: FontWeight.w400,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
             
                ],
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
