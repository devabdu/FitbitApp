import 'package:fitbit/src/config/routes/app_routes.dart';
import 'package:fitbit/src/core/utils/resources/app_assets.dart';
import 'package:fitbit/src/core/utils/resources/app_font.dart';
import 'package:fitbit/src/core/utils/resources/app_strings.dart';
import 'package:fitbit/src/core/utils/resources/app_values.dart';
import 'package:fitbit/src/core/widgets/custom_app_bar.dart';
import 'package:fitbit/src/core/widgets/custom_positioned_button.dart';
import 'package:fitbit/src/core/widgets/custom_text_button.dart';
import 'package:fitbit/src/core/widgets/custom_title_and_subtitle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WorkoutsScreen4 extends StatelessWidget {
  const WorkoutsScreen4({super.key});

  PreferredSizeWidget? _buildAppBar() {
    return const CustomAppBar(
      isWithoutColorActions: true,
    );
  }

  Widget _buildFitBoyImage() {
    return SizedBox(
      height: AppSize.s326.h,
      width: AppSize.s290.w,
      child: Image.asset(AppImagesPng.finishWorkout),
    );
  }

  Widget _buildCenterText() {
    return CustomTitleAndSubtitle(
      title: AppStrings.congratulations,
      fontSizeTitle: AppFontSize.s30.sp,

      //paddingHorizontalOfSubTitle: 60,
      subTitle: AppStrings.youHaveFinishedYourWorkouts,
      fontSizeSubTitle: AppFontSize.s16.sp,
    );
  }

  Widget _buildGoToHomeButton(BuildContext context) {
    return CustomTextButton(
      onPressed: () {
        Navigator.pushNamed(context, AppRoutesName.dashboardRoute);
      },
      textButton: AppStrings.goToHome,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: _buildAppBar(),
        body: Stack(
          children: [
            Padding(
              padding: ConstEdgeInsetsGeometry.defaultPaddingWorkoutScreens,
              child: Center(
                child: Column(
                  children: [
                    _buildFitBoyImage(),
                    _buildCenterText(),
                  ],
                ),
              ),
            ),
            CustomPositionedButton(
              child: _buildGoToHomeButton(context),
            ),
          ],
        ),
      ),
    );
  }
}
