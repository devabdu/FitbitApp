import 'package:fitbit/src/config/routes/app_routes.dart';
import 'package:fitbit/src/core/utils/app_assets.dart';
import 'package:fitbit/src/core/utils/app_colors.dart';
import 'package:fitbit/src/core/utils/app_strings.dart';
import 'package:fitbit/src/core/utils/app_values.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnBoardingScreen2 extends StatelessWidget {
  const OnBoardingScreen2({super.key});
  Container _buildMainImage() {
    return Container(
      width: AppSize.s488.w,
      height: AppSize.s488.h,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius:
            BorderRadius.only(bottomRight: Radius.circular(AppSize.s150.w)),
        gradient: const LinearGradient(
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
        image: AssetImage(AppImagesPng.onBoardingLogo2),
      ),
    );
  }

  Padding _buildTextsSection(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppPadding.p20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppStrings.trackYourGoal,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          SizedBox(
            height: AppSize.s10.h,
          ),
          Text(
            AppPharses().phraseConstruction(
                AppStrings.dontHaveAccount, AppStrings.weCanHelpYou),
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ],
      ),
    );
  }

  GestureDetector _buildFloatingActionButton(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, AppRoutesName.loginRoute);
      },
      child: ClipOval(
        child: Stack(
          children: [
            Container(
              width: AppSize.s80.w,
              height: AppSize.s80.h,
              decoration: const BoxDecoration(
                color: Color(0xFFE2E2AC),
                shape: BoxShape.circle,
              ),
            ),
            Positioned.fill(
              child: Align(
                alignment: Alignment.center,
                child: Container(
                  width: AppMultipliedSize.sizeOfSmallContainer.w,
                  height: AppMultipliedSize.sizeOfSmallContainer.h,
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
                  child: Center(
                    child: Icon(
                      Icons.arrow_right_rounded,
                      size: AppSize.s50.r,
                      color: AppColors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            _buildMainImage(),
            SizedBox(
              height: AppSize.s40.h,
            ),
            _buildTextsSection(context),
          ],
        ),
        floatingActionButton: _buildFloatingActionButton(context),
      ),
    );
  }
}
