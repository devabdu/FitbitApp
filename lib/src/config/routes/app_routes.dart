import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:fitbit/src/app/dependency_injection.dart';
import 'package:fitbit/src/features/auth/presentation/controllers/login_controller/login_cubit.dart';
import 'package:fitbit/src/features/auth/presentation/controllers/register_controller/register_cubit.dart';
import 'package:fitbit/src/features/auth/presentation/controllers/user_controller/user_cubit.dart';
import 'package:fitbit/src/features/auth/presentation/ui/screens/login/login_screen.dart';
import 'package:fitbit/src/features/auth/presentation/ui/screens/onboarding/onboarding_screen1.dart';
import 'package:fitbit/src/features/auth/presentation/ui/screens/onboarding/onboarding_screen2.dart';
import 'package:fitbit/src/features/auth/presentation/ui/screens/register/register_screen1.dart';
import 'package:fitbit/src/features/auth/presentation/ui/screens/register/register_screen2.dart';
import 'package:fitbit/src/features/auth/presentation/ui/screens/register/success_registeration_screen.dart';
import 'package:fitbit/src/features/workout/presentation/pages/create_workouts/workouts_screen_1.dart';
import 'package:fitbit/src/features/workout/presentation/pages/create_workouts/workouts_screen_2.dart';
import 'package:fitbit/src/features/workout/presentation/pages/create_workouts/workouts_screen_3.dart';
import 'package:fitbit/src/features/workout/presentation/pages/create_workouts/workouts_screen_4.dart';
import 'package:fitbit/src/features/dashboard/presentation/screens/dashboard/history_workouts_screen.dart';
import 'package:fitbit/src/features/dashboard/presentation/screens/dashboard/home_screen.dart';
import 'package:fitbit/src/features/dashboard/presentation/screens/dashboard/notification_screen.dart';
import 'package:fitbit/src/features/dashboard/presentation/screens/dashboard/profile_screen.dart';
import 'package:fitbit/src/features/dashboard/presentation/screens/dashboard_view.dart';

import '../../features/auth/presentation/ui/screens/reset_password/reset_password_screen.dart';

class AppRoutesName {
  static const String onBoarding_1Route = "/onBoarding1";
  static const String onBoarding_2Route = "/onBoarding2";
  static const String loginRoute = "/login";
  static const String forgotPasswordRoute = "/forgot-password";
  static const String register_1Route = "/register1";
  static const String register_2Route = "/register2";
  static const String successRegisterationRoute = "/successRegisteration";
  static const String dashboardRoute = "/dashboard";
  static const String homeRoute = "/dashboard/home";
  static const String workouts_1Route = "/dashboard/workouts1";
  static const String workouts_2Route = "/workouts1/workouts2";
  static const String workouts_3Route = "/workouts2/workouts3";
  static const String workouts_4Route = "/workouts3/workouts4";
  static const String profileRoute = "/dashboard/profile";
  static const String notificationRoute = "/dashboard/notification";
  static const String historyWorkoutsRoute = "/dashboard/historyWorkouts";
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
      case AppRoutesName.loginRoute:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => serviceLocator<LoginCubit>(),
            child: const LoginScreen(),
          ),
        );
      case AppRoutesName.forgotPasswordRoute:
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: serviceLocator<LoginCubit>(),
            child: const ForgotPasswordScreen(),
          ),
        );
      case AppRoutesName.register_1Route:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => serviceLocator<RegisterCubit>(),
            child: const ReigsterScreen1(),
          ),
        );
      case AppRoutesName.register_2Route:
        final uid = routeSettings.arguments as String;
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => serviceLocator<RegisterCubit>(),
            child: RegisterScreen2(userId: uid),
          ),
        );
      case AppRoutesName.successRegisterationRoute:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => serviceLocator<UserCubit>(),
            child: const SuccessRegisterationScreen(),
          ),
        );
      case AppRoutesName.dashboardRoute:
        return MaterialPageRoute(
          builder: (_) => const DashboardView(),
        );
      case AppRoutesName.homeRoute:
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(),
        );
      case AppRoutesName.workouts_1Route:
        return MaterialPageRoute(
          builder: (_) => WorkoutsScreen1(),
        );
      case AppRoutesName.workouts_2Route:
        return MaterialPageRoute(
          builder: (_) => const WorkoutsScreen2(),
        );
      case AppRoutesName.workouts_3Route:
        return MaterialPageRoute(
          builder: (_) => const WorkoutsScreen3(),
        );
      case AppRoutesName.workouts_4Route:
        return MaterialPageRoute(
          builder: (_) => const WorkoutsScreen4(),
        );
      case AppRoutesName.historyWorkoutsRoute:
        return MaterialPageRoute(
          builder: (_) => HistoryWorkoutsScreen(),
        );
      case AppRoutesName.notificationRoute:
        return MaterialPageRoute(
          builder: (_) => const NotificationScreen(),
        );
      case AppRoutesName.profileRoute:
        return MaterialPageRoute(
          builder: (_) => const ProfileScreen(),
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
