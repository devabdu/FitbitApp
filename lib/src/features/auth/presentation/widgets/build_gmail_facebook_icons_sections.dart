import 'package:fitbit/src/core/utils/app_assets.dart';
import 'package:fitbit/src/core/utils/app_values.dart';
import 'package:fitbit/src/core/widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BuildGmailAndFacebookIconsSection extends StatelessWidget {
  const BuildGmailAndFacebookIconsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const CustomIconButton(
          assetImage: AppImagesSvg.gmailLogo,
        ),
        SizedBox(
          width: AppSize.s30.w,
        ),
        const CustomIconButton(
          assetImage: AppImagesSvg.facebookLogo,
        ),
      ],
    );
  }
}
