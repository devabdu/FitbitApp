import 'package:fitbit/src/config/routes/app_routes.dart';
import 'package:fitbit/src/core/utils/app_assets.dart';
import 'package:fitbit/src/core/utils/app_strings.dart';
import 'package:fitbit/src/core/utils/app_values.dart';
import 'package:fitbit/src/core/widgets/custom_text_button_large.dart';
import 'package:fitbit/src/core/widgets/custom_title_and_subtitle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SuccessRegisterationScreen extends StatelessWidget {
  const SuccessRegisterationScreen({super.key});

  Widget _buildFitBoyImage() {
    return SizedBox(
      width: AppSize.s308_03.w,
      height: AppSize.s236_49.h,
      child: Image.asset(AppImagesPng.fitBoy3),
    );
  }

  Widget _buildCenterText() {
    return CustomTitleAndSubtitle(
      title: AppStrings.welcome,
      paddingHorizontalOfSubTitle: AppPadding.p50.w,
      subTitle: AppStrings.youAreAllSet,
    );
  }

  Widget _buildGoToHomeButton(BuildContext context) {
    return CustomTextButtonLarge(
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
      body: Padding(
        padding: ConstEdgeInsetsGeometry.defaultPaddingAuth,
        child: Column(children: [
          _buildFitBoyImage(),
          const Spacer(flex: 3),
          _buildCenterText(),
          const Spacer(flex: 5),
          _buildGoToHomeButton(context),
          const Spacer(),
        ]),
      ),
    ));
  }
}
