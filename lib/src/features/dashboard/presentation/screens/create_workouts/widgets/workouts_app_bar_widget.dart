import 'package:fitbit/src/core/utils/app_icons.dart';
import 'package:fitbit/src/core/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class WorkoutsAppBar extends CustomAppBar {
  const WorkoutsAppBar({
    required this.titleAppBar,
    super.onPressed,
    super.key,
  });
  final String titleAppBar;

  @override
  Widget build(BuildContext context) {
    return CustomAppBar(
      title: Text(titleAppBar),
      icon: AppIcons.moreHorizOutlined,
    );
  }
}
