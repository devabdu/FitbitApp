import 'package:fitbit/src/core/utils/app_assets.dart';
import 'package:fitbit/src/core/widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';

class BuildGmailAndFacebookIconsSectionSubWidget extends StatelessWidget {
  const BuildGmailAndFacebookIconsSectionSubWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const CustomIconButton(
          assetImage: AppImagesSvg.gmailLogo,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width / 10,
        ),
        const CustomIconButton(
          assetImage: AppImagesSvg.facebookLogo,
        ),
      ],
    );
  }
}
