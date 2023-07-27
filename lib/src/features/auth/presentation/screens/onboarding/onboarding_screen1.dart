import 'package:fitbit/src/config/routes/app_routes.dart';
import 'package:fitbit/src/core/utils/app_assets.dart';
import 'package:fitbit/src/core/utils/app_colors.dart';
import 'package:fitbit/src/core/utils/app_strings.dart';
import 'package:fitbit/src/core/utils/app_values.dart';
import 'package:fitbit/src/core/widgets/custom_text_button_large.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnBoardingScreen1 extends StatelessWidget {
  const OnBoardingScreen1({super.key});

  Widget _buildMainLogo() {
    return const Image(
      image: AssetImage(AppImagesPng.onBoardingLogo1),
    );
  }

  Widget _buildGetStartedButton(BuildContext context) {
    return CustomTextButtonLarge(
      onPressed: () {
        Navigator.pushNamed(context, AppRoutesName.onBoarding_2Route);
      },
      textButton: AppStrings.getStarted,
    );
  }

  Widget _buildCenterText(BuildContext context) {
    return Text(
      AppStrings.trackEasily,
      style: Theme.of(context).textTheme.titleMedium,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: AppSize.s180.h),
      color: AppColors.background,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _buildMainLogo(),
          SizedBox(
            height: AppSize.s10.h,
          ),
          _buildCenterText(context),
          SizedBox(
            height: AppSize.s200.h,
          ),
          _buildGetStartedButton(context),
        ],
      ),
    );
  }
}
