import 'package:fitbit/src/core/utils/app_font.dart';
import 'package:flutter/material.dart';

class CustomTitleAndSubtitle extends StatelessWidget {
  final String title;
  final String subTitle;
  final double paddingHorizontalOfSubTitle;
  final double? fontSizeTitle;
  final double? fontSizeSubTitle;

  const CustomTitleAndSubtitle({
    super.key,
    required this.title,
    required this.subTitle,
    this.paddingHorizontalOfSubTitle = 0,
    this.fontSizeTitle,
    this.fontSizeSubTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(fontSize: fontSizeTitle ?? AppFontSize.s20),
        ),
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: paddingHorizontalOfSubTitle),
          child: Text(
            subTitle,
            textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                .titleSmall!
                .copyWith(fontSize: fontSizeSubTitle ?? AppFontSize.s12),
          ),
        ),
      ],
    );
  }
}
