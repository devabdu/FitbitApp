import 'package:fitbit/src/core/utils/app_assets.dart';
import 'package:fitbit/src/core/utils/app_colors.dart';
import 'package:fitbit/src/core/utils/app_font.dart';
import 'package:fitbit/src/core/utils/app_icons.dart';
import 'package:fitbit/src/core/utils/app_strings.dart';
import 'package:fitbit/src/core/utils/app_values.dart';
import 'package:fitbit/src/features/dashboard/presentation/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HistoryWorkoutsScreen extends StatelessWidget {
  HistoryWorkoutsScreen({super.key});

  PreferredSizeWidget? _buildAppBar() {
    return CustomAppBar(
      title: const Text(
        AppStrings.historyWorkouts,
      ),
      onPressed: () {},
      icon: AppIcons.add,
    );
  }

  final List<String> workouts = [
    'Fullbody',
    'Leg',
    'Upperbody',
    'Fullbody',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: Padding(
        padding: ConstEdgeInsetsGeometry.defaultPaddingWorkoutScreens,
        child: ListView.builder(
          itemCount: workouts.length, // number of cards to display
          itemBuilder: (BuildContext context, int index) {
            return Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppSize.s16.r),
              ),
              child: Column(
                children: [
                  ListTile(
                    leading: SizedBox(
                      width: AppSize.s50.w,
                      height: AppSize.s50.h,
                      child: const CircleAvatar(
                        backgroundColor: AppColors.backGroundCircleAvatar,
                        backgroundImage:
                            AssetImage(AppImagesPng.absWorkoutIcon),
                      ),
                    ),
                    title: Text(
                      '${workouts[index]} Workout',
                      style: Theme.of(context).textTheme.labelSmall!.copyWith(
                            color: AppColors.title,
                            fontSize: AppFontSize.s14,
                          ),
                    ),
                    subtitle: Text("This is the subtitle of card $index"),
                    trailing: const Text('Delete'),
                    onTap: () {
                      // do something when the tile is tapped
                    },
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
