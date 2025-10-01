import 'package:flutter/material.dart';
import 'package:kenvinorellana/common/colors.dart';
import 'package:provider/provider.dart';

import 'application/auth/auth_controller.dart';
import 'presentation/landing/landing.dart';
import 'presentation/splash/view/splash_screen.dart';
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
        ChangeNotifierProvider(create: (context) => AuthController()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          scaffoldBackgroundColor: customWhite,
          // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        home: const SplashScreen(),
      ),
    );
  }
}
