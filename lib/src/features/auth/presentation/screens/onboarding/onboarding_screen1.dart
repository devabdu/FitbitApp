import 'package:fitbit/src/config/routes/app_routes.dart';
import 'package:fitbit/src/core/utils/app_colors.dart';
import 'package:fitbit/src/core/utils/app_strings.dart';
import 'package:fitbit/src/features/auth/presentation/widgets/custom_text_button_large.dart';
import 'package:flutter/material.dart';

class OnBoardingScreen1 extends StatelessWidget {
  const OnBoardingScreen1({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 180),
      color: AppColors.background,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Image(
            image: AssetImage(
              'assets/images/dumbbell.png',
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            AppStrings.trackEasily,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(
            height: 200,
          ),
          CustomTextButtonLarge(
            onPressed: () {
              Navigator.pushNamed(context, AppRoutesName.onBoarding_2Route);
            },
            textButton: 'Get Started',
          ),
          // ElevatedButton(
          //   onPressed: () {
          //     Navigator.pushNamed(context, AppRoutesName.onBoarding_2Route);
          //   },
          //   style: ElevatedButton.styleFrom(
          //     shape: const RoundedRectangleBorder(
          //       borderRadius: BorderRadius.all(Radius.circular(15)),
          //     ),
          //     padding: const EdgeInsets.all(0),
          //   ),
          //   child: Ink(
          //     decoration: const BoxDecoration(
          //       gradient: LinearGradient(
          //         begin: Alignment.topLeft,
          //         end: Alignment.bottomRight,
          //         colors: [
          //           AppColors.lightPrimary,
          //           AppColors.darkPrimary,
          //         ],
          //         stops: [
          //           0.0,
          //           1.0,
          //         ],
          //       ),
          //       borderRadius: BorderRadius.all(Radius.circular(15)),
          //     ),
          //     child: Container(
          //       width: 315,
          //       height: 60,
          //       alignment: Alignment.center,
          //       child: const Text(
          //         'Get Started',
          //         style: TextStyle(
          //           color: Colors.white,
          //           fontSize: AppFontSize.s18,
          //           fontWeight: FontWeight.bold,
          //         ),
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
