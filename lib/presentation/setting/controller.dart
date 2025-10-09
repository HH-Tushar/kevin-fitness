part of 'settings.dart';

class _SettingsController extends ChangeNotifier {
  _SettingsController({required this.context});
  final BuildContext context;

  void changeLanguage() async {
    await showModalBottomSheet(
      context: context,
      builder: (context) => Column(
        
        mainAxisSize: MainAxisSize.min,
        children: [



  ],),
    );
  }







  void _showLogoutDialog({required BuildContext context,required String title,required String content,required String cancel,required String logout}) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: const Color(0xFF2D393A),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          title: Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontFamily: 'Outfit',
              fontWeight: FontWeight.w700,
            ),
          ),
          content: Text(
         content,
            style: TextStyle(
              color: Colors.white,
              fontSize: 15,
              fontFamily: 'Outfit',
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text(
                cancel,
                style: TextStyle(
                  color: const Color(0xFF8BF0E6),
                  fontSize: 15,
                  fontFamily: 'Outfit',
                ),
              ),
            ),
            TextButton(
              onPressed: () async {
                Navigator.of(context).pop();
                // Clear all secure storage data
                // await SecureStorageService.clearAll();
                // GoRouter.of(context).go('/login');
              },
              child: Text(
                logout,
                style: TextStyle(
                  color: Colors.redAccent,
                  fontSize: 15,
                  fontFamily: 'Outfit',
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        );
      },
    );
  }





}
