part of '../summery.dart';

Widget _buildShimmerContent(BuildContext context) {
  final LanguageProvider languageProvider = context.watch();
  final translator = languageProvider.summaryTranslation;
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
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

      Expanded(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: defaultPadding),
          child: Column(
            children: [
              // SizedBox(height: 16),
              // Weight chart shimmer
              ShimmerCard(width: double.infinity, height: 280, borderRadius: 8),
              SizedBox(height: 16),
              // Skinfold graph shimmer
              ShimmerCard(width: double.infinity, height: 200, borderRadius: 8),
              SizedBox(height: 16),
              // Adherence cards shimmer
              ShimmerCard(width: double.infinity, height: 80, borderRadius: 8),
              SizedBox(height: 12),
              ShimmerCard(width: double.infinity, height: 80, borderRadius: 8),
              SizedBox(height: 16),
              // Feedback section shimmer
              ShimmerCard(width: double.infinity, height: 150, borderRadius: 8),
              SizedBox(height: 32),
            ],
          ),
        ),
      ),
    ],
  );
}
