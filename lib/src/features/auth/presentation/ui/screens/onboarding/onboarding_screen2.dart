import 'package:fitbit/src/config/routes/app_routes.dart';
import 'package:fitbit/src/core/utils/resources/app_assets.dart';
import 'package:fitbit/src/core/utils/resources/app_colors.dart';
import 'package:fitbit/src/core/utils/resources/app_font.dart';
import 'package:fitbit/src/core/utils/resources/app_icons.dart';
import 'package:fitbit/src/core/utils/resources/app_strings.dart';
import 'package:fitbit/src/core/utils/resources/app_values.dart';
import 'package:fitbit/src/core/widgets/custom_floating_action_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnBoardingScreen2 extends StatelessWidget {
  const OnBoardingScreen2({super.key});

  Widget _buildMainImage() {
    return Container(
      width: AppSize.s400.w,
      height: AppSize.s430.h,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius:
            BorderRadius.only(bottomRight: Radius.circular(AppSize.s150.r)),
        gradient: AppLinearGradientColors.mainGradientColor,
      ),
      child: const Image(
        image: AssetImage(AppImagesPng.onBoardingLogo2),
      ),
    );
  }

  Widget _buildTextsSection(BuildContext context) {
    var contextTextTheme = Theme.of(context).textTheme;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppPadding.p24.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppStrings.trackYourGoal,
            style: contextTextTheme.titleLarge!
                .copyWith(fontSize: AppFontSize.s24.sp),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 100,
          ),
          Text(
            AppStrings.weCanHelpYou,
            style: contextTextTheme.titleMedium!
                .copyWith(fontSize: AppFontSize.s14.sp),
          ),
        ],
      ),
    );
  }

  Widget _buildFloatingActionButton(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(AppPadding.p12.r),
      child: CustomFloatingActionButton(
          iconWidget: Icon(
            AppIcons.arrowRight,
            size: AppSize.s24.r,
            color: AppColors.white,
          ),
          nextRoutName: AppRoutesName.loginRoute),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          _buildMainImage(),
          SizedBox(
            height: MediaQuery.of(context).size.height / 13,
          ),
          _buildTextsSection(context),
        ],
      ),
      floatingActionButton: _buildFloatingActionButton(context),
    );
  }
}
