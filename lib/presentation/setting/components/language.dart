part of '../settings.dart';

_showLanguageModal({required BuildContext context}) async {
  final lan = Provider.of<LanguageProvider>(context, listen: false);
  await showModalBottomSheet(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
    ),
    backgroundColor: const Color(0xFF2D393A),
    context: context,
    builder: (context) => SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _languageOption(
              language: 'English',
              selected: lan.currentLanguage == 'english',
              onTap: () {
                Provider.of<LanguageProvider>(
                  context,
                  listen: false,
                ).toggleLanguage(true);
                Navigator.pop(context);
              },
            ),
            _languageOption(
              language: 'Spanish',
              selected: lan.currentLanguage == 'spanish',
              onTap: () {
                Provider.of<LanguageProvider>(
                  context,
                  listen: false,
                ).toggleLanguage(false);
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    ),
  );
}

// class _ShowLanguageModal extends StatelessWidget {
//   const _ShowLanguageModal({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Column(children: []);
//   }
// }

_languageOption({
  required String language,
  required bool selected,
  required VoidCallback onTap,
}) {
  return ListTile(
    onTap: onTap,
    leading: Icon(Icons.language, color: Colors.white, size: 22),
    title: Text(
      language,
      style: TextStyle(
        color: Colors.white,
        fontSize: 16,
        fontFamily: 'Outfit',
        fontWeight: FontWeight.w400,
      ),
    ),
    trailing: selected
        ? Icon(Icons.check_circle, color: const Color(0xFF8BF0E6), size: 22)
        : null,
  );
}
