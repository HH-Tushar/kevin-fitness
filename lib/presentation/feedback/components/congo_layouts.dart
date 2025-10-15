part of '../congratulation.dart';
  
  
  
  Widget _buildLoadingDialog(BuildContext context) {
    final LanguageProvider lan = context.watch();
    final translator = lan.feedbackTranslation;
    return Container(
      width: double.infinity,
      height: 580, // Updated to match main dialog height
      decoration: BoxDecoration(
        color: const Color(0xFF263133),
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
            ),
            SizedBox(height: 20),
            Text(
              // t('feedback.loading_achievements'),
              translator.loadingAchievements,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontFamily: 'Outfit',
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildErrorDialog(BuildContext context, String error) {
    final LanguageProvider lan = context.watch();
    final translator = lan.feedbackTranslation;
    return Container(
      width: double.infinity,
      height: 580, // Fixed height
      decoration: BoxDecoration(
        color: const Color(0xFF263133),
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error_outline, color: Colors.white, size: 48),
            const SizedBox(height: 16),
            Text(
              translator.failedLoadAchievements,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontFamily: 'Outfit',
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              translator.tryAgain,
              style: TextStyle(
                color: Colors.white.withOpacity(0.7),
                fontSize: 14,
                fontFamily: 'Outfit',
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: 120,
              height: 36,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).pop();
                  // context.pop();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF2D393A),
                  foregroundColor: const Color(0xFFCCD7D9),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                    side: const BorderSide(color: Color(0xFF616D6D), width: 1),
                  ),
                  elevation: 0,
                ),
                child: const Text(
                  'Done',
                  style: TextStyle(
                    color: Color(0xFFCCD7D9),
                    fontSize: 15,
                    fontFamily: 'Outfit',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

 