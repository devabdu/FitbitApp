import 'package:fitbit/src/config/routes/app_routes.dart';
import 'package:fitbit/src/core/utils/resources/app_assets.dart';
import 'package:fitbit/src/core/utils/resources/app_colors.dart';
import 'package:fitbit/src/core/utils/resources/app_font.dart';
import 'package:fitbit/src/core/utils/resources/app_strings.dart';
import 'package:fitbit/src/core/utils/resources/app_values.dart';
import 'package:fitbit/src/core/widgets/custom_text_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnBoardingScreen1 extends StatelessWidget {
  const OnBoardingScreen1({super.key});

  Widget _buildMainLogo() {
    return const Image(
      image: AssetImage(AppImagesPng.onBoardingLogo1),
    );
  }

  Widget _buildCenterText(BuildContext context) {
    return Text(
      AppStrings.trackEasily,
      style: Theme.of(context)
          .textTheme
          .titleMedium!
          .copyWith(fontSize: AppFontSize.s18.sp),
    );
  }

  Widget _buildGetStartedButton(BuildContext context) {
    return CustomTextButton(
      onPressed: () {
        Navigator.pushNamed(context, AppRoutesName.onBoarding_2Route);
      },
      textButton: AppStrings.getStarted,
    );
  }

  @override
  Widget build(BuildContext context) {
    var mediaQuerySizeOfHeight = MediaQuery.of(context).size.height;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: AppPadding.p30.w),
      color: AppColors.background,
      child: Column(
        children: [
          SizedBox(
            height: mediaQuerySizeOfHeight / 3,
          ),
          _buildMainLogo(),
          SizedBox(
            height: mediaQuerySizeOfHeight / 30,
          ),
          _buildCenterText(context),
          SizedBox(
            height: mediaQuerySizeOfHeight / 5,
          ),
          _buildGetStartedButton(context),
        ],
      ),
    );
  }
}
