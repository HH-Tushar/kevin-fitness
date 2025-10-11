part of '../summery.dart';

Widget _buildErrorContent(BuildContext context, String error,VoidCallback onTap) {
  final LanguageProvider languageProvider = context.watch();
  final translator = languageProvider.summaryTranslation;
  return SingleChildScrollView(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // SizedBox(height: 24),
        Row(
          children: [
            IconButton(
              onPressed: () => Navigator.of(context).pop(),
              icon: Icon(Icons.arrow_back, color: Colors.white),
            ),
            SizedBox(width: 8),
            Text(
              translator.summery,
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontFamily: 'Outfit',
                fontWeight: FontWeight.w500,
                letterSpacing: -0.1,
              ),
            ),
            const Spacer(),
            Icon(Icons.calendar_today_outlined, color: Colors.white, size: 20),
            hPad10,
          ],
        ),
        SizedBox(height: 100),
        Center(
          child: Column(
            children: [
              Icon(Icons.error_outline, color: Colors.redAccent, size: 64),
              SizedBox(height: 16),
              Text(
                'Error loading summary data',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontFamily: 'Outfit',
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 8),
              Text(
                error.toString(),
                style: TextStyle(
                  color: const Color(0xFFA0A0A6),
                  fontSize: 14,
                  fontFamily: 'Outfit',
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 24),
              ElevatedButton(
                onPressed:onTap,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF8BF0E6),
                  foregroundColor: const Color(0xFF263133),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text(
                  'Retry',
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'Outfit',
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
