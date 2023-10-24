import 'package:fitbit/src/config/routes/app_routes.dart';
import 'package:fitbit/src/features/auth/presentation/ui/screens/onboarding/onboarding_screen1.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../config/theme/light_theme.dart';

class MyApp extends StatelessWidget {
  const MyApp._internal();

  static const MyApp _instance = MyApp._internal();

  factory MyApp() => _instance;

  static const Size defaultSize = Size(360, 690);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: defaultSize,
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: appLightTheme(),
          home: ScaffoldMessenger(
            child: child!,
          ),
          onGenerateRoute: AppRoutesGenerator.generatePageRoute,
          initialRoute: AppRoutesName.onBoarding_1Route,
        );
      },
      child: const OnBoardingScreen1(),
    );
  }
}
