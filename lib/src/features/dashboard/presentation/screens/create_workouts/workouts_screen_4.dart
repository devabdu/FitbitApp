import 'package:fitbit/src/config/routes/app_routes.dart';
import 'package:fitbit/src/core/utils/app_font.dart';
import 'package:fitbit/src/core/utils/app_values.dart';
import 'package:fitbit/src/features/auth/presentation/widgets/custom_text_button_large.dart';
import 'package:fitbit/src/features/auth/presentation/widgets/custom_title_and_subtitle.dart';
import 'package:fitbit/src/features/dashboard/presentation/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class WorkoutsScreen4 extends StatelessWidget {
  const WorkoutsScreen4({super.key});

  PreferredSizeWidget? _buildAppBar() {
    return const CustomAppBar(
      isWithoutColorActions: true,
    );
  }

  Widget _buildFitBoyImage() {
    return SizedBox(
      height: 326,
      width: 290,
      child: Image.asset('assets/images/finish_workout.png'),
    );
  }

  Widget _buildCenterText() {
    return const CustomTitleAndSubtitle(
      title: "Congratulations",
      fontSizeTitle: AppFontSize.s30,

      //paddingHorizontalOfSubTitle: 60,
      subTitle: 'you have finished your Workout',
      fontSizeSubTitle: AppFontSize.s16,
    );
  }

  Widget _buildGoToHomeButton(BuildContext context) {
    return CustomTextButtonLarge(
      onPressed: () {
        Navigator.pushNamed(context, AppRoutesName.dashboardRoute);
      },
      textButton: 'Go To Home',
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
              padding: const EdgeInsets.symmetric(
                  horizontal: AppPadding.p30, vertical: AppPadding.p32),
              child: Center(
                child: Column(
                  children: [
                    _buildFitBoyImage(),
                    _buildCenterText(),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 60.0,
              right: 40,
              left: 40,
              child: _buildGoToHomeButton(context),
            ),
          ],
        ),
      ),
    );
  }
}
