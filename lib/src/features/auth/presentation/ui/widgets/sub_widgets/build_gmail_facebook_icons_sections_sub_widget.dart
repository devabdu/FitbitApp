import 'package:fitbit/src/config/routes/app_routes.dart';
import 'package:fitbit/src/core/utils/helper/navigator.dart';
import 'package:fitbit/src/core/utils/helper/show_components/show_progress_indicator.dart';
import 'package:fitbit/src/core/utils/helper/show_components/show_snack_bar.dart';
import 'package:fitbit/src/core/utils/resources/app_assets.dart';
import 'package:fitbit/src/core/widgets/custom_icon_button.dart';
import 'package:fitbit/src/features/auth/presentation/controllers/login_controller/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BuildGmailAndFacebookIconsSectionSubWidget extends StatelessWidget {
  const BuildGmailAndFacebookIconsSectionSubWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final authCubit = BlocProvider.of<LoginCubit>(context);
    return BlocConsumer<LoginCubit, LoginState>(
      listenWhen: (previous, current) => previous != current,
      listener: (context, state) {
        if (state is SignInLoading) {
          showProgressIndicator(context);
        }
        if (state is SignInSuccess) {
          navigatePop(context);
          navigatePushNamed(context, AppRoutesName.dashboardRoute, '');
        }
        if (state is SignInError) {
          String message = (state).error;
          showSnackBar(context, message);
        }
      },
      buildWhen: (previous, current) => previous != current,
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomIconButton(
              assetImage: AppImagesSvg.gmailLogo,
              onTap: () => authCubit.signInWithGoogle(context),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width / 10,
            ),
            CustomIconButton(
                assetImage: AppImagesSvg.facebookLogo,
                onTap: () => authCubit.signInWithFacebook(context)),
          ],
        );
      },
    );
  }
}
