import 'package:fitbit/src/config/routes/app_routes.dart';
import 'package:fitbit/src/core/utils/app_strings.dart';
import 'package:fitbit/src/features/auth/presentation/widgets/custom_text_button_large.dart';
import 'package:fitbit/src/features/auth/presentation/widgets/custom_title_and_subtitle.dart';
import 'package:flutter/material.dart';

class SuccessRegisterationScreen extends StatelessWidget {
  const SuccessRegisterationScreen({super.key});

  Widget _buildFitBoyImage() {
    return SizedBox(
      width: 308.03,
      height: 236.49,
      child: Image.asset('assets/images/fit_boy3.png'),
    );
  }

  Widget _buildCenterText() {
    return const CustomTitleAndSubtitle(
      title: AppStrings.welcome,
      paddingHorizontalOfSubTitle: 50,
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
        padding: const EdgeInsets.only(top: 80, right: 30, left: 30),
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
