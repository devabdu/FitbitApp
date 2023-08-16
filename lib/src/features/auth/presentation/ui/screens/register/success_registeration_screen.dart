import 'package:fitbit/src/config/routes/app_routes.dart';
import 'package:fitbit/src/core/utils/app_strings.dart';
import 'package:fitbit/src/core/utils/app_values.dart';
import 'package:fitbit/src/core/widgets/custom_text_button.dart';
import 'package:fitbit/src/core/widgets/custom_title_and_subtitle.dart';
import 'package:fitbit/src/features/auth/presentation/ui/widgets/build_fit_boy_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SuccessRegisterationScreen extends StatelessWidget {
  const SuccessRegisterationScreen({super.key});

  Widget _buildCenterText() {
    return CustomTitleAndSubtitle(
      title: AppStrings.welcome,
      paddingHorizontalOfSubTitle: AppPadding.p30.w,
      subTitle: AppStrings.youAreAllSet,
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
    double mediaQuerySizeOfHeight = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: ConstEdgeInsetsGeometry.defaultPaddingAuth,
          child: Column(
            children: [
              const BuildFitBoyImage(),
              SizedBox(height: mediaQuerySizeOfHeight / 15),
              _buildCenterText(),
              SizedBox(height: mediaQuerySizeOfHeight / 3),
              _buildGoToHomeButton(context),
            ],
          ),
        ),
      ),
    );
  }
}
