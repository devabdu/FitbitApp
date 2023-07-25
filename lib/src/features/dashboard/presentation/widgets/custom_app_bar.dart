import 'package:fitbit/src/core/utils/app_colors.dart';
import 'package:fitbit/src/core/utils/app_values.dart';
import 'package:fitbit/src/features/dashboard/presentation/widgets/custom_icon_with_background.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    this.automaticallyImplyLeading = true,
    this.backgroundColor = AppColors.background,
    this.elevation = AppElevation.e0,
    this.title,
    this.onPressed,
    this.icon,
    this.iconColor,
    this.isWithoutActions = false,
    this.isWithoutColorActions = false,
  });

  final bool automaticallyImplyLeading;
  final bool isWithoutActions;
  final bool isWithoutColorActions;
  final Color backgroundColor;
  final double elevation;
  final Text? title;
  final void Function()? onPressed;
  final IconData? icon;
  final Color? iconColor;

  Widget buildLeadingIcon() {
    return CustomIconWithBackground(
      child: Icon(
        Icons.arrow_back_ios_outlined,
        size: AppSize.s20.r,
        color: iconColor ?? AppColors.black,
      ),
    );
  }

  Widget buildActionIcon() {
    return CustomIconWithBackground(
      backgroundColor: AppColors.transparent,
      isWithOutBackGroundColor: isWithoutColorActions,
      child: IconButton(
        onPressed: onPressed,
        icon: Icon(
          icon,
          color: iconColor ?? AppColors.black,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppPadding.p10.w),
      child: AppBar(
        automaticallyImplyLeading: automaticallyImplyLeading,
        leading: automaticallyImplyLeading ? buildLeadingIcon() : null,
        backgroundColor: backgroundColor,
        elevation: elevation,
        title: title,
        actions: [
          !isWithoutActions
              ? buildActionIcon()
              : Container(
                  color: AppColors.error,
                ),
        ],
      ),
    );
  }
}
