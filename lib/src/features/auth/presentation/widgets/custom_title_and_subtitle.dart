import 'package:fitbit/src/core/utils/app_font.dart';
import 'package:flutter/material.dart';

class CustomTitleAndSubtitle extends StatelessWidget {
  final String title;
  final String subTitle;

  const CustomTitleAndSubtitle({
    super.key,
    required this.title,
    required this.subTitle,
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
              .copyWith(fontSize: AppFontSize.s20),
        ),
        Text(
          subTitle,
          style: Theme.of(context)
              .textTheme
              .titleSmall!
              .copyWith(fontSize: AppFontSize.s12),
        ),
      ],
    );
  }
}
