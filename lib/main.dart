import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'application/auth/auth_controller.dart';
import 'presentation/landing/landing.dart';
import 'presentation/splash/view/splash_screen.dart';
import 'providers/daily_plan_provider.dart';
import 'translation/localization.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => LanguageProvider()),
        ChangeNotifierProvider(create: (context) => AuthController(context)),
        ChangeNotifierProvider(create: (context) => DailyPlanProvider(context)),

        // ChangeNotifierProxyProvider<LanguageProvider, DailyPlanProvider>(
        //   create: (_) => DailyPlanProvider(LanguageProvider()),
        //   update: (_, lang, p) =>p?? DailyPlanProvider(lang),
        // ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          scaffoldBackgroundColor: const Color(0xFF263133),
          //  backgroundColor: ,
          // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        home: const _Layout(),
      ),
    );
  }
}

class _Layout extends StatelessWidget {
  const _Layout();

  @override
  Widget build(BuildContext context) {
    final AuthController auth = context.watch();
    return auth.isLogin ? LandingView() : SplashScreen();
  }
}
