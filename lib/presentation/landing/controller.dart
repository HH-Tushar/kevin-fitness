part of 'landing.dart';

class _LandingController extends ChangeNotifier {
  _LandingController({required this.context}) {
    // init();
  }
  int index = 0;

  changeIndex(int val) {
    index = val;
    notify();
  }

  final BuildContext context;

  //prepare data for early access
  // init()async {
  //   final language = Provider.of<LanguageProvider>(
  //     context,
  //     listen: false,
  //   ).currentLanguage;
  //   final token = Provider.of<AuthController>(
  //     context,
  //     listen: false,
  //   ).accessToken;

  //   //calling providers to get data ready
  //   if (token != null) {
  //    await Provider.of<DailyPlanProvider>(
  //       context,
  //       listen: false,
  //     ).fetchDailyPlan(token: token, language: language);
  //   }
  // }

  final List<Widget> children = [
    HomeScreen(),
    ChatScreen(),
    WorkOutTrackView(),
    PlanGeneratorView(),
    MealPlanDayScreen(),
  ];

  void notify() {
    if (hasListeners) notifyListeners();
  }
}
