// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:fitbit/src/core/utils/helper/show_components/show_progress_indicator.dart';
import 'package:fitbit/src/core/utils/helper/show_components/show_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:fitbit/src/config/routes/app_routes.dart';
import 'package:fitbit/src/core/utils/resources/app_strings.dart';
import 'package:fitbit/src/core/utils/resources/app_values.dart';
import 'package:fitbit/src/core/widgets/custom_text_button.dart';
import 'package:fitbit/src/core/widgets/custom_title_and_subtitle.dart';
import 'package:fitbit/src/features/auth/presentation/controllers/user_controller/user_cubit.dart';
import 'package:fitbit/src/features/auth/presentation/ui/widgets/build_fit_boy_image_widget.dart';

class SuccessRegisterationScreen extends StatelessWidget {
  const SuccessRegisterationScreen({super.key});

  Widget _buildCenterText() {
    return BlocBuilder<UserCubit, UserState>(
      builder: (context, state) {
        if (state is GetUserInfoLoading) {
        } else if (state is GetUserInfoSuccess) {
          return CustomTitleAndSubtitle(
            title: AppPharses().phraseConstruction(
              AppStrings.welcome,
              state.user.name,
            ),
            paddingHorizontalOfSubTitle: AppPadding.p30.w,
            subTitle: AppStrings.youAreAllSet,
          );
        } else if (state is GetUserInfoError) {
          String message = (state).error;
          showSnackBar(context, message);
          return SizedBox();
        }
        return SizedBox();
      },
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
