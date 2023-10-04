import 'package:fitbit/src/core/utils/resources/app_colors.dart';
import 'package:fitbit/src/core/utils/resources/app_font.dart';
import 'package:fitbit/src/core/utils/resources/app_values.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomRichText extends StatelessWidget {
  const CustomRichText(
      {super.key,
      required this.mainText,
      required this.highlightText,
      required this.nextWidget});

  final String mainText;
  final String highlightText;
  final Widget nextWidget;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: mainText,
        style: TextStyle(
            color: AppColors.black,
            fontSize: AppFontSize.s18,
            height: AppSize.s1_5.h),
        children: [
          TextSpan(
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                Future.delayed(Duration.zero, () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => nextWidget),
                  );
                });
              },
            text: highlightText,
            style: const TextStyle(
              color: AppColors.purple,
            ),
          ),
        ],
      ),
    );
  }
}
