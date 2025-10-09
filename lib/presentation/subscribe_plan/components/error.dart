part of '../plan_update.dart';



  Widget _buildErrorWidget(BuildContext context, String error,) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.error_outline,
            color: Colors.white,
            size: 48,
          ),
        //  vPad15,
        //   Text(
        //     LocalizationService.getText('upgrade_plan.error_loading', languageCode: currentLanguage),
        //     style: TextStyle(
        //       color: Colors.white,
        //       fontSize: 18,
        //       fontFamily: 'Outfit',
        //       fontWeight: FontWeight.w600,
        //     ),
        //   ),
        vPad10,
          Text(
            error,
            style: TextStyle(
              color: const Color(0xFFA0A0A6),
              fontSize: 14,
              fontFamily: 'Outfit',
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }