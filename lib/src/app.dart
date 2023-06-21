import 'package:fitbit/src/config/routes/app_routes.dart';
import 'package:fitbit/src/features/auth/presentation/screens/onboarding/onboarding_screen1.dart';
import 'package:flutter/material.dart';
import 'config/theme/light_theme.dart';

class MyApp extends StatelessWidget {
  const MyApp._internal();

  static const MyApp _instance = MyApp._internal();

  factory MyApp() => _instance;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: appLightTheme(),
      home: const OnBoardingScreen1(),
      onGenerateRoute: AppRoutesGenerator.generatePageRoute,
      initialRoute: AppRoutesName.onBoarding_1Route,
    );
  }
}
