import 'package:fitbit/src/features/auth/presentation/screens/onboarding/onboarding_screen1.dart';
import 'package:fitbit/src/features/auth/presentation/screens/onboarding/onboarding_screen2.dart';
import 'package:fitbit/src/features/auth/presentation/screens/register/register_screen.dart';
import 'package:flutter/material.dart';

class AppRoutesName {
  static const String onBoarding_1Route = "/onBoarding1";
  static const String onBoarding_2Route = "/onBoarding2";
  static const String registerRoute = "/register";
}

class AppRoutesGenerator {
  static Route<dynamic> generatePageRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case AppRoutesName.onBoarding_1Route:
        return MaterialPageRoute(
          builder: (_) => const OnBoardingScreen1(),
        );
      case AppRoutesName.onBoarding_2Route:
        return MaterialPageRoute(
          builder: (_) => const OnBoardingScreen2(),
        );
      case AppRoutesName.registerRoute:
        return MaterialPageRoute(
          builder: (_) => const ReigsterScreen(),
        );
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
      builder: ((context) => const Scaffold(
            body: Center(
              child: Text('No Route Found'),
            ),
          )),
    );
  }
}
