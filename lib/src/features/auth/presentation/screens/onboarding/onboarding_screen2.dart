import 'package:fitbit/src/config/routes/app_routes.dart';
import 'package:fitbit/src/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class OnBoardingScreen2 extends StatelessWidget {
  const OnBoardingScreen2({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              width: 448,
              height: 448,
              decoration: const BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius:
                    BorderRadius.only(bottomRight: Radius.circular(150)),
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    AppColors.lightPrimary,
                    AppColors.darkPrimary,
                  ],
                  stops: [
                    0.0,
                    1.0,
                  ],
                ),
              ),
              child: const Image(
                image: AssetImage('assets/images/fit_boy.png'),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Track Your Goal',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Don't worry if you have trouble determining your goals, We can help you determine your goals and track your goals",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ]),
            ),
          ],
        ),
        floatingActionButton: GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, AppRoutesName.register_1Route);
          },
          child: ClipOval(
            child: Stack(
              children: [
                Container(
                  width: 80,
                  height: 80,
                  decoration: const BoxDecoration(
                    color: Color(0xFFE2E2AC),
                    shape: BoxShape.circle,
                  ),
                ),
                Positioned.fill(
                  child: Align(
                    alignment: Alignment.center,
                    child: Container(
                      width: 80 * 0.8,
                      height: 80 * 0.8,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            AppColors.lightPrimary,
                            AppColors.darkPrimary,
                          ],
                          stops: [
                            0.0,
                            1.0,
                          ],
                        ),
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.arrow_right_rounded,
                          size: 50,
                          color: AppColors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
