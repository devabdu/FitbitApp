import 'package:fitbit/src/features/auth/presentation/widgets/sub_widgets/build_gmail_facebook_icons_sections_sub_widget.dart';
import 'package:fitbit/src/features/auth/presentation/widgets/sub_widgets/build_or_divider_sub_widget.dart';
import 'package:flutter/material.dart';

class BuildCombinationAuthIconsAndOrDividerWidget extends StatefulWidget {
  const BuildCombinationAuthIconsAndOrDividerWidget({super.key});

  @override
  State<BuildCombinationAuthIconsAndOrDividerWidget> createState() =>
      _BuildCombinationAuthIconsAndOrDividerWidgetState();
}

class _BuildCombinationAuthIconsAndOrDividerWidgetState
    extends State<BuildCombinationAuthIconsAndOrDividerWidget> {
  @override
  Widget build(BuildContext context) {
    double mediaQuerySizeOfHeight = MediaQuery.of(context).size.height;
    double divideScreenFromHeightBy30 = mediaQuerySizeOfHeight / 30;
    return Column(
      children: [
        SizedBox(height: divideScreenFromHeightBy30),
        const BuildOrDividerSubWidget(),
        SizedBox(height: divideScreenFromHeightBy30),
        const BuildGmailAndFacebookIconsSectionSubWidget(),
        SizedBox(height: divideScreenFromHeightBy30),
      ],
    );
  }
}
