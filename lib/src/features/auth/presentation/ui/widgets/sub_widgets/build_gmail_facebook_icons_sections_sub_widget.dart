import 'package:fitbit/src/core/utils/app_assets.dart';
import 'package:fitbit/src/core/widgets/custom_icon_button.dart';
import 'package:fitbit/src/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BuildGmailAndFacebookIconsSectionSubWidget extends StatelessWidget {
  const BuildGmailAndFacebookIconsSectionSubWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final authCubit = BlocProvider.of<AuthCubit>(context);
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomIconButton(
              assetImage: AppImagesSvg.gmailLogo,
              onTap: state.isGmailLoading
                  ? () => CircularProgressIndicator
                  : () => authCubit.signInWithGmail(context),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width / 10,
            ),
            CustomIconButton(
                assetImage: AppImagesSvg.facebookLogo,
                onTap: state.isFacebookLoading
                    ? () => CircularProgressIndicator
                    : () => authCubit.signInWithFacebook(context)),
          ],
        );
      },
    );
  }
}
